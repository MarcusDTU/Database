import java.sql.*;
import java.util.List;
import java.util.Scanner;


public class Main {

    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Program argument not set. Please ensure that the relative path to the .csv file is set!");
            return;
        }
        String host = "localhost";      //Host is localhost (127.0.0.1)
        String port = "3306";           //MariaDB listens to port 3306 by default
        String database = "DKAvisen";   //Name of our database
        String cp = "utf8";             //Database codepage supporting Danish
        //Set username and password
        String username = "root";       //username for connection
        String password = "mypassword"; //Password for username

        if (args.length == 2) {
            if (args[1].equals("Custom") || args[1].equals("custom")) {
                Scanner scanner = new Scanner(System.in);
                System.out.println("Custom connection mode enabled.");
                System.out.println("Please enter host: ");
                host = scanner.nextLine();
                System.out.println("Please enter port number: ");
                port = scanner.nextLine();
                System.out.println("This program is designed to interact with the database DKAvisen. Please enter database name: ");
                database = scanner.nextLine();
                System.out.println("Please enter database username: ");
                username = scanner.nextLine();
                System.out.println("Please enter database password: ");
                password = scanner.nextLine();
            }
        }

        String url = "jdbc:mysql://" + host + ":" + port + "/" + database + "?characterEncoding=" + cp;
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            PhotosAndReportersLoader loader = new PhotosAndReportersLoader();
            List<PhotoAndReporter> photosAndReporters = loader.loadPhotosAndReporters(args[0]);
            String duplicatePrimaryKey = "The following rows contained duplicate primary keys: ";
            Boolean duplicate = false;
            int index = 0;
            for(PhotoAndReporter photoAndReporter: photosAndReporters){
                if(reporterExists(photoAndReporter.getReporter().getCPR(), connection)) {
                    //Prepared statement for journalist
                    PreparedStatement statementReporter = connection.prepareStatement("Insert Journalist VALUES (?,?,?,?,?,?,?,?,?,?,?)");
                    statementReporter.setString(1, photoAndReporter.getReporter().getCPR());
                    statementReporter.setString(2, photoAndReporter.getReporter().getFirstName());
                    statementReporter.setString(3, photoAndReporter.getReporter().getMiddleName());
                    statementReporter.setString(4, photoAndReporter.getReporter().getLastName());
                    statementReporter.setString(5, photoAndReporter.getReporter().getStreetName());
                    statementReporter.setInt(6, photoAndReporter.getReporter().getCivicNumber());
                    statementReporter.setString(7, photoAndReporter.getReporter().getCity());
                    statementReporter.setString(8, photoAndReporter.getReporter().getZIPCode());
                    statementReporter.setString(9, photoAndReporter.getReporter().getWorkPhoneNum());
                    statementReporter.setString(10, photoAndReporter.getReporter().getPrivatePhoneNum());
                    statementReporter.setString(11, photoAndReporter.getReporter().getEmail());
                    statementReporter.execute();
                }
                else {
                    duplicate = true;
                    duplicatePrimaryKey = duplicatePrimaryKey + "\nRow " + index + " journalist exists";
                }
                if (photoExists(photoAndReporter.getPhoto().getTitle(), connection)) {
                    //Prepared statement for photo
                    PreparedStatement statementPhoto = connection.prepareStatement("Insert Photo VALUES (?,?,?)");
                    statementPhoto.setString(1, photoAndReporter.getPhoto().getTitle());
                    statementPhoto.setDate(2, new java.sql.Date(photoAndReporter.getPhoto().getDate().getTime()));
                    statementPhoto.setString(3, photoAndReporter.getPhoto().getCprNo());
                    statementPhoto.execute();
                }
                else {
                    duplicate = true;
                    duplicatePrimaryKey = duplicatePrimaryKey + "\nRow " + index + " photo title exists";
                }
                index++;
            }
            if (duplicate) {
                System.out.println(duplicatePrimaryKey);
            }
            connection.close();
            
        }
        catch (Exception e){
            e.printStackTrace();
        }
 
    }
    public static boolean reporterExists(String cpr, Connection connection) {
        try {
            Statement statement = connection.createStatement();
            PreparedStatement reporterExists = connection.prepareStatement("SELECT * FROM Journalist WHERE CPR_No = ?");
            reporterExists.setString(1, cpr);
            ResultSet resultSet = reporterExists.executeQuery();
            if (resultSet.next()) {
                return false;
            }
            return true;

        }
        catch (Exception e) { e.printStackTrace();}
        return false;
    }

    public static boolean photoExists(String title, Connection connection) {
        try {
            Statement statement = connection.createStatement();
            PreparedStatement reporterExists = connection.prepareStatement("SELECT * FROM Photo WHERE Photo_Title = ?");
            reporterExists.setString(1, title);
            ResultSet resultSet = reporterExists.executeQuery();
            if (resultSet.next()) {
                return false;
            }
            return true;

        }
        catch (Exception e) { e.printStackTrace();}
        return false;
    }


}

import java.sql.*;
import java.util.List;


public class Main {

    public static void main(String[] args) {
        String host = "localhost";      //Host is localhost (127.0.0.1)
        String port = "3306";           //MariaDB listens to port 3306 by default
        String database = "DKAvisen";   //Name of our database
        String cp = "utf8";             //Database codepage supporting Danish
        //Set username and password
        String username = "root";       //username for connection
        String password = "mypassword"; //Password for username

        String url = "jdbc:mysql://" + host + ":" + port + "/" + database + "?characterEncoding=" + cp;
        try {
            Connection connection = DriverManager.getConnection(url, username, password);
            PhotosAndReportersLoader loader = new PhotosAndReportersLoader();
            List<PhotoAndReporter> photosAndReporters = loader.loadPhotosAndReporters(args[0]);
            for(PhotoAndReporter photoAndReporter: photosAndReporters){
                PreparedStatement statementReporter = connection.prepareStatement("Insert Journalist VALUES (?,?,?,?,?,?,NULL,?,?,?,?)");
                statementReporter.setString(1, photoAndReporter.getReporter().getCPR());
                statementReporter.setString(2, photoAndReporter.getReporter().getFirstName());
                statementReporter.setString(3, photoAndReporter.getReporter().getMiddleName());
                statementReporter.setString(4, photoAndReporter.getReporter().getLastName());
                statementReporter.setString(5, photoAndReporter.getReporter().getStreetName());
                statementReporter.setInt(6, photoAndReporter.getReporter().getCivicNumber());
                statementReporter.setString(7, photoAndReporter.getReporter().getZIPCode().toString());
                statementReporter.setString(8,photoAndReporter.getReporter().getWorkPhoneNum());
                statementReporter.setString(9,photoAndReporter.getReporter().getPrivatePhoneNum());
                statementReporter.setString(10,photoAndReporter.getReporter().getEmail());
                PreparedStatement statementPhoto = connection.prepareStatement("Insert Photo VALUES (?,?,?)");
                statementPhoto.setString(1, photoAndReporter.getPhoto().getTitle());
                statementPhoto.setDate(2, new java.sql.Date(photoAndReporter.getPhoto().getDate().getTime()));
                statementPhoto.setString(3,photoAndReporter.getPhoto().getCprNo());
                statementReporter.execute();
                statementPhoto.execute();
            }
            connection.close();
            
        }
        catch (Exception e){
            e.printStackTrace();
        }
 
    }


}

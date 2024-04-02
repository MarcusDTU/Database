import java.sql.*;
import java.util.Scanner;

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
            Scanner scanner = new Scanner(System.in, "CP850"); //Western Europe Console CodePage
            System.out.println("Type sql manipulation: ");
            String sqlManipulation = scanner.nextLine();
            scanner.close();
            //Get a connection.
            Connection connection = DriverManager.getConnection(url, username, password);
            // Check if the data already exists
            String checkIfExistsQuery = "SELECT COUNT(*) FROM Journalist WHERE"; //CPR = input
            Statement checkStatement = connection.createStatement();
            ResultSet resultSet = checkStatement.executeQuery(checkIfExistsQuery);

            // If count is zero, then the data doesn't exist and you can proceed with insertion
            if (resultSet.next() && resultSet.getInt(1) == 0) {
                // Data doesn't exist, proceed with insertion
                Statement statement = connection.createStatement();
                statement.executeUpdate(sqlManipulation);
                System.out.println("Data inserted successfully.");
            } else {
                System.out.println("Data already exists.");
            }

            // Close resources
            resultSet.close();
            checkStatement.close();
            connection.close();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }


}

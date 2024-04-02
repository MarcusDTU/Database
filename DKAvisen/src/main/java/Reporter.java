public class Reporter {

    private final String cpr;
    private final String firstName;
    private final String middleName;
    private final String lastName;
    private final String streetName;
    private final Integer civicNumber;

    private final String city;
    private final String zipCode;
    private final String workPhoneNum;

    private final String privatePhoneNum;

    private final String email;

    public Reporter(String cpr, String firstName, String middleName, String lastName, String streetName, Integer civicNumber, String city, String zipCode, String workPhoneNum, String privatePhoneNum, String email) {
        this.cpr = cpr;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.streetName = streetName;
        this.civicNumber = civicNumber;
        this.city = city;
        this.zipCode = zipCode;
        this.workPhoneNum = workPhoneNum;
        this.privatePhoneNum = privatePhoneNum;
        this.email = email;
    }

    public String getCPR() { return cpr; }

    public String getFirstName() {
        return firstName;
    }

    public String getMiddleName() {
        return middleName;
    }
 
    public String getLastName() {
        return lastName;
    }

    public String getStreetName() {
        return streetName;
    }

    public Integer getCivicNumber() {
        return civicNumber;
    }

    public String getCity() {return city;}

    public String getZIPCode() { return zipCode; }

    public String getWorkPhoneNum() {
        return workPhoneNum;
    }

    public String getPrivatePhoneNum() {
        return privatePhoneNum;
    }

    public String getEmail() {
        return email;
    }


    @Override
    public String toString() {
        final String D = ";";

        return getCPR() + D + getFirstName() + D + getMiddleName() + D + getLastName() + D + getStreetName() + D + getCivicNumber() + D + getZIPCode() + D + getWorkPhoneNum() + D + getPrivatePhoneNum() + D + getEmail();
    }

}


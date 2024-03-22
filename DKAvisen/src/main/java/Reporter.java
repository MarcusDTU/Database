public class Reporter {

    private final String cpr;
    private final String firstName;
    private final String middleName;
    private final String lastName;
    private final String streetName;
    private final Integer civicNumber;
    private final Integer zipCode;
    private final String country;

    public Reporter(String cpr, String firstName, String middleName, String lastName, String streetName, Integer civicNumber, Integer zipCode) {
        this.cpr = cpr;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.streetName = streetName;
        this.civicNumber = civicNumber;
        this.zipCode = zipCode;
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

    public Integer getZIPCode() { return zipCode; }

    public String getCountry() {
        return country;
    }


    @Override
    public String toString() {
        final String D = ";";

        return getCPR() + D + getFirstName() + D + getLastName() + D + getStreetName() + D + getCivicNumber() + D + getZIPCode() + D + getCountry();
    }

}


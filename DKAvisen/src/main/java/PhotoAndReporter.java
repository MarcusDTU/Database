import java.util.Date;

public class PhotoAndReporter {
	private final Reporter reporter;
	private final Photo photo;

	public PhotoAndReporter(String title, Date date, Integer cpr, String firstName, String middleName, String lastName, String streetName, Integer civicNumber, Integer zipCode, String workPhoneNum, String privatePhoneNum, String Email) {
		reporter = new Reporter(cpr, firstName, lastName, streetName, civicNumber, zipCode, );
		photo = new Photo(title, date);
	}

	public Reporter getReporter() {
		return reporter;
	}

	public Photo getPhoto() {
		return photo;
	}
}

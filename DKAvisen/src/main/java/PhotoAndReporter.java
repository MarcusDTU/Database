import java.util.Date;

public class PhotoAndReporter {
	private final Reporter reporter;
	private final Photo photo;

	public PhotoAndReporter(String title, Date date, String cpr, String firstName, String middleName, String lastName, String streetName, Integer civicNumber, Integer zipCode, String workPhoneNum, String privatePhoneNum, String email) {
		reporter = new Reporter(cpr, firstName, middleName, lastName, streetName, civicNumber, zipCode, workPhoneNum, privatePhoneNum, email);
		photo = new Photo(title, date, cpr);
	}

	public Reporter getReporter() {
		return reporter;
	}

	public Photo getPhoto() {
		return photo;
	}
}

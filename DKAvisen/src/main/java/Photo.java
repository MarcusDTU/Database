import java.text.SimpleDateFormat;
import java.util.Date;
public class Photo {
    private final String title;
    private final Date date;
    private final String cprNo;

    public Photo(String title, Date date, String cpr) {
        this.title = title;
        this.date = date;
        this.cprNo = cpr;
    }

    public String getTitle() {
        return title;
    }
    public Date getDate() { return date; }

    public String getCprNo() {
        return cprNo;
    }

    @Override
    public String toString() {
        final String D = ";";
        final SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyyMMdd");

        return getTitle() +D + dateFormatter.format(getDate()) + D + getCprNo();
    }

}
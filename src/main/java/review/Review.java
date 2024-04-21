package review;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int review_id;
    //private int user_id;
    private int post_id;
    private int writeuser_id;
    private int guestuser_id;
    private int rating;
    private String review_content;
    private Date review_date;
}

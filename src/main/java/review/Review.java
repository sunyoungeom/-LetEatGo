package review;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private int user_id;
    private int postId;
    private int writeUserId;
    private int guestUserId;
    private int rating;
    private String review;
    private Date reviewDate;
}
//review_id, user_id, rating, review_content, author
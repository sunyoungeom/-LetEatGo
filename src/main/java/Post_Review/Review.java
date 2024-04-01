package Post_Review;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
    private int reviewId;
    private int postId;
    private int writeUserId;
    private int guestUserId;
    private int rating;
    private String review;
    private Date reviewDate;
}
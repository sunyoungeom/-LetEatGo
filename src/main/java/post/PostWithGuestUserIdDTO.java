package post;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostWithGuestUserIdDTO {

    private int postId;
    private int writeUserId;
    private int guestUserId;
    private String title;
    private String content;
    private Date resistDate;
    private String expireDate;
    private int status;
    private String place;
    private int view;
    private int conversationGuestUserId;

    // Getters and setters
}

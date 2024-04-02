package post;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    private int post_Id;
    private int writeUser_Id;
    private int guestUser_Id;
    private String title;
    private String content;
    private Date resistDate;
    private Date expireDate;
    private int status;
 
}
package Post;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    private int postId;
    private int writeUserId;
    private int guestUserId;
    private String content;
    private Date resistDate;
    private Date expireDate;
    private String status;
    
}
package post;
import java.util.Date;

import com.google.protobuf.Timestamp;

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
    private String expireDate;
    private int status;
    private String place;
    private int view;
 
}
package user;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private String id;
    private String email;
    private String password;
    private Date join_date;
    private Date last_login;
    private String name;
    private String nickname;
    private String mbti;
    private String bloodtype;
    private int identifynumber;
    private int phonnumber;
	
    
    
}

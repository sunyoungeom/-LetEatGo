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
    private String password;
    private String email;
    private String name;
    private String nickname;
    private String identifynumber;
    private String phonenumber;
    private String address;
    private Date join_date;
    private int attendance;
    private String mbti;
    private String bloodtype;
}

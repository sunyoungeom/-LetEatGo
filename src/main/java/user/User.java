package user;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class User {
	private int user_id;
	private String id;
	private String password;
	private Date join_date;
	private int attendance;
	private String email;
	private String name;
	private String nickname;
	private String address;
	private String mbti;
	private String bloodtype;
	private String identifynumber;
	private String phonenumber;
//	private String profilePhotoPath;
	private String foodCategory;
	private String job;
}

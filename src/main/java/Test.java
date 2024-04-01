import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Scanner;

import DB.JDBCProgram;
import User.User;
import User.UserService;

public class Test {
	public static void main(String[] args) {
	JDBCProgram.getInstance();
	Scanner scan = new Scanner(System.in);
	UserService service = new UserService();
	 LocalDateTime currentDateTime = LocalDateTime.now();
     Timestamp timestamp = Timestamp.valueOf(currentDateTime);
	
	
	// service.addUser(new User("AAA", "AAA", "asdf",timestamp, timestamp, "AAA", "AAA", "eeee", "A", "9999999", "01012341233"));
	
	
	
	
	}
}

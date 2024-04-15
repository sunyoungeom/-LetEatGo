package websocket;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import user.User;

@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class Conversations {
	private int post_id;
	private int writeuser_id;
	private int guestuser_id;
	private int status;
	private String roomInTime;

	public void setRoomInTime(Timestamp roomInTime) {
		this.roomInTime = roomInTime.toString(); // Timestamp를 String으로 변환하여 저장
	}

	public String getRoomInTime() {
		return roomInTime;
	}
}

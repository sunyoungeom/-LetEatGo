package user;

import java.util.Map;

import lombok.Getter;

@Getter
public class UserAPIException extends RuntimeException {
	private int code;
	private Map<String, String> errors;
	
	public UserAPIException(String message, int code, Map<String, String> errors) {
		super(message);
		this.code = code;
		this.errors = errors;
	}

}

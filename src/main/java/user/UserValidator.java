package user;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UserValidator {
	public Map<String, String> validate(User user) {
		Map<String, String> errors = new HashMap<>();
System.out.println("확");
		checkIdNum(user.getIdentifynumber(), errors);
	checkName(user.getId(), errors);
		return errors;
	}

	private void checkIdNum(String identifynumber, Map<String, String> errors) {
		 if (identifynumber == null || identifynumber.isEmpty()) {
		        errors.put("emptyIdNumber", "주민등록번호가 비어 있습니다.");
		        return;
		    }
		    
		    // 입력값이 숫자가 아닌 문자를 포함하는지 여부를 판별하는 정규식 패턴
		    String pattern = "[^0-9]";
		    Pattern p = Pattern.compile(pattern);
		    Matcher m = p.matcher(identifynumber);

		    // 입력값의 마지막 숫자를 가져옴
		    char genderNum = identifynumber.charAt(identifynumber.length() - 1);

		    if (m.find()) {
		        // 숫자가 아닌 값이 있는 경우 1을 반환
		        errors.put("notNum", "주민번호는 숫자 값이어야 합니다.");
		    } else if (!(genderNum == '1' || genderNum == '2' || genderNum == '3' || genderNum == '4')) {
		        errors.put("notGenderNum", "주민번호 뒷자리는 1,2,3,4 중 하나의 값이어야 합니다.");
		    }

	}

	private void checkAge(int age, Map<String, String> errors) {
		if (age < 0) {
			errors.put("ageNegative", "나이 값은 0 이상이여야 합니다.");
		}
	}

	private void checkName(String id, Map<String, String> errors) {
	    if (id == null || id.trim().length() == 0) {
	        errors.put("idEmpty", "아이디 값이 필요합니다.");
	        return;
	    }

	    if (id.length() > 15) {
	        errors.put("idTooLong", "아이디는 15자를 초과할 수 없습니다.");
	    }

	    if (id.contains(" ")) {
	        errors.put("idSpace", "아이디는 공백을 포함할 수 없습니다.");
	    }

	    // ... 등등등
	}


}

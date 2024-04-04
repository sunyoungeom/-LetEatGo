package post;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class PostTag {
	private int post_tag_id;
	private int post_Id;
	private String budget;
	private int booze;
	private String age;
	private String gender;
	private String peopleLimit;
}

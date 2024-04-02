package post;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PostDTO {
	private int currentPage;
	private int itemsPerPage;
	private int totalPages;
	private List<Post> items;
}

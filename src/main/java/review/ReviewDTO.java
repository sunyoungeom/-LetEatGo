package review;


import java.util.List;

import lombok.Builder;
import lombok.Data;
import review.Review;

@Data
@Builder
public class ReviewDTO {
	private int currentPage;
	private int itemsPerPage;
	private int totalPages;
	private List<Review> items;
	
	
	@Override
	public String toString() {
		return "PostDTO [currentPage=" + currentPage + ", itemsPerPage=" + itemsPerPage + ", totalPages=" + totalPages
				+ ", items=" + items + "]";
	}
	
	
}

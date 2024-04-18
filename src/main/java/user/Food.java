package user;

public class Food {
	private String foodcategory;
	private String tastey;

	public Food(String foodcategory, String tastey) {
		super();
		this.foodcategory = foodcategory;
		this.tastey = tastey;
	}

	public Food() {
		super();
	}

	public String getFoodcategory() {
		return foodcategory;
	}

	public void setFoodcategory(String foodcategory) {
		this.foodcategory = foodcategory;
	}

	public String getTastey() {
		return tastey;
	}

	public void setTastey(String tastey) {
		this.tastey = tastey;
	}

	@Override
	public String toString() {
		return "Food [foodcategory=" + foodcategory + ", tastey=" + tastey + "]";
	}

}

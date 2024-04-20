package user;

public class Food {
	private String foodcategory;

	public Food(String foodcategory) {
		super();
		this.foodcategory = foodcategory;
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
	
	@Override
	public String toString() {
		return "Food [foodcategory=" + foodcategory + "]";
	}
}

package model;

public class Sales {
	
	private String item_id;
	private Integer total_quantity;
	private Integer total_sales;
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	public Integer getTotal_quantity() {
		return total_quantity;
	}
	public void setTotal_quantity(Integer total_quantity) {
		this.total_quantity = total_quantity;
	}
	public Integer getTotal_sales() {
		return total_sales;
	}
	public void setTotal_sales(Integer total_sales) {
		this.total_sales = total_sales;
	}
}

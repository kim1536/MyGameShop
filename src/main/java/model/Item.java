package model;


import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Item {
	@NotEmpty(message="상품번호를 입력하세요.")
	private String item_id;
	@NotEmpty(message="상품이름을 입력하세요.")
	private String item_name;
	@NotNull(message="가격을 입력하세요.")
	private Integer price;
	@NotEmpty(message="원산지를 입력하세요.")
	private String origin;
	@NotEmpty(message="제조업체를 입력하세요.")
	private String manufacturer;
	@NotEmpty(message="브랜드를 입력하세요.")
	private String brand;
	@NotEmpty(message="카테고리를 입력하세요.")
	private String category;
	private String picture_url;
	@NotEmpty(message="상품내용을 입력하세요.")
	private String context;
	private String reg_date;
	
	private MultipartFile image;

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPicture_url() {
		return picture_url;
	}

	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}
}

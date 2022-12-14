package kr.spring.review.vo;

import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;

public class ReviewVO {

	private int review_num;
	private int product_num;
	private int mem_num;
	@Min(0)
	@Max(5)
	private int score;
	@NotEmpty
	private String content;
	private Date reg_date;
	
	//member 
	private String id;
	
	//member_detail
	private byte[] photo;
	private String photo_name;
	
	//product
	private String product_name;

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getPhoto_name() {
		return photo_name;
	}

	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	@Override
	public String toString() {
		return "ReviewVO [review_num=" + review_num + ", product_num=" + product_num + ", mem_num=" + mem_num
				+ ", score=" + score + ", content=" + content + ", reg_date=" + reg_date + ", id=" + id
				+ ", photo_name=" + photo_name + ", product_name=" + product_name + "]";
	}
	
	
}

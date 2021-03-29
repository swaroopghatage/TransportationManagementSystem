package com.app.pojos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;



@Entity
@Table(name = "customers")
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer cId;
	@Column(length = 50)
	@NotBlank(message = "Name is mandatory")
	private String cName;
	@Column(length = 50, unique = true)
	@NotBlank(message = "Email is mandatory")
	private String cEmail;
	@Column(length = 20)
	@NotNull
	private String cPassword;
	
	//one customers has many orders
	@OneToMany(fetch = FetchType.EAGER,mappedBy = "customer",cascade = CascadeType.ALL,orphanRemoval = true)
	private List<Order> orderlist =new ArrayList<>();

	
	public Customer() {
	System.out.println("in cust");
	}

	public Customer(Integer cId, String cName, String cEmail, String cPassword, List<Order> orderlist) {
	super();
	this.cId = cId;
	this.cName = cName;
	this.cEmail = cEmail;
	this.cPassword = cPassword;
	this.orderlist = orderlist;
}



	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcEmail() {
		return cEmail;
	}

	public void setcEmail(String cEmail) {
		this.cEmail = cEmail;
	}

	public String getcPassword() {
		return cPassword;
	}

	public void setcPassword(String cPassword) {
		this.cPassword = cPassword;
	}

	public List<Order> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}

	@Override
	public String toString() {
		return "Customer [cId=" + cId + ", cName=" + cName + ", cEmail=" + cEmail + ", cPassword=" + cPassword
				+ "]";
	}

	
	
	

}

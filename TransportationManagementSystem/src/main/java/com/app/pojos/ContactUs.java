package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name = "contact_us")
public class ContactUs {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer uId;
	@Column(length = 30)
	@NotBlank(message = "Name is mandatory")
	private String uName;
	@Column(length = 30)
	@NotBlank(message = "Email is mandatory")
	private String uEmail;
	@Column(length = 10)
	private String uMobile;
	@Column(length = 50)
	private String message;

	public ContactUs() {
		System.out.println("in contact us");
	}

	public ContactUs(Integer uId, String uName, String uEmail, String uMobile, String message) {
		super();
		this.uId = uId;
		this.uName = uName;
		this.uEmail = uEmail;
		this.uMobile = uMobile;
		this.message = message;
	}

	public Integer getuId() {
		return uId;
	}

	public void setuId(Integer uId) {
		this.uId = uId;
	}

	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}

	public String getuMobile() {
		return uMobile;
	}

	public void setuMobile(String uMobile) {
		this.uMobile = uMobile;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "ContactUs [uId=" + uId + ", uName=" + uName + ", uEmail=" + uEmail + ", uMobile=" + uMobile
				+ ", message=" + message + "]";
	}
	
	
	
}

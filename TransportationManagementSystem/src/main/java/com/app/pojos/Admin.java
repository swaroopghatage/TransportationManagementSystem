package com.app.pojos;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "admin")
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer aId;
	@Column(length = 50)
	@NotBlank(message = "Name is mandatory")
	private String aName;
	@Column(length = 50, unique = true)
	@NotBlank(message = "Email is mandatory")
	 @NotNull
	private String aEmail;
	@Column(length = 20)
	 @NotNull
	private String password;
	
	public Admin() {
		System.out.println("in admin controlller");
	}


	public Admin(Integer aId, String aName, String aEmail, String password) {
		super();
		this.aId = aId;
		this.aName = aName;
		this.aEmail = aEmail;
		this.password = password;
	}


	public Integer getaId() {
		return aId;
	}


	public void setaId(Integer aId) {
		this.aId = aId;
	}


	public String getaName() {
		return aName;
	}


	public void setaName(String aName) {
		this.aName = aName;
	}


	public String getaEmail() {
		return aEmail;
	}


	public void setaEmail(String aEmail) {
		this.aEmail = aEmail;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	@Override
	public String toString() {
		return "Admin [aId=" + aId + ", aName=" + aName + ", aEmail=" + aEmail + "]";
	}
	

}

package hocng.entity;

import java.util.Date;

public class USERS {

	String Id;
	String Password;
	String Fullname;
	Date Birthday;
	boolean Gender;
	String Mobile;
	String Email;

	public USERS() {
		super();
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return Id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		Id = id;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return Password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		Password = password;
	}

	/**
	 * @return the fullname
	 */
	public String getFullname() {
		return Fullname;
	}

	/**
	 * @param fullname the fullname to set
	 */
	public void setFullname(String fullname) {
		Fullname = fullname;
	}

	/**
	 * @return the birthday
	 */
	public Date getBirthday() {
		return Birthday;
	}

	/**
	 * @param birthday the birthday to set
	 */
	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}

	/**
	 * @return the gender
	 */
	public boolean isGender() {
		return Gender;
	}

	/**
	 * @param gender the gender to set
	 */
	public void setGender(boolean gender) {
		Gender = gender;
	}

	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return Mobile;
	}

	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		Mobile = mobile;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return Email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		Email = email;
	}

	/**
	 * @return the role
	 */
	public boolean isRole() {
		return Role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(boolean role) {
		Role = role;
	}

	boolean Role;
}

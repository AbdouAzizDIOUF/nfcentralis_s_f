package com.example.springnfc.payload.request;

import javax.validation.constraints.NotBlank;

public class LoginRequest {

    private String username;

	@NotBlank
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "LoginRequest{" +
				"username='" + username + '\'' +
				", password='" + password + '\'' +
				'}';
	}
}

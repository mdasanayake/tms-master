package com.mimsoft.tms.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Role {
	@Id
	@GeneratedValue(
			strategy = GenerationType.AUTO)
	@Column(unique = true, nullable = false)
	private Integer roleid;

	@Column(nullable = false, length = 20)
	private String rolename;

	public final Integer getRoleid() {
		return roleid;
	}

	public final void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}

	public final String getRolename() {
		return rolename;
	}

	public final void setRolename(String rolename) {
		this.rolename = rolename;
	}


}

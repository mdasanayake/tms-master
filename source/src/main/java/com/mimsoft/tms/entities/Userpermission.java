package com.mimsoft.tms.entities;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Userpermission {
	@Id
	@GeneratedValue(
			strategy = GenerationType.AUTO)
	@Column(unique = true, nullable = false)
	private Integer permissionid;

	@Column(nullable = false)
	private Integer roleid;

}

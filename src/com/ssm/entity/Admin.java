package com.ssm.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="admin")
public class Admin {
	
	@KeySql(useGeneratedKeys=true)
	@Id
	
	private Integer adid;
	private String name;
	private String password;
	private String repassword;
	private String email;
	private String status;
	private String statuscode;
	private String code;
	private Date created;
	private Date updateed;
	private String clo1;
	private String clo2;
	private String clo3;
	private String clo4;

}

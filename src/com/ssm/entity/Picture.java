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
@Table(name="picture")
public class Picture {
	
	@KeySql(useGeneratedKeys=true)
	@Id
	
	private Integer picid;
	
	private Integer uid;
	
	private String picture;
	
	private Date created;
	
	private Date updateed;
	
	private String clo1;
	
	private String clo2;
	
	private String clo3;

}

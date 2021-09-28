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
@Table(name="information")
public class Information {
	
	@KeySql(useGeneratedKeys=true)
	@Id
	
	private Integer infoid;
	private Integer uid;
	private String username;
	private String information;
	private Date created;
	private Date updateed;
	private Integer tgid;
	private Integer fgid;
	private String clo1;
	private String clo3;

}

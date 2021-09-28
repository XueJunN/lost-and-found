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
@Table(name="collect")
public class Collect {
	
	@KeySql(useGeneratedKeys=true)
	@Id
	
	private Integer cid;
	private String goodname;
	private String picture;
	private String content;
	private Integer uid;
	private Integer tgid;
	private Date created;
	private Date updateed;
	private Integer fgid;
	private String clo1;
	private String clo2;
	private String clo3;
	private String clo4;

}

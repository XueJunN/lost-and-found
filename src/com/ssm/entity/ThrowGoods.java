package com.ssm.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="throwgoods")
public class ThrowGoods {
	@KeySql(useGeneratedKeys=true)
	@Id
	
	private Integer tgid;
	private String goodname;
	private String content;
	private String picture;
	private String classify;
	private Integer uid;
	private Date created;
	private Date updateed;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date publishdate;
	private Double price;
	private String status;
	private String place;
	private String phone;
	private String clo3;
	private String clo2;
	private String clo1;
	
	private Information information;
	private Collect collect;
	
	

}

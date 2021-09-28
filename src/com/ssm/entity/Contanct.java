package com.ssm.entity;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.excel.annotation.ExcelIgnore;
import com.alibaba.excel.annotation.ExcelProperty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="contanct")
public class Contanct {
	
	@KeySql(useGeneratedKeys=true)
	@Id
	
	@ExcelProperty("联系编码")
	private Integer pid;
	@ExcelProperty("联系用户编码")
	private Integer uid;
	@ExcelProperty("联系招领编码")
	private Integer fgid;
	@ExcelProperty("联系失物编码")
	private Integer tgid;
	@ExcelProperty("被举报联系电话")
	private String phone;
	@ExcelProperty("联系创建时间")
	private Date created;
	@ExcelProperty("联系举报时间")
	private Date updateed;
	@ExcelProperty("是否被举报（N为举报）")
	private String clo1;
	@ExcelProperty("举报人联系电话")
	private String clo2;
	@ExcelIgnore
	private String clo3;
	@ExcelIgnore
	private String clo4;

}

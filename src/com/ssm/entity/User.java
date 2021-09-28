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
@Table(name="user")
public class User {
	@KeySql(useGeneratedKeys=true)
	@Id
	
	@ExcelProperty("编号")
	private Integer uid;
	@ExcelProperty("用户名")
	private String username;
	@ExcelProperty("密码")
	private String password;
	@ExcelIgnore
	private String repassword;
	@ExcelProperty("邮箱")
	private String email;
	@ExcelIgnore
	private String phone;
	@ExcelProperty("创建时间")
	private Date created;
	@ExcelProperty("修改时间")
	private Date updateed;
	@ExcelProperty("是否激活")
	private String status;
	@ExcelProperty("邮箱编码")
	private String code;
	@ExcelProperty("是否存在(0代表注销，1代表没有注销，2代表用户违规被注销)")
	private String role;
	@ExcelIgnore
	private Integer col1;
	@ExcelProperty("是否需要激活（Y表示需要激活）")
	private String col2;
	@ExcelIgnore
	private String col3;

}

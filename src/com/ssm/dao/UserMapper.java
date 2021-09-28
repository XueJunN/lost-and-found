package com.ssm.dao;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ssm.entity.User;

import tk.mybatis.mapper.common.Mapper;

public interface UserMapper extends Mapper<User>{

	List<User> getAllUser(@Param("username") String username);
	
	int updateManyUser(@Param("uids") List<Integer> uids);


}

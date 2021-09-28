package com.ssm.service;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.User;

public interface UserService {
	
	boolean insertUser(User user);
	
	User login(User user);
	
	User selectUser(User user);
	
	boolean action(String code);
	
	boolean updatePassword(User user);
	
	int updateUserRole(User user);
	
	User selectOneUser(User user);
	
	List<User> getAllUser(String username);
	
	int deleteManyUser(List<Integer> uids);
	
	int updateManyUser(@Param("uids") List<Integer> uids);
	
	List<User> getexportUser();

}

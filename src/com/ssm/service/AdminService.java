package com.ssm.service;

import com.ssm.entity.Admin;

public interface AdminService {
	
	boolean insertAdmin(Admin admin);
	
	Admin login(Admin admin);
	
	Admin selectAdmin(Admin admin);
	
	boolean action(String code);
	
	int updateAdmin(Admin admin);

}

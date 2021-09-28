package com.ssm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.Information;

public interface InformationService {
	
	List<Information> getAll(String username);
	
	Information selectOne(Information information);
	
	int updateInfor(Information information);
	
	int approvedManyInformation(@Param("infoids") List<Integer> infoids);
	
	int notapprovedManyInformation(@Param("infoids") List<Integer> infoids);

}

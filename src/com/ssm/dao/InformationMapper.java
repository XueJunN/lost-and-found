package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.Information;

import tk.mybatis.mapper.common.Mapper;

public interface InformationMapper extends Mapper<Information> {

	List<Information> getAll(@Param("username")String username);
	
	int approvedManyInformation(@Param("infoids") List<Integer> infoids);
	
	int notapprovedManyInformation(@Param("infoids") List<Integer> infoids);

}

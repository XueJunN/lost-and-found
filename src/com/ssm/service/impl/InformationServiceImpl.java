package com.ssm.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.InformationMapper;
import com.ssm.entity.Information;
import com.ssm.service.InformationService;
@Service
public class InformationServiceImpl implements InformationService {
	
	@Autowired
	private InformationMapper informationMapper;

	@Override
	public List<Information> getAll(String username) {
		return informationMapper.getAll(username);
	}

	@Override
	public Information selectOne(Information information) {
		return informationMapper.selectByPrimaryKey(information);
	}

	@Transactional
	public int updateInfor(Information information) {
		return informationMapper.updateByPrimaryKey(information);
	}

	//批量通过
	@Override
	public int approvedManyInformation(List<Integer> infoids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer infoid:infoids){
			if(informationMapper.approvedManyInformation(infoids)>0){
				num++;
			}
		}
		if(num==infoids.size())
			return 1;
		else
		return 0;
	}

	@Override
	public int notapprovedManyInformation(List<Integer> infoids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer infoid:infoids){
			if(informationMapper.notapprovedManyInformation(infoids)>0){
				num++;
			}
		}
		if(num==infoids.size())
			return 1;
		else
		return 0;
	}


}

package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.CollectMapper;
import com.ssm.dao.FindGoodsMapper;
import com.ssm.dao.InformationMapper;
import com.ssm.entity.Collect;
import com.ssm.entity.FindGoods;
import com.ssm.entity.Information;
import com.ssm.service.FindGoodsService;
@Service
public class FindGoodsServiceImpl implements FindGoodsService {
	
	@Autowired
	FindGoodsMapper findGoodsMapper;
	@Autowired
	InformationMapper informationMapper;
	@Autowired
	CollectMapper collectMapper;

	@Override
	public List<FindGoods> getAll(String goodname) {
		return findGoodsMapper.getAll(goodname);
	}

	@Override
	public FindGoods selectOne(Integer fgid) {
		return findGoodsMapper.selectByPrimaryKey(fgid);
	}

	@Override
	public List<Information> selectAll() {
		return informationMapper.selectAll();
	}

	@Override
	public List<Information> select(Integer fgid) {
		Information information = new Information();
		information.setFgid(fgid);
		return informationMapper.select(information);
	}

	@Transactional
	public int insertInformation(Information information) {
		return informationMapper.insertSelective(information);
	}

	@Override
	public List<Collect> collectList(Integer uid) {
		Collect collect = new Collect();
		collect.setUid(uid);
		return collectMapper.select(collect);
	}

	@Override
	public int insertFg(FindGoods findGoods) {
		return findGoodsMapper.insertSelective(findGoods);
	}

	@Transactional
	public int updateFg(FindGoods findGoods) {
		return findGoodsMapper.updateByPrimaryKey(findGoods);
	}

	@Override
	public FindGoods selectOneFg(FindGoods findGoods) {
		return findGoodsMapper.selectByPrimaryKey(findGoods);
	}

	@Override
	public int approvedManyFg(List<Integer> fgids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer fgid:fgids){
			if(findGoodsMapper.approvedManyFg(fgids)>0){
				num++;
			}
		}
		if(num==fgids.size())
			return 1;
		else
		return 0;
	}

	@Override
	public int notapprovedManyFg(List<Integer> fgids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer fgid:fgids){
			if(findGoodsMapper.notapprovedManyFg(fgids)>0){
				num++;
			}
		}
		if(num==fgids.size())
			return 1;
		else
		return 0;
	}

}

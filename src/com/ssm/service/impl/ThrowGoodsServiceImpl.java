package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.CollectMapper;
import com.ssm.dao.InformationMapper;
import com.ssm.dao.ThrowGoodsMapper;
import com.ssm.entity.Collect;
import com.ssm.entity.Information;
import com.ssm.entity.ThrowGoods;
import com.ssm.service.ThrowGoodsService;
@Service
public class ThrowGoodsServiceImpl implements ThrowGoodsService{
	
	@Autowired
	ThrowGoodsMapper throwGoodsMapper;
	@Autowired
	InformationMapper informationMapper;
	@Autowired
	CollectMapper collectMapper;

	@Override
	public List<ThrowGoods> getAll(String goodname) {
		return throwGoodsMapper.getAll(goodname);
	}

	@Override
	public ThrowGoods selectOne(Integer tgid) {
		return throwGoodsMapper.selectByPrimaryKey(tgid);
	}

	@Override
	public List<Information> selectAll() {
		return informationMapper.selectAll();
	}

	@Override
	public List<Information> select(Integer tgid) {
		Information information = new Information();
		information.setTgid(tgid);
		return informationMapper.select(information);
	}

	@Transactional
	public int insertInformation(Information information) {
		return informationMapper.insertSelective(information);
	}

	@Override
	public List<Collect> collectList(Integer uid){ 
		Collect collect = new Collect();
		collect.setUid(uid);
		return collectMapper.select(collect);
	}

	@Override
	public int deleteTg(Integer tgid) {
		return throwGoodsMapper.deleteByPrimaryKey(tgid);
	}

	@Transactional
	public int insertTg(ThrowGoods throwGoods) {
		return throwGoodsMapper.insertSelective(throwGoods);
	}

	@Override
	public int updateTg(ThrowGoods throwGoods) {
		return throwGoodsMapper.updateByPrimaryKey(throwGoods);
	}

	@Override
	public ThrowGoods selectOneTg(ThrowGoods throwGoods) {
		return throwGoodsMapper.selectByPrimaryKey(throwGoods);
	}

	@Override
	public int approvedManyTg(List<Integer> tgids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer tgid:tgids){
			if(throwGoodsMapper.approvedManyTg(tgids)>0){
				num++;
			}
		}
		if(num==tgids.size())
			return 1;
		else
		return 0;
	}

	@Override
	public int notapprovedManyTg(List<Integer> tgids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer tgid:tgids){
			if(throwGoodsMapper.notapprovedManyTg(tgids)>0){
				num++;
			}
		}
		if(num==tgids.size())
			return 1;
		else
		return 0;
	}

}

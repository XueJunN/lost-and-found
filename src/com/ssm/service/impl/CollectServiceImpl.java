package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.CollectMapper;
import com.ssm.entity.Collect;
import com.ssm.service.CollectService;

@Service
public class CollectServiceImpl implements CollectService {
	
	@Autowired
	private CollectMapper collectMapper;

	@Transactional
	public int insrtCollect(Collect collect) {
		return collectMapper.insertSelective(collect);
	}

	@Override
	public Collect selectOne(Collect collect) {
		return collectMapper.selectOne(collect);
	}

	@Override
	public int delectCollect(Integer cid) {
		return collectMapper.deleteByPrimaryKey(cid);
	}

	@Override
	public int updatecollect(Collect collect) {
		return collectMapper.updateByPrimaryKey(collect);
	}

}

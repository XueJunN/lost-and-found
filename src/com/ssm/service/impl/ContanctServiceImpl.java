package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.ContanctMapper;
import com.ssm.entity.Contanct;
import com.ssm.service.ContanctService;
@Service
public class ContanctServiceImpl implements ContanctService {
	
	@Autowired
	private ContanctMapper contanctMapper;

	@Override
	public int insertContanct(Contanct contanct) {
		return contanctMapper.insert(contanct);
	}

	@Override
	public List<Contanct> selectAllContanct() {
		return contanctMapper.selectAll();
	}

	@Override
	public Contanct selsecContanct(Contanct contanct) {
		return contanctMapper.selectByPrimaryKey(contanct);
	}

	@Override
	public int updateContanct(Contanct contanct) {
		return contanctMapper.updateByPrimaryKey(contanct);
	}

}

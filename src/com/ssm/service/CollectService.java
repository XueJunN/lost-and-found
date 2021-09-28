package com.ssm.service;

import com.ssm.entity.Collect;

public interface CollectService {
	
	int insrtCollect(Collect collect);
	
	Collect selectOne(Collect collect);
	
	int delectCollect(Integer cid);
	
	int updatecollect(Collect collect);

}

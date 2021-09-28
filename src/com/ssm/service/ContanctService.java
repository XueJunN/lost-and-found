package com.ssm.service;

import java.util.List;

import com.ssm.entity.Contanct;

public interface ContanctService {
	
	int insertContanct(Contanct contanct);
	
	List<Contanct> selectAllContanct();
	
	Contanct selsecContanct(Contanct contanct);
	
	int updateContanct(Contanct contanct);

}

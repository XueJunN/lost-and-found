package com.ssm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.Collect;
import com.ssm.entity.FindGoods;
import com.ssm.entity.Information;

public interface FindGoodsService {
	
    List<FindGoods> getAll(@Param("goodname")String goodname);
	
	FindGoods selectOne(Integer fgid);
	
	List<Information> selectAll();
	
	List<Information> select(Integer fgid);
	
	int insertInformation(Information information);
	
	List<Collect> collectList(Integer uid);
	
	int insertFg(FindGoods findGoods);
	
	int updateFg(FindGoods findGoods);
	
	FindGoods selectOneFg(FindGoods findGoods);
	
    int approvedManyFg(@Param("fgids") List<Integer> fgids);
	
	int notapprovedManyFg(@Param("fgids") List<Integer> fgids);

}

package com.ssm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.Collect;
import com.ssm.entity.Information;
import com.ssm.entity.ThrowGoods;

public interface ThrowGoodsService {
	
	List<ThrowGoods> getAll(@Param("goodname")String goodname);
	
	ThrowGoods selectOne(Integer tgid);
	
	List<Information> selectAll();
	
	List<Information> select(Integer tgid);
	
	int insertInformation(Information information);
	
	List<Collect> collectList(Integer uid);
	
	int deleteTg(Integer tgid);
	
	int insertTg(ThrowGoods throwGoods);
	
	int updateTg(ThrowGoods throwGoods);
	
	ThrowGoods selectOneTg(ThrowGoods throwGoods);
	
    int approvedManyTg(@Param("tgids") List<Integer> tgids);
	
	int notapprovedManyTg(@Param("tgids") List<Integer> tgids);
	

}

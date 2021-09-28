package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.FindGoods;

import tk.mybatis.mapper.common.Mapper;

public interface FindGoodsMapper extends Mapper<FindGoods> {
	
	List<FindGoods> getAll(@Param("goodname")String goodname);
	
    int approvedManyFg(@Param("fgids") List<Integer> fgids);
	
	int notapprovedManyFg(@Param("fgids") List<Integer> fgids);

}

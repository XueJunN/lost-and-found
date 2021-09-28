package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.entity.ThrowGoods;

import tk.mybatis.mapper.common.Mapper;

public interface ThrowGoodsMapper extends Mapper<ThrowGoods> {

	List<ThrowGoods> getAll(@Param("goodname")String goodname);
	
    int approvedManyTg(@Param("tgids") List<Integer> tgids);
	
	int notapprovedManyTg(@Param("tgids") List<Integer> tgids);

}

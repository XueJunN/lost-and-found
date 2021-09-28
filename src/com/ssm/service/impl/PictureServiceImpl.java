package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.PictureMapper;
import com.ssm.entity.Picture;
import com.ssm.service.PictureService;
@Service
public class PictureServiceImpl implements PictureService {
	
	@Autowired
	private PictureMapper pictureMapper;

	@Transactional
	public int insertPicture(Picture picture) {
		return pictureMapper.insert(picture);
	}

	@Override
	public List<Picture> getAllPicture() {
		return pictureMapper.selectAll();
	}

	@Override
	public Picture selectOnePic(Picture picture) {
		return pictureMapper.selectByPrimaryKey(picture);
	}

	@Transactional
	public int UpdatePic(Picture picture) {
		return pictureMapper.updateByPrimaryKey(picture);
	}

}

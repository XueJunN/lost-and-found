package com.ssm.service;

import java.util.List;

import com.ssm.entity.Picture;

public interface PictureService {
	
	int insertPicture(Picture picture);
	
	List<Picture> getAllPicture();
	
	Picture selectOnePic(Picture picture);
	
	int UpdatePic(Picture picture);

}

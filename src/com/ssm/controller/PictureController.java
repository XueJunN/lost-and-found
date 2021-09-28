package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.Picture;
import com.ssm.entity.ThrowGoods;
import com.ssm.entity.User;
import com.ssm.service.PictureService;

@Controller
public class PictureController {
	
	@Autowired
	private PictureService pictureService;
	
//	@RequestMapping("/showpicture.do")
//	public ModelAndView getAllPicture(){
//		List<Picture> list = pictureService.getAllPicture();
//		if(list!=null){
//			return new ModelAndView("index","list",list);
//		}
//		return null;
//	}
	
	//替换原来的头像
	@RequestMapping("/updatepic.do")
	public ModelAndView updatePic(Picture picture) {
		Picture pic = pictureService.selectOnePic(picture);
		if (pic != null) {
			if (pic.getClo1() != null && !"null".equals(pic.getClo1()) && !"".equals(pic.getClo1())) {
				pic.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				pic.setClo1("N");
				pictureService.UpdatePic(pic);
			}
			return new ModelAndView("redirect:toLogin.do#touxiang2");
		}
		return null;
	}

}

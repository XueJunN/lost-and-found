package com.ssm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.Session;
import com.ssm.entity.Collect;
import com.ssm.service.CollectService;

@Controller
public class CollectController {
	
	@Autowired
	private CollectService collectService;
	
	//失物添加收藏
	@RequestMapping("doinsertcollect.do")
	public ModelAndView insertCollect(Collect collect,HttpSession session){
		Collect collect2 = new Collect();
		collect2.setTgid(collect.getTgid());
		collect2.setUid(collect.getUid());
//		Collect collect3 = new Collect();
//		collect2.setUid(collect.getUid());
		//Collect collect2 = collectService.selectOne(collect);
		//if(collectService.selectOne(collect2)==null||collectService.selectOne(collect3)==null){
		if(collectService.selectOne(collect2)==null){
		collect.setCreated(new java.sql.Date(new java.util.Date().getTime()));
		collect.setClo1("Y");
		int num = collectService.insrtCollect(collect);
		if(num>0){
			return new ModelAndView("information","msg","收藏成功");
		}
		}
			return new ModelAndView("collecterror");
	}
	
	//失物删除收藏
	@RequestMapping("delectCollect.do")
	public ModelAndView delectCollect(Collect collect){
		Collect collect2 = collectService.selectOne(collect);
		collect2.setClo1("N");
		int num = collectService.updatecollect(collect2);
		if(num>0){
			return new ModelAndView("information","msg","删除成功");
		}
		return null;
	}
	
	//招领添加收藏
		@RequestMapping("doinsertcollect1.do")
		public ModelAndView insertCollect1(Collect collect){
			Collect collect3 = new Collect();
			collect3.setFgid(collect.getFgid());
			collect3.setUid(collect.getUid());
			if(collectService.selectOne(collect)==null){
			collect.setCreated(new java.sql.Date(new java.util.Date().getTime()));
			collect.setClo1("Y");
			int num = collectService.insrtCollect(collect);
			if(num>0){
				return new ModelAndView("information","msg","收藏成功");
			}
			}
			return new ModelAndView("collecterror");
		}
		
		//招领删除收藏
		@RequestMapping("delectCollect1.do")
		public ModelAndView delectCollect1(Collect collect){
			Collect collect2 = collectService.selectOne(collect);
			collect2.setClo1("N");
			int num = collectService.updatecollect(collect2);
			if(num>0){
				return new ModelAndView("information","msg","删除成功");
			}
			return null;
		}

}

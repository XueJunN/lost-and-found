package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Information;
import com.ssm.service.InformationService;

@Controller
public class InformationController {
	
	@Autowired
	private InformationService informationService;
	
	//查看个人全部评论
	@RequestMapping("/docollectLogin.do")
	public ModelAndView getAllInfo(HttpSession session,
			@RequestParam(name = "username", required = false, defaultValue = "") String username,
			@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno){
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pno,20,"updateed desc");// 分页
		List<Information> list = informationService.getAll(username);
		PageInfo<Information> page = new PageInfo<Information>(list);
		mv.addObject("list", list);
		mv.addObject("page", page);
		mv.addObject("username", username);
		mv.addObject("pno", pno);
		mv.setViewName("admininfo");
		return mv;
	}
	
	//删除一条失物评论信息
	@RequestMapping("/deleteinfotg.do")
	public ModelAndView getdelete(Information information){
		Information info = informationService.selectOne(information);
		if(info!=null){
			if(info.getClo1()!=null&&!"null".equals(info.getClo1())&&!"".equals(info.getClo1())){
				info.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				info.setClo1("N");
				informationService.updateInfor(info);
			}
			return new ModelAndView("information","msg","删除成功");
		}
		return null;
	}
	
	//去修改失物评论页面
	@RequestMapping("/updateinfotgLogin.do")
	public ModelAndView getUpdate(Information information){
		Information info = informationService.selectOne(information);
		if(info!=null){
			return new ModelAndView("updateinfo","info",info);
		}
		return null;
	}
	
	//修改失物评论
	@RequestMapping("/toupdateinfotgLogin.do")
	public ModelAndView setUpdate(Information information){
		information.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
		int num = informationService.updateInfor(information);
		if(num>0){
			return new ModelAndView("forward:toGoodsDetailLogin.do");
		}
		return null;
	}
	
	
	//去修改招领评论页面
		@RequestMapping("/updateinfofg.do")
		public ModelAndView getUpdateFg(Information information){
			Information info = informationService.selectOne(information);
			if(info!=null){
				return new ModelAndView("updateinfofg","info",info);
			}
			return null;
		}
		
	//修改招领评论
	@RequestMapping("/toupdateinfofg.do")
	public ModelAndView setUpdateFg(Information information){
		information.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
		int num = informationService.updateInfor(information);
		if(num>0){
			return new ModelAndView("forward:toGoodsDetail1Login.do");
		}
		return null;
	}
	
	//审核通过
	@RequestMapping("/approvedinfomationLogin.do")
	public ModelAndView approvedInformation(Information information){
		Information info = informationService.selectOne(information);
		if(info!=null){
			if(info.getClo1()!=null&&!"null".equals(info.getClo1())&&!"".equals(info.getClo1())){
				info.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				info.setClo1("Y");
				informationService.updateInfor(info);
			}
			return new ModelAndView("redirect:docollectLogin.do");
		}
		return null;
	}
	
	//审核不通过
	@RequestMapping("/notapprovedinfomationLogin.do")
	public ModelAndView notapprovedInformation(Information information){
		Information info = informationService.selectOne(information);
		if(info!=null){
			if(info.getClo1()!=null&&!"null".equals(info.getClo1())&&!"".equals(info.getClo1())){
				info.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				info.setClo1("P");
				informationService.updateInfor(info);
			}
			return new ModelAndView("redirect:docollectLogin.do");
		}
		return null;
	}
	
	//批量通过
	@RequestMapping("/approvedManyLogin.do")
	public ModelAndView approvedManyInformation(String infoids) {
		// 1、声明一个集合装载切割的元素
		List<Integer> idlist = new ArrayList<Integer>();
		String[] idss = infoids.split(",");
		for (String infoid : idss) {
			idlist.add(Integer.parseInt(infoid));
		}
		// 2、调用业务处理
		if (idlist != null && idlist.size() > 0) {
			int num = informationService.approvedManyInformation(idlist);
			if (num > 0) { // 3、响应
				return new ModelAndView("redirect:docollectLogin.do");
			}
		}
		return null;
	}
	
	//批量不通过
	@RequestMapping("/notapprovedManyLogin.do")
	public ModelAndView notapprovedManyInformation(String infoids) {
		// 1、声明一个集合装载切割的元素
		List<Integer> idlist = new ArrayList<Integer>();
		String[] idss = infoids.split(",");
		for (String infoid : idss) {
			idlist.add(Integer.parseInt(infoid));
		}
		// 2、调用业务处理
		if (idlist != null && idlist.size() > 0) {
			int num = informationService.notapprovedManyInformation(idlist);
			if (num > 0) { // 3、响应
				return new ModelAndView("redirect:docollectLogin.do");
			}
		}
		return null;
	}
	

}

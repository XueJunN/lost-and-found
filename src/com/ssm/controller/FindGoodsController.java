package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Collect;
import com.ssm.entity.FindGoods;
import com.ssm.entity.Information;
import com.ssm.entity.Picture;
import com.ssm.service.FindGoodsService;
import com.ssm.service.PictureService;

@Controller
public class FindGoodsController {
	
	@Autowired
	private FindGoodsService findGoodsService;
	@Autowired
	private PictureService pictureService;
	
	//展示物品
		@RequestMapping("/toGoodsLogin.do")
		public ModelAndView getTGoods(Model model,Integer uid,HttpSession session,
				@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno,
				@RequestParam(name = "goodname", required = false, defaultValue = "") String goodname){
			ModelAndView mv = new ModelAndView();
			PageHelper.startPage(pno, 12,"updateed desc");// 分页
			List<FindGoods> flist = findGoodsService.getAll(goodname);
			List<Collect> list1 = findGoodsService.collectList(uid);
			List<Picture> list = pictureService.getAllPicture();
			PageInfo<FindGoods> page = new PageInfo<FindGoods>(flist);// 封装数据--分好页的数据
			mv.addObject("page", page);
			mv.addObject("flist", flist);
			mv.addObject("list1", list1);
			mv.addObject("list", list);
			mv.addObject("goodname", goodname);
			mv.addObject("pno", pno);
			mv.setViewName("goods");
			return mv;
		}
		
		//物品详情
		@RequestMapping("toGoodsDetail1Login.do")
		public ModelAndView getSelectOne(Integer fgid,HttpSession session,Integer uid){
			ModelAndView mv = new ModelAndView();
			FindGoods fg = findGoodsService.selectOne(fgid);
			List<Information> list = findGoodsService.select(fgid);
			List<Collect> list2 = findGoodsService.collectList(uid);
			session.setAttribute("findGoods", fg);
			mv.addObject("fg", fg);
			mv.addObject("list", list);
			mv.addObject("list2", list2);
			mv.setViewName("product-details1");
			return mv;
		}
		
		//发布评论
		@RequestMapping("insertInfo1.do")
		public ModelAndView insertInformation(Information information){
			information.setCreated(new java.sql.Date(new java.util.Date().getTime()));
			information.setClo1("M");
			int num = findGoodsService.insertInformation(information);
			if(num>0){
				return new ModelAndView("information","msg","发布成功");
			}
			return null;
		}
		
		
		//用户中心展示全部招领
		@RequestMapping("/tomycountfgLogin.do")
		public ModelAndView selectAllFg(
				@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno,
				@RequestParam(name = "goodname", required = false, defaultValue = "") String goodname){
			ModelAndView mv = new ModelAndView();
			PageHelper.startPage(pno, 9,"updateed desc");// 分页
			List<FindGoods> list = findGoodsService.getAll(goodname);
			PageInfo<FindGoods> page = new PageInfo<FindGoods>(list);// 封装数据--分好页的数据
			mv.addObject("page", page);
			mv.addObject("list", list);
			mv.addObject("goodname", goodname);
			mv.setViewName("mycountfindgoods");
			return mv;
		}
		
		//删除招领启示
		@RequestMapping("/deleteFg.do")
		public ModelAndView selectOneFg(FindGoods findGoods){
			FindGoods fg = findGoodsService.selectOneFg(findGoods);
			if(fg!=null){
				if(fg.getClo1()!=null&&!"null".equals(fg.getClo1())&&!"".equals(fg.getClo1())){
					fg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
					fg.setClo1("N");
					findGoodsService.updateFg(fg);
				}
				return new ModelAndView("redirect:tomycountfgLogin.do");
			}
			return null;
		}
		
		//去修改失物页面
		@RequestMapping("/updatefg.do")
		public ModelAndView updateFg(Integer fgid,HttpSession session){
			FindGoods fg = findGoodsService.selectOne(fgid);
			session.setAttribute("findGoods", fg);
			if(fg!=null){
				return new ModelAndView("updatefg","fg",fg);
			}
			return null;
		}
		
		//修改
		@RequestMapping("/updatefgs.do")
		public ModelAndView UpdateFgs(FindGoods findGoods,HttpServletRequest request){
			findGoods.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
			String st = request.getParameter("classifyList");
			findGoods.setClassify(st);
			findGoods.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
			findGoods.setClo1("M");
			int num = findGoodsService.updateFg(findGoods);
			if(num>0){
				return new ModelAndView("redirect:tomycountfgLogin.do");
			}
			return null;
		}
		
		//去修改失物图片页面
		@RequestMapping("/updatefgpic.do")
		public ModelAndView updateFgPic(Integer fgid,HttpSession session){
			FindGoods fg = findGoodsService.selectOne(fgid);
			if(fg!=null){
				return new ModelAndView("updatefgpic","fg",fg);
			}
			return null;
		}
		
		// 用户中心管理展示全部招领
		@RequestMapping("/toadminfgLogin.do")
		public ModelAndView selectadminAllFg(@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno,
				@RequestParam(name = "goodname", required = false, defaultValue = "") String goodname) {
			ModelAndView mv = new ModelAndView();
			PageHelper.startPage(pno, 9, "updateed desc");// 分页
			List<FindGoods> all = findGoodsService.getAll(goodname);
			PageInfo<FindGoods> page = new PageInfo<FindGoods>(all);// 封装数据--分好页的数据
			mv.addObject("page", page);
			mv.addObject("all", all);
			mv.addObject("goodname", goodname);
			mv.setViewName("adminfg");
			return mv;
		}
		
		//审核通过招领启示
		@RequestMapping("/adminapprovedfgLogin.do")
		public ModelAndView adminApprovedFgLogin(FindGoods findGoods){
			FindGoods fg = findGoodsService.selectOneFg(findGoods);
			if(fg!=null){
				if(fg.getClo1()!=null&&!"null".equals(fg.getClo1())&&!"".equals(fg.getClo1())){
					fg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
					fg.setClo1("Y");
					findGoodsService.updateFg(fg);
				}
				return new ModelAndView("redirect:toadminfgLogin.do");
			}
			return null;
		}
		
		//审核不通过招领启示
		@RequestMapping("/adminnotapprovedfgLogin.do")
		public ModelAndView adminNotApprovedFgLogin(FindGoods findGoods){
			FindGoods fg = findGoodsService.selectOneFg(findGoods);
			if(fg!=null){
				if(fg.getClo1()!=null&&!"null".equals(fg.getClo1())&&!"".equals(fg.getClo1())){
					fg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
					fg.setClo1("P");
					findGoodsService.updateFg(fg);
				}
				return new ModelAndView("redirect:toadminfgLogin.do");
			}
			return null;
		}
		
		//审核不通过重新审核招领启示
		@RequestMapping("/adminreapprovedfgLogin.do")
		public ModelAndView adminreApprovedFgLogin(FindGoods findGoods){
			FindGoods fg = findGoodsService.selectOneFg(findGoods);
			if(fg!=null){
				if(fg.getClo1()!=null&&!"null".equals(fg.getClo1())&&!"".equals(fg.getClo1())){
					fg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
					fg.setClo1("M");
					findGoodsService.updateFg(fg);
				}
				return new ModelAndView("redirect:tomycountfgLogin.do");
			}
			return null;
		}
		
		//批量通过
		@RequestMapping("/approvedManyFgLogin.do")
		public ModelAndView approvedManyFg(String fgids) {
			// 1、声明一个集合装载切割的元素
			List<Integer> idlist = new ArrayList<Integer>();
			String[] idss = fgids.split(",");
			for (String fgid : idss) {
				idlist.add(Integer.parseInt(fgid));
			}
			// 2、调用业务处理
			if (idlist != null && idlist.size() > 0) {
				int num = findGoodsService.approvedManyFg(idlist);
				if (num > 0) { // 3、响应
					return new ModelAndView("redirect:toadminfgLogin.do");
				}
			}
			return null;
		}
		
		//批量不通过
		@RequestMapping("/notapprovedManyFgLogin.do")
		public ModelAndView notapprovedManyFg(String fgids) {
			// 1、声明一个集合装载切割的元素
			List<Integer> idlist = new ArrayList<Integer>();
			String[] idss = fgids.split(",");
			for (String fgid : idss) {
				idlist.add(Integer.parseInt(fgid));
			}
			// 2、调用业务处理
			if (idlist != null && idlist.size() > 0) {
				int num = findGoodsService.notapprovedManyFg(idlist);
				if (num > 0) { // 3、响应
					return new ModelAndView("redirect:toadminfgLogin.do");
				}
			}
			return null;
		}


}

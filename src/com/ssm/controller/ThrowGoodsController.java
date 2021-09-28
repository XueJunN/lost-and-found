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
import com.ssm.entity.Information;
import com.ssm.entity.Picture;
import com.ssm.entity.ThrowGoods;
import com.ssm.service.PictureService;
import com.ssm.service.ThrowGoodsService;

@Controller
public class ThrowGoodsController {

	@Autowired
	private ThrowGoodsService throwGoodsService;
	@Autowired
	private PictureService pictureService;

	// 展示物品
	@RequestMapping("/toLogin.do")
	public ModelAndView getAllTGoods(Model model, Integer uid,
			@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno,
			@RequestParam(name = "goodname", required = false, defaultValue = "") String goodname) {
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pno, 12, "updateed desc");// 分页
		List<ThrowGoods> tlist = throwGoodsService.getAll(goodname);
		List<Collect> list2 = throwGoodsService.collectList(uid);
		List<Picture> list = pictureService.getAllPicture();
		PageInfo<ThrowGoods> page = new PageInfo<ThrowGoods>(tlist);// 封装数据--分好页的数据
		mv.addObject("page", page);
		mv.addObject("tlist", tlist);
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.addObject("goodname", goodname);
		mv.addObject("pno", pno);
		mv.setViewName("index");
		return mv;
	}

	// 物品详情
	@RequestMapping("toGoodsDetailLogin.do")
	public ModelAndView getSelectOne(Integer tgid, HttpSession session, Integer uid) {
		ModelAndView mv = new ModelAndView();
		ThrowGoods tg = throwGoodsService.selectOne(tgid);
		List<Information> list = throwGoodsService.select(tgid);
		List<Collect> list2 = throwGoodsService.collectList(uid);
		List<Picture> list3 = pictureService.getAllPicture();
		session.setAttribute("throwGoods", tg);
		mv.addObject("tg", tg);
		mv.addObject("list", list);
		mv.addObject("list3", list);
		mv.addObject("list2", list2);
		mv.setViewName("product-details");
		return mv;
	}

	// 发布评论
	@RequestMapping("insertInfo.do")
	public ModelAndView insertInformation(Information information) {
		information.setCreated(new java.sql.Date(new java.util.Date().getTime()));
		information.setClo1("M");
		int num = throwGoodsService.insertInformation(information);
		if (num > 0) {
			return new ModelAndView("information", "msg", "发布成功");
		}
		return null;
	}

	// 用户中心展示全部失物
	@RequestMapping("/tomycountLogin.do")
	public ModelAndView selectAllTg(Integer tgid,
			@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno,
			@RequestParam(name = "goodname", required = false, defaultValue = "") String goodname) {
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pno, 9, "updateed desc");// 分页
		List<ThrowGoods> all = throwGoodsService.getAll(goodname);
		List<Information> list = throwGoodsService.select(tgid);
		PageInfo<ThrowGoods> page = new PageInfo<ThrowGoods>(all);// 封装数据--分好页的数据
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.addObject("all", all);
		mv.addObject("goodname", goodname);
		mv.setViewName("mycountthrowgoods");
		return mv;
	}

	// 删除自己发布的失物启示
	@RequestMapping("/deleteTg.do")
	public ModelAndView deleteTg(ThrowGoods throwGoods) {
		ThrowGoods tg = throwGoodsService.selectOneTg(throwGoods);
		if (tg != null) {
			if (tg.getClo1() != null && !"null".equals(tg.getClo1()) && !"".equals(tg.getClo1())) {
				tg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				tg.setClo1("N");
				throwGoodsService.updateTg(tg);
			}
			return new ModelAndView("redirect:tomycountLogin.do");
		}
		return null;
	}

	// 去修改失物页面
	@RequestMapping("/updatetg.do")
	public ModelAndView updateTg(Integer tgid, HttpSession session) {
		ThrowGoods tg = throwGoodsService.selectOne(tgid);
		session.setAttribute("throwGoods", tg);
		if (tg != null) {
			return new ModelAndView("updatetg", "tg", tg);
		}
		return null;
	}

	// 修改
	@RequestMapping("/updatetgs.do")
	public ModelAndView UpdateTgs(ThrowGoods throwGoods, HttpServletRequest request) {
		throwGoods.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
		String st = request.getParameter("classifyList");
		throwGoods.setClassify(st);
		throwGoods.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
		throwGoods.setClo1("M");
		int num = throwGoodsService.updateTg(throwGoods);
		if (num > 0) {
			return new ModelAndView("redirect:tomycountLogin.do");
		}
		return null;
	}

	// 去修改失物图片页面
	@RequestMapping("/updatetgpic.do")
	public ModelAndView updateTgPic(Integer tgid, HttpSession session) {
		ThrowGoods tg = throwGoodsService.selectOne(tgid);
		session.setAttribute("throwGoods", tg);
		if (tg != null) {
			return new ModelAndView("updatetgpic", "tg", tg);
		}
		return null;
	}

	// 用户中心管理展示全部失物
	@RequestMapping("/toadmintgLogin.do")
	public ModelAndView selectadminAllTg(@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno,
			@RequestParam(name = "goodname", required = false, defaultValue = "") String goodname) {
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pno, 9, "updateed desc");// 分页
		List<ThrowGoods> all = throwGoodsService.getAll(goodname);
		PageInfo<ThrowGoods> page = new PageInfo<ThrowGoods>(all);// 封装数据--分好页的数据
		mv.addObject("page", page);
		mv.addObject("all", all);
		mv.addObject("goodname", goodname);
		mv.setViewName("admintg");
		return mv;
	}

	// 通过审核
	@RequestMapping("/adminapprovedLogin.do")
	public ModelAndView adminApprovedLogin(ThrowGoods throwGoods) {
		ThrowGoods tg = throwGoodsService.selectOneTg(throwGoods);
		if (tg != null) {
			if (tg.getClo1() != null && !"null".equals(tg.getClo1()) && !"".equals(tg.getClo1())) {
				tg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				tg.setClo1("Y");
				throwGoodsService.updateTg(tg);
			}
			return new ModelAndView("redirect:toadmintgLogin.do");
		}
		return null;
	}

	// 通过不审核
	@RequestMapping("/adminnotapprovedLogin.do")
	public ModelAndView adminNotApprovedLogin(ThrowGoods throwGoods) {
		ThrowGoods tg = throwGoodsService.selectOneTg(throwGoods);
		if (tg != null) {
			if (tg.getClo1() != null && !"null".equals(tg.getClo1()) && !"".equals(tg.getClo1())) {
				tg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				tg.setClo1("P");
				throwGoodsService.updateTg(tg);
			}
			return new ModelAndView("redirect:toadmintgLogin.do");
		}
		return null;
	}

	// 重新提交审核
	@RequestMapping("/reapprovedLogin.do")
	public ModelAndView reapprovedLogin(ThrowGoods throwGoods) {
		ThrowGoods tg = throwGoodsService.selectOneTg(throwGoods);
		if (tg != null) {
			if (tg.getClo1() != null && !"null".equals(tg.getClo1()) && !"".equals(tg.getClo1())) {
				tg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				tg.setClo1("M");
				throwGoodsService.updateTg(tg);
			}
			return new ModelAndView("redirect:tomycountLogin.do");
		}
		return null;
	}
	
	//批量通过
	@RequestMapping("/approvedManyTgLogin.do")
	public ModelAndView approvedManyTg(String tgids) {
		// 1、声明一个集合装载切割的元素
		List<Integer> idlist = new ArrayList<Integer>();
		String[] idss = tgids.split(",");
		for (String tgid : idss) {
			idlist.add(Integer.parseInt(tgid));
		}
		// 2、调用业务处理
		if (idlist != null && idlist.size() > 0) {
			int num = throwGoodsService.approvedManyTg(idlist);
			if (num > 0) { // 3、响应
				return new ModelAndView("redirect:toadmintgLogin.do");
			}
		}
		return null;
	}
	
	//批量不通过
	@RequestMapping("/notapprovedManyTgLogin.do")
	public ModelAndView notapprovedManyTg(String tgids) {
		// 1、声明一个集合装载切割的元素
		List<Integer> idlist = new ArrayList<Integer>();
		String[] idss = tgids.split(",");
		for (String tgid : idss) {
			idlist.add(Integer.parseInt(tgid));
		}
		// 2、调用业务处理
		if (idlist != null && idlist.size() > 0) {
			int num = throwGoodsService.notapprovedManyTg(idlist);
			if (num > 0) { // 3、响应
				return new ModelAndView("redirect:toadmintgLogin.do");
			}
		}
		return null;
	}

}

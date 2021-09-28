package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Contanct;
import com.ssm.entity.FindGoods;
import com.ssm.entity.ThrowGoods;
import com.ssm.service.ContanctService;
import com.ssm.service.FindGoodsService;
import com.ssm.service.ThrowGoodsService;

@Controller
public class ContanctController {
	
	@Autowired
	private ContanctService contanctService;
	@Autowired
	private ThrowGoodsService throwGoodsService;
	@Autowired
	private FindGoodsService findGoodsService;
	
	//插入失物联系方式
	@RequestMapping("/insertcontanct.do")
	public ModelAndView insertContanct(Contanct contanct,ThrowGoods throwGoods){
		ThrowGoods tg = throwGoodsService.selectOneTg(throwGoods);
		if (tg != null) {
				tg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				tg.setClo2("Y");
				throwGoodsService.updateTg(tg);
				contanct.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				contanct.setClo1("Y");
				int num = contanctService.insertContanct(contanct);
				if(num>0){
					return new ModelAndView("information","msg","保持手机畅通，随时等待被联系");
				}
		}
		return null;
	}
	
	//插入招领联系方式
	@RequestMapping("/insertcontanctfg.do")
	public ModelAndView insertContanctFg(Contanct contanct,FindGoods findGoods){
		FindGoods fg = findGoodsService.selectOneFg(findGoods);
		if (fg != null) {
				fg.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				fg.setClo2("Y");
				findGoodsService.updateFg(fg);
				contanct.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				contanct.setClo1("Y");
				int num = contanctService.insertContanct(contanct);
				if(num>0){
					return new ModelAndView("information","msg","保持手机畅通，随时等待被联系");
				}
		}
		return null;
	}
	
	//展示失物全部联系方式
	@RequestMapping("/selectallcontanct.do")
	public ModelAndView getAllContant(ThrowGoods throwGoods,HttpSession session){
		ThrowGoods tg = throwGoodsService.selectOneTg(throwGoods);
		session.setAttribute("throwGoods", tg);
		List<Contanct> clist = contanctService.selectAllContanct();
		if(clist!=null){
			return new ModelAndView("tglist","clist",clist);
		}
		return null;
	}
	
	//展示招领全部联系方式
	@RequestMapping("/selectallcontanctfg.do")
	public ModelAndView getAllContantFg(FindGoods findGoods,HttpSession session){
	    FindGoods fg = findGoodsService.selectOneFg(findGoods);
		session.setAttribute("findGoods", fg);
		List<Contanct> flist = contanctService.selectAllContanct();
		if(flist!=null){
			return new ModelAndView("fglist","flist",flist);
		}
		return null;
	}
	
	//管理员展示全部联系信息
	@RequestMapping("/selectallcontanctadminLogin.do")
	public ModelAndView getAdminAllContant(
			@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno){
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pno,20,"updateed desc");// 分页
		List<Contanct> list = contanctService.selectAllContanct();
		PageInfo<Contanct> page = new PageInfo<Contanct>(list);
		mv.addObject("pno",pno);
		mv.addObject("page", page);
		mv.addObject("list", list);
		mv.setViewName("admincontanct");
		return mv;
	}
	
	//导出数据
	@RequestMapping("/exportcontanctLogin.do")
	public ModelAndView exportContanct(){
		String filename = "D:/ndexcel/contant1.xlsx";//准备文件
        //准备数据-生成25条数据
        List<Contanct> list = contanctService.selectAllContanct();
        //写数据
        EasyExcel.write(filename,Contanct.class).sheet("Sheet1").doWrite(list);
		return new ModelAndView("information","msg","导出成功");
	}
	
	// 举报失物联系
	@RequestMapping("/delecttgcontanct.do")
	public ModelAndView deleteTg(Contanct contanct) {
		Contanct con = contanctService.selsecContanct(contanct);
		if (con != null) {
			if (con.getClo1() != null && !"null".equals(con.getClo1()) && !"".equals(con.getClo1())) {
				con.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				con.setClo1("N");
				contanctService.updateContanct(con);
			}
			return new ModelAndView("information","msg","举报成功");
		}
		return null;
	}

}

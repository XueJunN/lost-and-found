package com.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.entity.FindGoods;
import com.ssm.entity.Picture;
import com.ssm.entity.ThrowGoods;
import com.ssm.service.FindGoodsService;
import com.ssm.service.PictureService;
import com.ssm.service.ThrowGoodsService;
@Controller
public class FileController {
	
	@Autowired
	private ThrowGoodsService throwGoodsService;
	@Autowired
	private FindGoodsService findGoodsService;
	@Autowired
	private PictureService pictureService;
		
		//失物增加文件上传
		@RequestMapping("/doupload.do")
		public String upload(@RequestParam("file") MultipartFile file,ThrowGoods throwGoods,HttpServletRequest request) {
			if (file.isEmpty())
				return "未选择文件";
			// 获取原始文件名
			String fileName = file.getOriginalFilename();
			// 获取文件的后缀名
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			// 指定文件上传路径
			String filePath = "D:/Java/sxnd1804/personal_design/WebContent/assets/img/product/";
			//String filePath=request.getSession().getServletContext().getRealPath("/imgs/");
			// 使用随机字符序列作为文件名称
			String newFileName = UUID.randomUUID().toString().replace("-", "");
			// 拼接文件保存后的绝对路径
			String fullFileName = filePath + newFileName + suffixName;
			//String fullFileName = filePath +fileName;
			// 开始创建File对象，对后续的上传工作做准备
			File dest = new File(fullFileName);
			// 检测是否存在父级目录
			if (!dest.getParentFile().exists())
				dest.getParentFile().mkdirs();
			// 文件上传
			try {
				file.transferTo(dest);
				throwGoods.setPicture(newFileName+suffixName);
				//goods.setPic(fileName);
				String st = request.getParameter("classifyList");
				throwGoods.setClassify(st);
				throwGoods.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				throwGoods.setClo1("M");
				int num = throwGoodsService.insertTg(throwGoods);
				return "redirect:tomycountLogin.do";
			} catch (IOException e) {
				e.printStackTrace();
				return "上传失败！";
			}
		}
		
		
		//修改失物图片文件上传
		@RequestMapping("/doupdatetg.do")
		public String uploadupdate(@RequestParam("file") MultipartFile file,ThrowGoods throwGoods,HttpServletRequest request) {
			if (file.isEmpty())
				return "未选择文件";
			// 获取原始文件名
			String fileName = file.getOriginalFilename();
			// 获取文件的后缀名
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			// 指定文件上传路径
			String filePath = "D:/Java/sxnd1804/personal_design/WebContent/assets/img/product/";
			//String filePath=request.getSession().getServletContext().getRealPath("/imgs/");
			// 使用随机字符序列作为文件名称
			String newFileName = UUID.randomUUID().toString().replace("-", "");
			// 拼接文件保存后的绝对路径
			String fullFileName = filePath + newFileName + suffixName;
			//String fullFileName = filePath +fileName;
			// 开始创建File对象，对后续的上传工作做准备
			File dest = new File(fullFileName);
			// 检测是否存在父级目录
			if (!dest.getParentFile().exists())
				dest.getParentFile().mkdirs();
			// 文件上传
			try {
				file.transferTo(dest);
				//String picture = MD5Utils.code(throwGoods.getPicture());
				//throwGoods.setPicture(picture);
				throwGoods.setPicture(newFileName+suffixName);
				throwGoods.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				throwGoods.setClo1("M");
				int num = throwGoodsService.updateTg(throwGoods);
				return "redirect:tomycountLogin.do";
			} catch (IOException e) {
				e.printStackTrace();
				return "修改失败！";
			}
		}
		
		
		//招领添加文件上传
		@RequestMapping("/douploadfg.do")
		public String uploadfg(@RequestParam("file") MultipartFile file,FindGoods findGoods,HttpServletRequest request) {
			if (file.isEmpty())
				return "未选择文件";
			// 获取原始文件名
			String fileName = file.getOriginalFilename();
			// 获取文件的后缀名
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			// 指定文件上传路径
			String filePath = "D:/Java/sxnd1804/personal_design/WebContent/assets/img/product/";
			//String filePath=request.getSession().getServletContext().getRealPath("/imgs/");
			// 使用随机字符序列作为文件名称
			String newFileName = UUID.randomUUID().toString().replace("-", "");
			// 拼接文件保存后的绝对路径
			String fullFileName = filePath + newFileName + suffixName;
			//String fullFileName = filePath +fileName;
			// 开始创建File对象，对后续的上传工作做准备
			File dest = new File(fullFileName);
			// 检测是否存在父级目录
			if (!dest.getParentFile().exists())
				dest.getParentFile().mkdirs();
			// 文件上传
			try {
				file.transferTo(dest);
				findGoods.setPicture(newFileName+suffixName);
				//goods.setPic(fileName);
				String st = request.getParameter("classifyList");
				findGoods.setClassify(st);
				findGoods.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				findGoods.setClo1("M");
				int num = findGoodsService.insertFg(findGoods);
				return "redirect:tomycountfgLogin.do";
			} catch (IOException e) {
				e.printStackTrace();
				return "上传失败！";
			}
		}
		
		//修改图片文件上传
		@RequestMapping("/doupdatefg.do")
		public String uploadupdatepic(@RequestParam("file") MultipartFile file,FindGoods findGoods,HttpServletRequest request) {
			if (file.isEmpty())
				return "未选择文件";
			// 获取原始文件名
			String fileName = file.getOriginalFilename();
			// 获取文件的后缀名
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			// 指定文件上传路径
			String filePath = "D:/Java/sxnd1804/personal_design/WebContent/assets/img/product/";
			//String filePath=request.getSession().getServletContext().getRealPath("/imgs/");
			// 使用随机字符序列作为文件名称
			String newFileName = UUID.randomUUID().toString().replace("-", "");
			// 拼接文件保存后的绝对路径
			String fullFileName = filePath + newFileName + suffixName;
			//String fullFileName = filePath +fileName;
			// 开始创建File对象，对后续的上传工作做准备
			File dest = new File(fullFileName);
			// 检测是否存在父级目录
			if (!dest.getParentFile().exists())
				dest.getParentFile().mkdirs();
			// 文件上传
			try {
				file.transferTo(dest);
				//String picture = MD5Utils.code(throwGoods.getPicture());
				//throwGoods.setPicture(picture);
				findGoods.setPicture(newFileName+suffixName);
				findGoods.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				findGoods.setClo1("M");
				int num = findGoodsService.updateFg(findGoods);
				return "redirect:tomycountfgLogin.do";
			} catch (IOException e) {
				e.printStackTrace();
				return "修改失败！";
			}
		}
		
		//上传头像
		@RequestMapping("/douploadpic.do")
		public String uploadpicture(@RequestParam("file") MultipartFile file,Picture picture) {
			if (file.isEmpty())
				return "未选择文件";
			// 获取原始文件名
			String fileName = file.getOriginalFilename();
			// 获取文件的后缀名
			String suffixName = fileName.substring(fileName.lastIndexOf("."));
			// 指定文件上传路径
			String filePath = "D:/Java/sxnd1804/personal_design/WebContent/images/touxiang/";
			//String filePath=request.getSession().getServletContext().getRealPath("/imgs/");
			// 使用随机字符序列作为文件名称
			String newFileName = UUID.randomUUID().toString().replace("-", "");
			// 拼接文件保存后的绝对路径
			String fullFileName = filePath + newFileName + suffixName;
			//String fullFileName = filePath +fileName;
			// 开始创建File对象，对后续的上传工作做准备
			File dest = new File(fullFileName);
			// 检测是否存在父级目录
			if (!dest.getParentFile().exists())
				dest.getParentFile().mkdirs();
			// 文件上传
			try {
				file.transferTo(dest);
				picture.setPicture(newFileName+suffixName);
				picture.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				picture.setClo1("Y");
				pictureService.insertPicture(picture);
				return "redirect:toLogin.do";
			} catch (IOException e) {
				e.printStackTrace();
				return "上传失败！";
			}
		}

}

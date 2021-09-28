package com.ssm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.excel.EasyExcel;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.entity.Picture;
import com.ssm.entity.User;
import com.ssm.service.PictureService;
import com.ssm.service.UserService;
import com.ssm.utils.MD5Utils;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private PictureService pictureService;

	// 去登录页面
	@RequestMapping("/tologinLogin.do")
	public String getLogin() {
		return "login";
	}

	// 去注册页面
	@RequestMapping("/toRegisterLogin.do")
	public String getRegister() {
		return "register";
	}

	// 注册
	@RequestMapping("/toRegister1Login.do")
	public ModelAndView getInsertUser(User user,Picture picture) {

		// 从数据库中读取
		User user2 = new User();
		user2.setEmail(user.getEmail());
		User user3 = new User();
		user3.setUsername(user.getUsername());

		// 判断数据库中是否已经有此邮箱
		if (userService.selectUser(user2) == null) {
			if (userService.selectUser(user3) == null) {

				// MD5加密
				String password = MD5Utils.code(user.getPassword());
				user.setPassword(password);
				String repassword = MD5Utils.code(user.getRepassword());
				user.setRepassword(repassword);
				// Date date = new Date();
				// String nowTime = new SimpleDateFormat("yyyy-MM-dd
				// HH:mm:ss").format(date);
				// Timestamp of = Timestamp.valueOf(nowTime);
				user.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				boolean b = userService.insertUser(user);
				picture.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				picture.setClo1("Y");
				picture.setPicture("1.png");
				picture.setUid(user.getUid());
				pictureService.insertPicture(picture);
				if (b) {
					return new ModelAndView("redirect:tologinLogin.do");
				}
			} else {
				return new ModelAndView("forward:toRegisterLogin.do", "msg", "该用户名已被使用");
			}
		} else {
			return new ModelAndView("forward:toRegisterLogin.do", "msg", "该邮箱已被注册");
		}

		return null;
	}

	// 激活邮件
	@RequestMapping("/activeMailLogin.do")
	public ModelAndView activeEmail(String code, HttpServletResponse res) {
		boolean flag = userService.action(code);
		String msg = null;// 带到页面的信息
		if (flag) {
			// msg = "<h3>激活成功!<a href='toLogin.do'>请登录</a></h3>";
			return new ModelAndView("redirect:tologinLogin.do");
		} else {
			msg = "激活失败!请联系管理员!";
		}
		try {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().write(msg);// 写出信息
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 登录
	@RequestMapping("/torecordLogin.do")
	public ModelAndView getSelectUser(User user, HttpSession session) {
		User u1 = userService.login(user);// 调用业务
		// 作判断
		if (u1 != null) {// 不为空
			if (!"2".equals(u1.getRole())) {

				if ("1".equals(u1.getRole())) {

					if (!"Y".equals(u1.getStatus())) {
						// 用户名和密码正确-但账号没有激活-给提示消息，重新登录
						return new ModelAndView("forward:tologinLogin.do", "msg", "该账号未激活！请联系管理员!");
					}
					// 登录成功-去后台首页-并将当前登录用户信息保存到session当中
					session.setAttribute("user", u1);
					// return "redirect:toLogin.do";
					return new ModelAndView("redirect:toLogin.do");
				} else {
					return new ModelAndView("forward:tologinLogin.do", "msg", "用户不存在!");
				}

			} else { // 用户名或密码错误-提示信息，重新登录
				// model.addAttribute("msg", "用户名或密码不正确!");
				// return "forward:tologinLogin.do";
				return new ModelAndView("forward:tologinLogin.do", "msg", "该账号有不良记录，如有疑问请联系管理员!");
			}
		}
		return new ModelAndView("forward:tologinLogin.do", "msg", "用户名或密码不正确!");
	}

	// 退出
	@RequestMapping("/toout.do")
	public String outUser(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:tologinLogin.do";

	}

	// 去修改密码页面
	@RequestMapping("/forgetPwdLogin.do")
	public String getForgetpswd() {
		return "forgetPwd";
	}

	// 填写账号
	@RequestMapping("/toforgetPwdLogin.do")
	public ModelAndView getForgetpswdUser(User user, HttpSession session) {
		User u2 = userService.selectUser(user);
		if (u2 != null) {
			session.setAttribute("user", u2);
			return new ModelAndView("redirect:forgetPwd3Login.do");
		} else {
			return new ModelAndView("forward:forgetPwdLogin.do", "msg", "用户名不正确!");
		}
	}

	// 去修改密码3页面
	@RequestMapping("/forgetPwd3Login.do")
	public String getForgetpswd3() {
		return "forgetPwd3";
	}

	// 修改密码
	@RequestMapping("/toforgetPwd3Login.do")
	public ModelAndView getForgetpswd3User(User user) {
		String password = MD5Utils.code(user.getPassword());
		user.setPassword(password);
		String repassword = MD5Utils.code(user.getRepassword());
		user.setRepassword(repassword);
		Boolean flag = userService.updatePassword(user);
		if (flag) {
			return new ModelAndView("redirect:tologinLogin.do");
		} else {
			return new ModelAndView("forward:forgetPwd3Login.do", "msg", "邮箱激活失败");
		}

	}

	// 激活邮件
	@RequestMapping("/toactiveMailLogin.do")
	public ModelAndView getactiveEmail(String code, HttpServletResponse res) {
		boolean flag = userService.action(code);
		String msg = null;// 带到页面的信息
		if (flag) {
			return new ModelAndView("redirect:forgetPwd4Login.do");
		} else {
			msg = "激活失败!请联系管理员!";
		}
		try {
			res.setContentType("text/html;charset=utf-8");
			res.getWriter().write(msg);// 写出信息
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 去修改密码4页面
	@RequestMapping("/forgetPwd4Login.do")
	public String getForgetpswd4() {
		return "forgetPwd4";
	}

	// 注销账号
	@RequestMapping("/tologoutLogin.do")
	public ModelAndView logoutUser(User user, HttpServletRequest request) {
		User user1 = userService.selectOneUser(user);
		if (user1 != null) {
			if (user1.getRole() != null && !"null".equals(user1.getRole()) && !"".equals(user1.getRole())) {
				user1.setRole("0");
				userService.updateUserRole(user1);
			}
			return new ModelAndView("redirect:toRegisterLogin.do", "user1", "user1");
		}
		return null;
	}

	// 修改用户信息
	@RequestMapping("/toupdateuser.do")
	public ModelAndView updateUser(User user) {
		String password = MD5Utils.code(user.getPassword());
		user.setPassword(password);
		String repassword = MD5Utils.code(user.getRepassword());
		user.setRepassword(repassword);
		user.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
		int num = userService.updateUserRole(user);
		if (num > 0) {
			return new ModelAndView("forward:tologinLogin.do");
		}
		return null;
	}

	// 展示全部信息
	@RequestMapping("toadminLogin.do")
	public ModelAndView getAllUser(
			@RequestParam(name = "username", required = false, defaultValue = "") String username,
			@RequestParam(name = "pno", required = true, defaultValue = "1") Integer pno) {
		ModelAndView mv = new ModelAndView();
		PageHelper.startPage(pno, 12, "updateed desc");
		List<User> ulist = userService.getAllUser(username);
		PageInfo<User> page = new PageInfo<User>(ulist);
		if (ulist != null) {
			mv.addObject("ulist", ulist);
			mv.addObject("page", page);
			mv.addObject("pno", pno);
			mv.addObject("username", username);
			mv.setViewName("indexadmin");
		}
		return mv;
	}

	// 管理员注销账号
	@RequestMapping("/tologoutadminuserLogin.do")
	public ModelAndView logoutadminUser(User user) {
		User u = userService.selectOneUser(user);
		if (u != null) {
			if (u.getRole() != null && !"null".equals(u.getRole()) && !"".equals(u.getRole())) {
				u.setRole("2");
				u.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				userService.updateUserRole(u);
			}
			return new ModelAndView("redirect:toadminLogin.do");
		}
		return null;
	}

	// 批量删去
	@RequestMapping("/delManyLogin.do")
	public ModelAndView delManyUser(String uids) {
		// 1、声明一个集合装载切割的元素
		List<Integer> idlist = new ArrayList<Integer>();
		String[] idss = uids.split(",");
		for (String uid : idss) {
			idlist.add(Integer.parseInt(uid));
		}
		// 2、调用业务处理
		if (idlist != null && idlist.size() > 0) {
			int num = userService.deleteManyUser(idlist);
			if (num > 0) { // 3、响应
				return new ModelAndView("redirect:toadminLogin.do");
			}
		}
		return null;
	}
	
	//批量修改
	@RequestMapping("/updateManyLogin.do")
	public ModelAndView updateManyUser(String uids) {
		// 1、声明一个集合装载切割的元素
		List<Integer> idlist = new ArrayList<Integer>();
		String[] idss = uids.split(",");
		for (String uid : idss) {
			idlist.add(Integer.parseInt(uid));
		}
		// 2、调用业务处理
		if (idlist != null && idlist.size() > 0) {
			int num = userService.updateManyUser(idlist);
			if (num > 0) { // 3、响应
				return new ModelAndView("redirect:toadminLogin.do");
			}
		}
		return null;
	}
	
	//导出数据
	@RequestMapping("/exportuserLogin.do")
	public ModelAndView exportUser(){
		String filename = "D:/ndexcel/user1.xlsx";//准备文件
        //准备数据-生成25条数据
        List<User> list = userService.getexportUser();
        //写数据
        EasyExcel.write(filename,User.class).sheet("Sheet1").doWrite(list);
		return new ModelAndView("information","msg","导出成功");
	}
	
	//去重新激活账号页面
	@RequestMapping("getactivationLogin.do")
	public String getActivation(){
		return "activationuser";
	}
	
	//重新激活账号
	@RequestMapping("/activationLogin.do")
	public ModelAndView activationUser(User user){
		User user2 = userService.selectUser(user);
		if(user2!=null){
			if(!"1".equals(user2.getRole())){
		user2.setCol2("Y");
		userService.updateUserRole(user2);
		return new ModelAndView("forward:tologinLogin.do","msg","已申请，等待管理员激活");
		}
			return new ModelAndView("forward:getactivationLogin.do","msg","该邮箱注册用户已经激活");
		}
		return new ModelAndView("forward:getactivationLogin.do","msg","该邮箱注册用户不存在");
	}
	
	//激活用户
	@RequestMapping("/activationadminuserLogin.do")
	public ModelAndView adminActivation(User user){
		User u = userService.selectOneUser(user);
		if (u != null) {
			    u.setCol2("");
				u.setRole("1");
				u.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				userService.updateUserRole(u);
			}
			return new ModelAndView("redirect:toadminLogin.do");
	}

}

package com.ssm.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.entity.Admin;
import com.ssm.service.AdminService;
import com.ssm.utils.MD5Utils;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 去注册页面
	@RequestMapping("/toadminregisterLogin.do")
	public String AdminRegister() {
		return "registeradmin";
	}

	// 去登录页面
	@RequestMapping("/toadminloginLogin.do")
	public String AdminLogin() {
		return "loginadmin";
	}

	// 注册
	@RequestMapping("/toRegisterAdminLogin.do")
	public ModelAndView getInsertAdmin(Admin admin) {

		// 从数据库中读取
		Admin admin2 = new Admin();
		admin2.setEmail(admin.getEmail());
		Admin admin3 = new Admin();
		admin3.setName(admin.getName());
		Admin admin4 = new Admin();
		admin4.setStatuscode(admin.getStatuscode());

		// 判断数据库中是否已经有此邮箱
		if (adminService.selectAdmin(admin2) == null) {
			if (adminService.selectAdmin(admin3) == null) {

				// MD5加密
				String password = MD5Utils.code(admin.getPassword());
				admin.setPassword(password);
				String repassword = MD5Utils.code(admin.getRepassword());
				admin.setRepassword(repassword);
				admin.setCreated(new java.sql.Date(new java.util.Date().getTime()));
				admin.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
				boolean b = adminService.insertAdmin(admin);
				if (b) {
					return new ModelAndView("redirect:toadminloginLogin.do");
				}
			} else {
				return new ModelAndView("forward:toadminregisterLogin.do", "msg", "该用户名已被使用");
			}
		} else {
			return new ModelAndView("forward:toadminregisterLogin.do", "msg", "该邮箱已被注册");
		}

		return null;
	}

	// 激活邮件
	@RequestMapping("/activeMail1Login.do")
	public ModelAndView activeEmailAdmin(String code, HttpServletResponse res) {
		boolean flag = adminService.action(code);
		String msg = null;// 带到页面的信息
		if (flag) {
			return new ModelAndView("redirect:toadminloginLogin.do");
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
	@RequestMapping("/torecordadminLogin.do")
	public ModelAndView getSelectAdmin(Admin admin, HttpSession session) {
		Admin admin2 = adminService.login(admin);// 调用业务
		// 作判断
		if (admin2 != null) {// 不为空
			if ("696969".equals(admin2.getStatuscode())) {
				
				if("Y".equals(admin2.getClo1())){
				
				if (!"Y".equals(admin2.getStatus())) {
					// 用户名和密码正确-但账号没有激活-给提示消息，重新登录
					return new ModelAndView("forward:toadminloginLogin.do", "msg", "该账号未激活！请联系管理员!");
				}
				// 登录成功-去后台首页-并将当前登录用户信息保存到session当中
				session.setAttribute("admin", admin2);
				return new ModelAndView("redirect:toadminLogin.do");
				}else{
					return new ModelAndView("forward:toadminloginLogin.do", "msg", "该账号不存在");
				}
			} else {
				return new ModelAndView("forward:toadminloginLogin.do", "msg", "激活码错误");
			}
		}
		return new ModelAndView("forward:toadminloginLogin.do", "msg", "用户名或密码不正确!");
	}
	
	// 退出
	@RequestMapping("/toadminoutLogin.do")
	public String outUser(HttpSession session) {
		session.removeAttribute("admin");
		session.invalidate();
		return "redirect:toadminloginLogin.do";

	}
	
	//注销
	@RequestMapping("/adminoutLogin.do")
	public ModelAndView adminOutLogin(Admin admin){
		Admin admin2 = adminService.selectAdmin(admin);
		if (admin2 != null) {
			if (admin2.getClo1() != null && !"null".equals(admin2.getClo1()) && !"".equals(admin2.getClo1())) {
				admin2.setClo1("N");
				adminService.updateAdmin(admin2);
			}
			return new ModelAndView("redirect:toadminregisterLogin.do");
		}
		return null;
	}
	
	//修改管理员密码和账号名
	@RequestMapping("/updateadminLogin.do")
	public ModelAndView updateAdmin(Admin admin){
		String password = MD5Utils.code(admin.getPassword());
		admin.setPassword(password);
		String repassword = MD5Utils.code(admin.getRepassword());
		admin.setRepassword(repassword);
		admin.setUpdateed(new java.sql.Date(new java.util.Date().getTime()));
		int num = adminService.updateAdmin(admin);
		if(num>0){
			return new ModelAndView("redirect:toadminloginLogin.do");
		}
		return null;
	}

}

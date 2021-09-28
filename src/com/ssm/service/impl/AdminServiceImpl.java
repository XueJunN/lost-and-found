package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.AdminMapper;
import com.ssm.entity.Admin;
import com.ssm.service.AdminService;
import com.ssm.utils.MD5Utils;
import com.ssm.utils.MailUtils;
import com.ssm.utils.UuidUtil;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;

	@Transactional
	public boolean insertAdmin(Admin admin) {
		admin.setCode(UuidUtil.getUuid());// 设置激活码
		admin.setStatus("N");// 设置激活状态
		admin.setClo1("N");
		int num = adminMapper.insertSelective(admin);
		if (num > 0) {
			// 发送邮件
			String content = "<a href='http://localhost:9999/personal_design/activeMail1Login.do?" + "code=" + admin.getCode()
					+ "'>点击激活【失物招领网站】</a>";
			MailUtils.sendMail(admin.getEmail(), content, "激活邮件！");
			return true;
		}
		return false;
	}

	@Override
	public Admin login(Admin admin) {
		admin.setPassword(MD5Utils.code(admin.getPassword()));
		return adminMapper.selectOne(admin);
	}

	@Transactional
	public boolean action(String code) {
		// 根据激活码查询当前注册的用户是否是在本平台注册的用户
		Admin admin = new Admin();
		admin.setCode(code);
		Admin ad = adminMapper.selectOne(admin);
		if (ad != null) {// 有此用户-更新激活状态//激活-修改当前注册用户的激活状态-更新动作
			ad.setStatus("Y");
			ad.setClo1("Y");
			if (adminMapper.updateByPrimaryKeySelective(ad) > 0)
				return true;
			else
				return false;
		}
		return false;// 响应
	}

	@Override
	public Admin selectAdmin(Admin admin) {
		return adminMapper.selectOne(admin);
	}

	@Override
	public int updateAdmin(Admin admin) {
		return adminMapper.updateByPrimaryKey(admin);
	}

}

package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.UserMapper;
import com.ssm.entity.User;
import com.ssm.service.UserService;
import com.ssm.utils.MD5Utils;
import com.ssm.utils.MailUtils;
import com.ssm.utils.UuidUtil;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Transactional
	public boolean insertUser(User user) {
		user.setCode(UuidUtil.getUuid());// 设置激活码
		user.setStatus("N");// 设置激活状态
		int num = userMapper.insertSelective(user);
		if (num > 0) {
			// 发送邮件
			String content = "<a href='http://localhost:9999/personal_design/activeMailLogin.do?" + "code=" + user.getCode()
					+ "'>点击激活【失物招领网站】</a>";
			MailUtils.sendMail(user.getEmail(), content, "激活邮件！");
			return true;
		}
		return false;
	}

	@Override
	public User login(User user) {
		 user.setPassword(MD5Utils.code(user.getPassword()));
		 User user2 = userMapper.selectOne(user);
		return user2;	
	}

	@Transactional
	public boolean action(String code) {
		// 根据激活码查询当前注册的用户是否是在本平台注册的用户
				User user = new User();
				user.setCode(code);
				User u1 = userMapper.selectOne(user);
				if (u1 != null) {// 有此用户-更新激活状态//激活-修改当前注册用户的激活状态-更新动作
					u1.setStatus("Y");
					u1.setRole("1");
					if (userMapper.updateByPrimaryKeySelective(u1) > 0)
						return true;
					else
						return false;
				}
				return false;// 响应
	}

	@Override
	public User selectUser(User user) {
		return userMapper.selectOne(user);
	}

	@Transactional
	public boolean updatePassword(User user) {
		user.setCode(UuidUtil.getUuid());// 设置激活码
		user.setStatus("N");// 设置激活状态
	     int num = userMapper.updateByPrimaryKeySelective(user);
		if (num > 0) {
			// 发送邮件
			String content = "<a href='http://localhost:9999/personal_design/toactiveMailLogin.do?" + "code=" + user.getCode()
					+ "'>修改【失物招领网站】密码</a>";
			MailUtils.sendMail(user.getEmail(), content, "激活邮件！");
			return true;
		}
		return false;
	}

	@Override
	public User selectOneUser(User user) {
		return userMapper.selectByPrimaryKey(user);
	}

	@Override
	public int updateUserRole(User user) {
		return userMapper.updateByPrimaryKey(user);
	}

	@Override
	public List<User> getAllUser(String username) {
		return userMapper.getAllUser(username);
	}

	@Override
	public int deleteManyUser(List<Integer> uids) {
		int num=0;//定义一个变量 记录删去成功的元素的个数
		for(Integer uid:uids){
			if(userMapper.deleteByPrimaryKey(uid)>0){
				num++;
			}
		}
		if(num==uids.size())
			return 1;
		else
		return 0;
	}

	//批量修改
	@Override
	public int updateManyUser(List<Integer> uids) {
		int num=0;//定义一个变量 记录修改成功的元素的个数
		for(Integer uid:uids){
			if(userMapper.updateManyUser(uids)>0){
				num++;
			}
		}
		if(num==uids.size())
			return 1;
		else
		return 0;
	}

	@Override
	public List<User> getexportUser() {
		return userMapper.selectAll();
	}
	
}

package com.yc.biz.Impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;
import com.yc.dao.BaseDao;

@Service
public class AdminBizImpl implements AdminBiz{
	@Resource(name="baseDao")
	 private BaseDao baseDao;
       public Admin login(Admin admin){
    	  Admin adm= (Admin)baseDao.findOne(admin, "adminLogin");
    	  return adm;
       }
       
       
       
}

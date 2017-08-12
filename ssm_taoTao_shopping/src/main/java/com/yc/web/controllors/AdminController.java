package com.yc.web.controllors;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yc.bean.Admin;
import com.yc.biz.AdminBiz;
import com.yc.utils.Encrypt;
import com.yc.web.model.JsonModel;

@RestController     //这个注解相当于同时使用 @Controller 和 Responsebody    Responsebody相当于返回的是一个json数据
public class AdminController {
	@Resource(name="adminBizImpl")
	private AdminBiz adminBiz;
		 	
	//因为登录后是要接到list.jsp 页做显示，且login.jsp 页是通过submit提交的，即不支持ajax，不用回送json数据，而应该回送是一个页面的名字，这样springMVC的视图解析器就可以运行了
	@RequestMapping(value="/admin.action")
	public JsonModel login(Admin admin,HttpServletRequest request,HttpSession session){
		//传三个参数的原因：因为name，password是admin对象中有的，但 
		JsonModel jsonModel=new JsonModel();
	    String zccode=	request.getParameter("zccode");
		String rand=session.getAttribute("rand").toString();
		if(!rand.equals(zccode)){
			jsonModel.setCode(0);
			jsonModel.setMsg("验证码错误");
		}else{
			try {
				admin.setApwd(Encrypt.md5AndSha(admin.getApwd()));
				admin =adminBiz.login(admin);
				if(admin!=null){
					session.setAttribute("admin", admin);
				    jsonModel.setCode(1);
					admin.setApwd(null);    //设为空后，密码就不会传到界面
					jsonModel.setObj(admin);
				}else{
					jsonModel.setCode(0);
					jsonModel.setMsg("用户名或者密码错误");
				}
			} catch (Exception e) {
				
				e.printStackTrace();
				jsonModel.setCode(0);
				jsonModel.setMsg(e.getMessage());
			}
		}
		
		return jsonModel;
		 
	}	
}

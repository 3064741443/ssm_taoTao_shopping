package com.yc.web.controllors;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController {
	@RequestMapping(value="/toBackgroundManagement.action",method=RequestMethod.GET)
    public void index(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
  request.getRequestDispatcher("WEB-INF/back/manager/main.jsp").forward(request, response);
		/*response.sendRedirect("back/manager/main.jsp");*/
    }
	/*
	@RequestMapping(value="/toRegister.action",method=RequestMethod.GET)
	public String toRegister(){
		
		return "register";
	}*/
}

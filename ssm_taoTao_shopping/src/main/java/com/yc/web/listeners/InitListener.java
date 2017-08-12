package com.yc.web.listeners;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


public class InitListener implements ServletContextListener {
 private ApplicationContext ac;
   
    public InitListener() {
    	
        
    }

    public void contextInitialized(ServletContextEvent sce)  { 
    	/*//ȡapplication
    	ServletContext application=sce.getServletContext();
    	ac=WebApplicationContextUtils.getWebApplicationContext(application);
        HouseTypeBiz typeBiz=(HouseTypeBiz) ac.getBean("houseTypeBizImpl"); 
    	List<HouseType> houseTypeList=typeBiz.selectAllHouseType();
    	application.setAttribute("houseTypeList", houseTypeList);
    	 DistrictBiz districtBiz=(DistrictBiz) ac.getBean("districtBizImpl");
    	List<District> districtList=districtBiz.selectAllDistrict();
    	application.setAttribute("districtList", districtList);*/
    }

	
    public void contextDestroyed(ServletContextEvent arg0)  { 
    }
	
}

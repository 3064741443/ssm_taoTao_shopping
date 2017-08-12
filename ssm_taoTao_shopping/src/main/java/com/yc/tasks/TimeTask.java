package com.yc.tasks;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TimeTask {
   @Scheduled(cron="0/5 * * * * ?")
   public void test1(){
	   System.out.println("job¿ªÊ¼Ö´ÐÐ"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
   }
}

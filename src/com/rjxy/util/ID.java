package com.rjxy.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class ID {
	public static String getRandomID(){
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		Random rd=new Random();
		return sdf.format(date)+(rd.nextInt(90) +10);
	}
	public static float Max(float x,float y){
		if(x>y)
			return x;
		else
			return y;
	}
}

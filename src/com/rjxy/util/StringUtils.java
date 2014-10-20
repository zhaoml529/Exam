package com.rjxy.util;

/**
 * 工具类，判断字符串是否为空
 * @author wang
 *
 */
public class StringUtils {

	public static boolean isBlank(String...judgeString){
		
		for(String str:judgeString){
			if(str == null || "".equals(str)){
				return true;
			}
		}
		return false;
	}
	
	public static String StringFilter(String message) {

        if (message == null)
            return (null);
        
        char content[] = new char[message.length()];
        message.getChars(0, message.length(), content, 0);
        StringBuffer result = new StringBuffer(content.length + 50);
        for (int i = 0; i < content.length; i++) {
            switch (content[i]) {
            case '<':
                result.append("&lt;");
                break;
            case '>':
                result.append("&gt;");
                break;
            case '&':
                result.append("&amp;");
                break;
            case '"':
                result.append("&quot;");
                break;
            default:{
            	if(i%68==67){
            		result.append("<br/>");
            	}
                result.append(content[i]);
            }
            }
        }
        return (result.toString());
    }
}

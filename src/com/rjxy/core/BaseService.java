package com.rjxy.core;

import java.util.List;  

import com.rjxy.core.BaseDao;
import com.rjxy.entity.question.Choice;
import com.rjxy.util.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Service;  
import org.springframework.transaction.annotation.Transactional;  
  
  
@Service  
public class BaseService<T> {  
    @Autowired  
    private BaseDao<T> entityDao;  
    
    @Transactional  
    public List<T> getAllList(String tableSimpleName){  
        StringBuffer sff = new StringBuffer();  
        sff.append("select a from ").append(tableSimpleName).append(" a ");  
        List<T> list = entityDao.createQuery(sff.toString());  
        return list;  
    }  
    /** 
     * find the list of entity by where conditions  
     * @param tableSimpleName 
     * @param columns 
     * @param values 
     * @return  list 
     */  
    @Transactional
    public List<T> findByWhere(String tableSimpleName,String[] columns,String[] values){  
        StringBuffer sb = new StringBuffer();  
        sb.append("select a from ").append(tableSimpleName).append( " a where ");  
        if(columns.length==values.length){  
            for(int i = 0; i < columns.length; i++){
            	if(columns[i] != null && columns[i] != ""){
            		sb.append("a.").append(columns[i]).append("='").append(values[i]).append("'");  
            		if(i < columns.length-1){  
                        sb.append(" and ");  
                    }
            	}
            }
            String sub = sb.toString();
            if(sub.lastIndexOf("and ")!=-1 && sub.lastIndexOf("and ") == sub.length()-4){
            	sub = sub.substring(0, sub.length()-5);
            }
           List<T> list = entityDao.createQuery(sub);  
            return list.size()>0?list:null;  
        }else{  
            return null;  
        }  
    }
    /**
     * 分页信息
     */
    public List<T> queryByPage(String tableSimpleName, String[] columns, String[] values, int startIndex, int PageSize){
    	 StringBuffer sb = new StringBuffer();  
    	 boolean flag = false;
    	 if(columns.length <= 0 && values.length <= 0){
    		 sb.append("select a from ").append(tableSimpleName).append(" a");
    	 }else{
    		 sb.append("select a from ").append(tableSimpleName).append( " a where 1=1 and ");
    	 }
         if(columns.length==values.length){  
             for(int i = 0; i < columns.length; i++){  
            	 if(!StringUtils.isBlank(values[i])){
            		 if(columns[i].equals("question_body")){
            			flag = true;
                 		sb.append("a.").append(columns[i]).append(" like '%").append(values[i]).append("%'");  
                 		if(i < columns.length-1){  
                             sb.append(" and ");  
                 		}
                 	}
             		else{
	                 sb.append("a.").append(columns[i]).append("='").append(values[i]).append("'");  
	                 if(i < columns.length-1){  
	                     sb.append(" and ");  
	                 } 
             		}
            	 }
             }
             String sub = sb.toString();
             if(flag){
            	 sub = sub.substring(0, sub.length()-5);
             }
             if(sub.lastIndexOf("and ")!=-1 && sub.lastIndexOf("and ") == sub.length()-4){
             	sub = sub.substring(0, sub.length()-5);
             }
             List<T> list = entityDao.queryByPage(sub, startIndex, PageSize);  
             return list.size()>0?list:null;  
         }else{  
             return null;  
         }
    }
    /**
     * 统计数量
     */
    public List<T> getCount(String tableSimpleName){
    	String hql = "select count(*) from " + tableSimpleName;
    	List<T> list = entityDao.createQuery(hql);
    	return list;
    }

    /**
     * 自动添加试题
     * select * from t_t_xzt where kmbh = 1 and njbh = 1 and ndxs = 1 and th >= (select floor(max(th)*rand())from t_t_xzt) order by th limit 1;
     * 此方法比用order by RAND() 效率要高
     * columns[0]存放的是 id,从columns[1]开始拼接hql
     */
    public List<T> getQuestion(String tableSimpleName, String[] columns, String[] values, int num){
    	StringBuffer sb = new StringBuffer();  
        sb.append("select a from ").append(tableSimpleName).append( " a where ");
        if(columns.length==values.length){  
        	for(int i = 1; i < columns.length; i++){  
           	 if(!StringUtils.isBlank(columns[i])){
                sb.append("a.").append(columns[i]).append("='").append(values[i]).append("'");  
                sb.append(" and "); 
               }
            }
        }
        sb.append("a."+columns[0]+" >= (select floor(max(a."+columns[0]+")*rand())from a) order by a."+columns[0]);
        List<T> list = entityDao.queryByPage(sb.toString(), 0, num);  
        return list.size()>0?list:null;  
    }
    
    /**
     * 模糊查询
     */
    public List<T> queryByWhere(String tableSimpleName,String columns,String query){
        List<T> list=entityDao.queryByWhere(tableSimpleName, columns, query);
        return list;
    }
    
    @Transactional
    public List<T> findByDim(String tableSimpleName,String[] columns,String[] values){  
        StringBuffer sb = new StringBuffer();  
        sb.append("select a from ").append(tableSimpleName).append( " a where 1=1 and ");  
        if(columns.length==values.length){  
            for(int i = 0; i < columns.length; i++){
            	if(!StringUtils.isBlank(values[i])){
            		if(columns[i].equals("question_body")){
                		sb.append("a.").append(columns[i]).append(" like '%").append(values[i]).append("%'");  
                		if(i < columns.length-1){  
                            sb.append(" and ");  
                		}
                	}
            		else{
                		sb.append("a.").append(columns[i]).append("='").append(values[i]).append("'");  
                		if(i < columns.length-1){  
                            sb.append(" and ");  
                        }
                	}
            	}
            }
            String sub = sb.toString();
            if(sub.lastIndexOf("and ")!=-1 && sub.lastIndexOf("and ") == sub.length()-4){
            	sub = sub.substring(0, sub.length()-5);
            }
           List<T> list = entityDao.createQuery(sub);  
            return list.size()>0?list:null;  
        }
        else{  
            return null;  
        }  
    }
    
    /**
     * 获取一、二、三级学科
     */
    public List<T> getProfessionAreaList(String tableSimpleName,String columns,int length,String key){
    	String hql="from "+tableSimpleName+" where length("+columns+")="+length+" and "+columns+" like "+"\'"+key+"%\'";
    	List<T> list = entityDao.createQuery(hql); 
		return list;
    }
    
    /**
     * 获取参研角色
     */
    public List<T> getResearchPeopleRoleList(String tableSimpleName,String columns,int length,int key){
    	String hql="FROM "+tableSimpleName +" WHERE SUBSTR("+columns+","+ length+",1)="+key;
    	List<T> list=entityDao.createQuery(hql);
    	return list;
    }
    
    /** 
     * save 
     * @param obj 
     */  
    public void save(T obj){  
        entityDao.save(obj);  
    }  
    /** 
     * delete 
     * @param obj 
     */ 
    public void delete(T obj){  
       entityDao.delete(obj);  
    }  
    /** 
     * update 
     * @param obj 
     */  
    public void update(T obj){  
        entityDao.update(obj);  
    }  
    /** 
     * getBean
     * @param obj 
     */  
    //通过id 反射获取相应的类
    public T getBean(Class<T> obj, String id){  
       return entityDao.getBean(obj,id);
    }  
    public T getBean(Class<T> obj, int id){  
        return entityDao.getBean(obj,id);
     } 
    
    public static void main(String[] args) {
    	BaseService<Choice> base =new BaseService<Choice>();
    	List<Choice> choice = base.getQuestion("com.rjxy.entity.question.Choice", new String[]{"subject","grade.grade_id","difficulty"}, new String[]{"1","1","1"}, 3);
    }
}  
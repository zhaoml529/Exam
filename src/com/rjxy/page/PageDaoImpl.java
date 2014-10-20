/*

 * 施杨的分页daoimpl类 

 * */

package com.rjxy.page;


import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rjxy.core.BaseService;

@SuppressWarnings("unchecked")
@Service
public class PageDaoImpl extends BaseService{

	private String tableName;
	public PageBean page;
	private String[] columns;
	private String[] values;

	public int start;
	@Transactional
	public void initPageBean(int start, String tableName,String[] columns, String[] values) {
		page = new PageBean();
		this.tableName = tableName;
		this.columns = columns;
		this.values = values;
		this.start = start;
		setRowCount();
		setTotalPage();
		setCurrentPage();
		setPrePage();
		setNextPage();
		setPreOrNextBoolean();
	}

	public int getRowCount() {
		List<Object> list = new ArrayList<Object>();
		if(columns.length <= 0 && values.length <= 0){
			list = getAllList(tableName);
		}else{
			list = findByWhere(tableName, columns, values);
		}
		if (list == null) {
			return 0;
		}
		return list.size();
	}

	public PageBean getPage() {
		List list = queryByPage(tableName, columns, values, getStartIndex(), page.getPageSize());
		page.setList(list);
		return page;
	}

	public void setPreOrNextBoolean() {
		if (page.getCurrentPage() <= 1) {
			page.setHasPreviousPage(false);
		} else {
			page.setHasPreviousPage(true);
		}
		if (page.getCurrentPage() >= page.getTotalPage()) {
			page.setHasNextPage(false);
		} else {
			page.setHasNextPage(true);
		}
	}

	public void setCurrentPage() {
		if (start < 1) {
			page.setCurrentPage(1);
		}
		if (start > page.getTotalPage()) {
			page.setCurrentPage(page.getTotalPage());
		}
		page.setCurrentPage(start);
	}

	public void setPrePage() {
		page.setPrePage(page.getCurrentPage() - 1);
	}

	public void setNextPage() {
		page.setNextPage(page.getCurrentPage() + 1);
	}

	public void setTotalPage() {
		int rowCount = getRowCount();
		int pageSize = page.getPageSize();
		if (rowCount > pageSize) {
			if (rowCount % pageSize == 0) {
				page.setTotalPage(rowCount / pageSize);
			} else {
				page.setTotalPage(1 + (rowCount / pageSize));
			}
		} else {
			page.setTotalPage(1);
		}
	}

	public void setRowCount() {
		page.setRowCount(getRowCount());
	}

	public int getStartIndex() {
		int startIndex = 0;
		if (start <= 0) {
			startIndex = 0;
		} else {
			if (start > page.getTotalPage()) {
				startIndex = page.getPageSize() * (page.getTotalPage() - 1);
			} else {
				startIndex = page.getPageSize() * (start - 1);
			}
		}
		return startIndex;
	}

}
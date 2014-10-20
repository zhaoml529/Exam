/**
 * Project Name:ExamDemo
 * File Name:Progress.java
 * Package Name:com.rjxy.entity
 * Date:2014-5-20����11:32:18
 *
 */
package com.rjxy.entity;

import com.rjxy.util.JsonUtil;
import com.rjxy.util.NumUtil;



/**
 * @ClassName: Progress
 * @Description:TODO(�ļ��ϴ�����)
 * @author: zml
 * @date: 2014-5-20 ����11:32:18
 *
 */
public class Progress {
	/** �Ѷ��ֽ� **/
	private long bytesRead = 0L;
	/** �Ѷ�MB **/
	private String mbRead = "0";
	/** �ܳ��� **/
	private long contentLength = 0L;
	/****/
	private int items;
	/** �Ѷ��ٷֱ� **/
	private String percent;
	/** ��ȡ�ٶ� **/
	private String speed;
	/** ��ʼ��ȡ��ʱ�� **/
	private long startReatTime = System.currentTimeMillis();
	public long getBytesRead() {
		return bytesRead;
	}

	public void setBytesRead(long bytesRead) {
		this.bytesRead = bytesRead;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public int getItems() {
		return items;
	}

	public void setItems(int items) {
		this.items = items;
	}

	public String getPercent() {
		percent = NumUtil.getPercent(bytesRead, contentLength);
		return percent;
	}

	public void setPercent(String percent) {
		this.percent = percent;
	}

	public String getSpeed() {
		speed = NumUtil.divideNumber(
								NumUtil.divideNumber(bytesRead * 1000, System.currentTimeMillis()- startReatTime), 
								1000);
		return speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	public long getStartReatTime() {
		return startReatTime;
	}

	public void setStartReatTime(long startReatTime) {
		this.startReatTime = startReatTime;
	}

	public String getMbRead() {
		mbRead = NumUtil.divideNumber(bytesRead, 1000000);
		return mbRead;
	}

	public void setMbRead(String mbRead) {
		this.mbRead = mbRead;
	}

	@Override
	public String toString() {
		return JsonUtil.getJsonString4JavaPOJO(this);
	}
	
}

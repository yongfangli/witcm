package com.thinkgem.jeesite.modules.witcm.chart.frontEntity;

import java.text.SimpleDateFormat;
import java.util.Date;

public class VisitEntity {
	private int count;
	private Date visitDate;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public String getMonth(){
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM");
		return dateformat.format(visitDate);
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	
}

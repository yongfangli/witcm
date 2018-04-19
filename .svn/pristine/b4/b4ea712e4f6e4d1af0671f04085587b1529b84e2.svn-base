package com.thinkgem.jeesite.modules.witcm.chart.frontEntity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TreeSet;

import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.witcm.chart.IChartDataResolver;

public class DateUtil implements IChartDataResolver {
	private Integer end;

	public DateUtil(Integer end) {
		this.end = end;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	/**
	 * 前num个月
	 * 
	 * @param num
	 * @return
	 */
	public List<Date> getLastSomeMoth() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(new Date());
		List<Date> dates = new ArrayList<Date>();
		for (int i = 0; i < end; i++) {
			calendar.add(Calendar.MONTH, -1);
			dates.add(calendar.getTime());
		}
		return dates;
	}

	@Override
	public TreeSet<String> getLabels() {
		List<Date> dates = getLastSomeMoth();
		TreeSet<String> labels = new TreeSet<String>();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
		for (Date date : dates) {
			labels.add(dateFormat.format(date));
		}
		return labels;
	}

	public String formatDateString(String date) {
		return date + "-01";
	}

	public Date changeToDate(String date) throws ParseException {
		if(StringUtils.isEmpty(date)){
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM");
			date=dateFormat.format(new Date());
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateString = formatDateString(date);
		return dateFormat.parse(dateString);
	}
}

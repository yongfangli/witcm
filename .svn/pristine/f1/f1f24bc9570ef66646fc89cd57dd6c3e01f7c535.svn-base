package com.thinkgem.jeesite.modules.witcm.chart.frontEntity;

import java.util.List;
import java.util.Random;
import java.util.TreeSet;

public class SortEntity {
	public static final String LINE_CHART = "line";
	public static final String BAR_CHART = "bar";
	public static final String PIE_CHART="pie";

	private String type;// 图表格式
	private TreeSet<String> labels;// 图表的各个线条代表的名称数据
	private List<DataEntity> datasets;
	private String xlabelString;//x轴名称
	private String ylabelString;//y轴名称

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	

	public TreeSet<String> getLabels() {
		return labels;
	}

	public void setLabels(TreeSet<String> labels) {
		this.labels = labels;
	}

	public List<DataEntity> getDatasets() {
		return datasets;
	}

	public void setDatasets(List<DataEntity> datasets) {
		this.datasets = datasets;
	}

	public String getXlabelString() {
		return xlabelString;
	}

	public void setXlabelString(String xlabelString) {
		this.xlabelString = xlabelString;
	}

	public String getYlabelString() {
		return ylabelString;
	}

	public void setYlabelString(String ylabelString) {
		this.ylabelString = ylabelString;
	}
	/**
	 * 设置默认按月来排
	 */
    public void setDefaultMonthLabels(){
    	
    }
	/**
	 * 图表描绘对象
	 * 
	 * @author lyf
	 * 
	 */
	public static class DataEntity {
		private String label;//标题
		private List<Number> data;// 数轴对应得数据
		private List<String> colorList;//颜色列表
		private String backgroundColor;
		private boolean fill;
        private String borderColor;
		public String getLabel() {
			return label;
		}

		public void setLabel(String label) {
			this.label = label;
		}

		public List<String> getColorList() {
			return colorList;
		}

		public void setColorList(List<String> colorList) {
			this.colorList = colorList;
		}

		public List<Number> getData() {
			return data;
		}

		public void setData(List<Number> data) {
			this.data = data;
		}

		public boolean isFill() {
			return fill;
		}

		public void setFill(boolean fill) {
			this.fill = fill;
		}

		public String getBackgroundColor() {
			return backgroundColor;
		}

		public void setBackgroundColor(String backgroundColor) {
			this.backgroundColor = backgroundColor;
		}

		public String getBorderColor() {
			return borderColor;
		}

		public void setBorderColor(String borderColor) {
			this.borderColor = borderColor;
		}

	}
	public static String getRandColorCode(){  
		  String r,g,b;  
		  Random random = new Random();  
		  r = Integer.toHexString(random.nextInt(256)).toUpperCase();  
		  g = Integer.toHexString(random.nextInt(256)).toUpperCase();  
		  b = Integer.toHexString(random.nextInt(256)).toUpperCase();  
		  r = r.length()==1 ? "0" + r : r ;  
		  g = g.length()==1 ? "0" + g : g ;  
		  b = b.length()==1 ? "0" + b : b ;  
		  return "#"+r+g+b;  
		 }
}

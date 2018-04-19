/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.entity;

import java.util.List;

import org.hibernate.validator.constraints.Length;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thinkgem.jeesite.modules.sys.entity.Office;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品类型Entity
 * @author liyongfang
 * @version 2017-12-04
 */
public class GoodsTypes extends DataEntity<GoodsTypes> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String orders;		// 排序
	private String explains;		// 说明
	private GoodsTypes parent;		// 上级ID
	private Office belongOrg;		// 归属机构
	private String belongArea;		// 归属单位
	
	public GoodsTypes() {
		super();
	}

	public GoodsTypes(String id){
		super(id);
	}

	@Length(min=0, max=50, message="名称长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=11, message="排序长度必须介于 0 和 11 之间")
	public String getOrders() {
		return orders;
	}

	public void setOrders(String orders) {
		this.orders = orders;
	}
	
	@Length(min=0, max=500, message="说明长度必须介于 0 和 500 之间")
	public String getExplains() {
		return explains;
	}

	public void setExplains(String explains) {
		this.explains = explains;
	}
	
	@JsonBackReference
	public GoodsTypes getParent() {
		return parent;
	}

	public void setParent(GoodsTypes parent) {
		this.parent = parent;
	}
	
	public Office getBelongOrg() {
		return belongOrg;
	}

	public void setBelongOrg(Office belongOrg) {
		this.belongOrg = belongOrg;
	}
	
	@Length(min=0, max=64, message="归属单位长度必须介于 0 和 64 之间")
	public String getBelongArea() {
		return belongArea;
	}

	public void setBelongArea(String belongArea) {
		this.belongArea = belongArea;
	}
	
	@JsonIgnore
	public static void sortList(List<GoodsTypes> list,List<GoodsTypes> sourcelist, String parentId, boolean cascade){
		for (int i=0; i<sourcelist.size(); i++){
			GoodsTypes e = sourcelist.get(i);
			if(e.getParent()!=null && e.getParent().getId()!=null && e.getParent().getId().equals(parentId)){
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						GoodsTypes child = sourcelist.get(j);
						if (child.getParent()!=null && child.getParent().getId()!=null
								&& child.getParent().getId().equals(e.getId())){
							sortList(list, sourcelist, e.getId(), true);
							break;
						}
					}
				}
			}
		}
	}
	
	@JsonIgnore
	public static String getRootId(){
		return "1";
	}
	
}
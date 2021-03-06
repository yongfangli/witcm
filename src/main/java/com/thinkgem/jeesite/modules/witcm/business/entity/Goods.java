/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.entity;

import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Office;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品Entity
 * @author liyongfang
 * @version 2017-12-04
 */
public class Goods extends DataEntity<Goods> {
	
	private static final long serialVersionUID = 1L;
	private Business business;		// 商户ID
	private GoodsTypes types;		// 商品类别
	private String fullName;		// 商品全称
	private String shortName;		// 商品简称
	private String imagesId;		// 商品图片
	private String price;		// 参考价格
	private String describes;		// 商品描述
	private Date shelDate;		// 上架时间
	private String deleteFlag;		// 删除标记
	private String unshelFlag;		// 是否下架
	private Office belongOrg;		// 归属机构
	private String belongArea;		// 归属单位
	private String searchContent;// 搜索字段
	public Goods() {
		super();
	}

	public Goods(String id){
		super(id);
	}

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}
	
	public GoodsTypes getTypes() {
		return types;
	}

	public void setTypes(GoodsTypes types) {
		this.types = types;
	}
	
	@Length(min=0, max=200, message="商品全称长度必须介于 0 和 200 之间")
	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	@Length(min=0, max=100, message="商品简称长度必须介于 0 和 100 之间")
	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	
	@Length(min=0, max=200, message="商品图片长度必须介于 0 和 200 之间")
	public String getImagesId() {
		return imagesId;
	}

	public void setImagesId(String imagesId) {
		this.imagesId = imagesId;
	}
	
	@Length(min=0, max=100, message="参考价格长度必须介于 0 和 100 之间")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=0, max=2000, message="商品描述长度必须介于 0 和 2000 之间")
	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getShelDate() {
		return shelDate;
	}

	public void setShelDate(Date shelDate) {
		this.shelDate = shelDate;
	}
	
	@Length(min=0, max=2, message="删除标记长度必须介于 0 和 2 之间")
	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	
	@Length(min=0, max=2, message="是否下架长度必须介于 0 和 2 之间")
	public String getUnshelFlag() {
		return unshelFlag;
	}

	public void setUnshelFlag(String unshelFlag) {
		this.unshelFlag = unshelFlag;
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
	
	public void setOrgId(String id){
		if(this.belongOrg==null){
			Office office = new Office();
			office.setId(id);
			this.setBelongOrg(office);
		}else{
			this.belongOrg.setId(id);
		}
	}
	
}
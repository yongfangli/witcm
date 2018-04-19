/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.codeimage.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 二维码生成Entity
 * @author liyongfang
 * @version 2018-01-25
 */
public class CodeImage extends DataEntity<CodeImage> {
	
	private static final long serialVersionUID = 1L;
	private String image;		// 图片地址
	private String title;		// 标题介绍
	
	public CodeImage() {
		super();
	}

	public CodeImage(String id){
		super(id);
	}

	@Length(min=0, max=200, message="图片地址长度必须介于 0 和 200 之间")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@Length(min=0, max=50, message="标题介绍长度必须介于 0 和 50 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.entity;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.common.utils.excel.annotation.ExcelField;

/**
 * 居民Entity
 * 
 * @author liyongfang
 * @version 2017-12-04
 */
public class Resident extends DataEntity<Resident> {

	private static final long serialVersionUID = 1L;
	private String name; // 姓名
	private String gender; // 性别
	private String identityNo; // 身份证号码
	private String phone; // 家庭电话
	private String telphone; // 手机号码
	private String loginPswd; // 密码
	private String reloginPswd; // 重复密码
	private String qqNo; // QQ号
	private String buildingNo; // 楼栋号
	private String personDesc; // 个人简介
	private String imagesId; // 头像
	private Float totalPoints; // 总积分
	private Float usablePoints; // 可用积分
	private Float usedPoints; // 已用积分
	private String aduitStatus; // 审核状态(待审核、审核通过、审核不通过)
	private Date aduitDate; // 审核时间
	private String aduitUserId; // 审核人
	private Date loginDate; // 最后登录时间
	private String loginFlag; // 是否可登录
	private String deleteFlag; // 删除标记
	private Office belongOrg; // 归属机构
	private String belongArea; // 归属单位
	private String loginFlagResolveUrl; // 是否可登录设置url
	private String loginText; // 是否可登录状态内容
	private String likeName;// 搜索字段
    private String eqPhone;// 等于手机号的搜索条件接收值
	
	public Resident() {
		super();
	}

	public Resident(String id) {
		super(id);
	}

	@NotEmpty
	@Length(min = 0, max = 50, message = "姓名长度必须介于 0 和 50 之间")
	@ExcelField(title = "姓名", align = 2, sort = 5)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLikeName() {
		return likeName;
	}

	public void setLikeName(String likeName) {
		this.likeName = likeName;
	}

	public String getReloginPswd() {
		return reloginPswd;
	}

	public void setReloginPswd(String reloginPswd) {
		this.reloginPswd = reloginPswd;
	}

	@NotEmpty
	@Length(min = 0, max = 64, message = "性别长度必须介于 0 和 64 之间")
	@ExcelField(title = "性别", dictType = "gender", align = 2, sort = 10)
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@NotEmpty
	@Length(min = 0, max = 50, message = "身份证号码长度必须介于 0 和 50 之间")
	@Pattern(regexp = "(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$)", message = "身份证格式不正确")
	@ExcelField(title = "身份证号", align = 2, sort = 15)
	public String getIdentityNo() {
		return identityNo;
	}

	public void setIdentityNo(String identityNo) {
		this.identityNo = identityNo;
	}

	@Length(min = 0, max = 30, message = "家庭电话长度必须介于 0 和 30 之间")
	@Pattern(regexp = "^(\\(\\d{3,4}\\)|\\d{3,4}-|\\s)?\\d{7,14}$", message = "家庭电话格式不正确")
	@ExcelField(title = "家庭电话", align = 2, sort = 20)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@NotEmpty
	@Length(min = 0, max = 30, message = "手机号码长度必须介于 0 和 30 之间")
	@Pattern(regexp = "^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$", message = "手机号格式不正确")
	@ExcelField(title = "手机号", align = 2, sort = 25)
	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	@NotEmpty
	@Length(min = 0, max = 200, message = "密码长度必须介于 0 和 200之间")
	public String getLoginPswd() {
		return loginPswd;
	}

	public void setLoginPswd(String loginPswd) {
		this.loginPswd = loginPswd;
	}

	@Length(min = 0, max = 30, message = "QQ号长度必须介于 0 和 30 之间")
	@Pattern(regexp = "^[0-9]{1,}$", message = "qq格式不正确")
	public String getQqNo() {
		return qqNo;
	}

	public void setQqNo(String qqNo) {
		this.qqNo = qqNo;
	}

	@NotEmpty
	@Length(min = 0, max = 50, message = "楼栋号长度必须介于 0 和 50 之间")
	@ExcelField(title = "楼栋号", align = 2, sort = 35)
	public String getBuildingNo() {
		return buildingNo;
	}

	public void setBuildingNo(String buildingNo) {
		this.buildingNo = buildingNo;
	}

	@Length(min = 0, max = 2000, message = "个人简介长度必须介于 0 和 2000 之间")
	public String getPersonDesc() {
		return personDesc;
	}

	public void setPersonDesc(String personDesc) {
		this.personDesc = personDesc;
	}

	@Length(min = 0, max = 200, message = "头像长度必须介于 0 和 64 之间")
	public String getImagesId() {
		return imagesId;
	}

	public void setImagesId(String imagesId) {
		this.imagesId = imagesId;
	}

	public Float getTotalPoints() {
		return totalPoints;
	}

	public void setTotalPoints(Float totalPoints) {
		this.totalPoints = totalPoints;
	}

	public Float getUsablePoints() {
		return usablePoints;
	}

	public void setUsablePoints(Float usablePoints) {
		this.usablePoints = usablePoints;
	}

	public Float getUsedPoints() {
		return usedPoints;
	}

	public void setUsedPoints(Float usedPoints) {
		this.usedPoints = usedPoints;
	}

	@NotEmpty
	@Length(min = 0, max = 2, message = "审核状态(待审核、审核通过、审核不通过)长度必须介于 0 和 2 之间")
	public String getAduitStatus() {
		return aduitStatus;
	}

	public void setAduitStatus(String aduitStatus) {
		this.aduitStatus = aduitStatus;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getAduitDate() {
		return aduitDate;
	}

	public void setAduitDate(Date aduitDate) {
		this.aduitDate = aduitDate;
	}

	@Length(min = 0, max = 64, message = "审核人长度必须介于 0 和 64 之间")
	public String getAduitUserId() {
		return aduitUserId;
	}

	public void setAduitUserId(String aduitUserId) {
		this.aduitUserId = aduitUserId;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	@NotEmpty
	@Length(min = 0, max = 2, message = "是否可登录长度必须介于 0 和 2 之间")
	public String getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
	}

	@Length(min = 0, max = 2, message = "删除标记长度必须介于 0 和 2 之间")
	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	@NotNull(message = "所属小区不能为空")
	@ExcelField(title = "所属小区", align = 2, sort = 40)
	public Office getBelongOrg() {
		return belongOrg;
	}

	public void setBelongOrg(Office belongOrg) {
		this.belongOrg = belongOrg;
	}

	@Length(min = 0, max = 64, message = "归属单位长度必须介于 0 和 64 之间")
	public String getBelongArea() {
		return belongArea;
	}

	public void setBelongArea(String belongArea) {
		this.belongArea = belongArea;
	}

	public String getLoginFlagResolveUrl() {
		return loginFlagResolveUrl;
	}

	public void setLoginFlagResolveUrl(String loginFlagResolveUrl) {
		this.loginFlagResolveUrl = loginFlagResolveUrl;
	}

	public String getLoginText() {
		return loginText;
	}

	public void setLoginText(String loginText) {
		this.loginText = loginText;
	}

	public String getEqPhone() {
		return eqPhone;
	}

	public void setEqPhone(String eqPhone) {
		this.eqPhone = eqPhone;
	}

}
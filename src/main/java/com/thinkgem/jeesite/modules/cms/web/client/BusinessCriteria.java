package com.thinkgem.jeesite.modules.cms.web.client;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.utils.StringUtils;

/**
 * 作为周边商家搜索数据封装
 * 
 * @author lyf
 * 
 */
public class BusinessCriteria {
	private String areaId;// 区域id
	private String typeId;// 类型id
	private String sortByComment;// 是否按好评度排序（0，不是，1：是）
	private String sortByCollect;// 是否按被收藏量来排序（0，不是，1：是）
	private String sortByDistance;// 是否按距离来排序（0，不是，1：是）

	/**
	 * 没有选择区域，查找所有的
	 * 
	 * @return
	 */
	public boolean areaAll() {
		return null == areaId || StringUtils.isEmpty(areaId);
	}

	/**
	 * 没有选择类型，查找所有的
	 * 
	 * @return
	 */
	public boolean typeAll() {
		return null == typeId || StringUtils.isEmpty(typeId);
	}

	/**
	 * 是否不按照前台的选项排序
	 * 
	 * @return
	 */
	public boolean notSort() {
		return (null == sortByComment || StringUtils.isEmpty(sortByComment) || sortByComment == Global.NO)
				&& (null == sortByCollect || StringUtils.isEmpty(sortByCollect) || sortByCollect == Global.NO)
				|| (null == sortByDistance
						|| StringUtils.isEmpty(sortByDistance) || sortByDistance == Global.NO);
	}

	/**
	 * 是否只是按评价排序
	 * 
	 * @return
	 */
	public boolean sortByCommentsOnly() {
		return StringUtils.isEmpty(sortByCollect)
				&& StringUtils.isEmpty(sortByDistance)
				&& StringUtils.isNotEmpty(sortByComment)
				&& sortByComment.equals(Global.YES);
	}

	/**
	 * 是否只是按收藏排序
	 * 
	 * @return
	 */
	public boolean sortByCollectOnly() {
		return StringUtils.isEmpty(sortByComment)
				&& StringUtils.isEmpty(sortByDistance)
				&& StringUtils.isNotEmpty(sortByCollect)
				&& sortByCollect.equals(Global.YES);
	}

	/**
	 * 是否只是按评价和收藏排序
	 * 
	 * @return
	 */
	public boolean sortByCollectAndComment() {
		return StringUtils.isEmpty(sortByDistance)
				&& StringUtils.isNotEmpty(sortByCollect)
				&& sortByCollect.equals(Global.YES)
				&& StringUtils.isNotEmpty(sortByComment)
				&& sortByComment.equals(Global.YES);
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public String getSortByComment() {
		return sortByComment;
	}

	public void setSortByComment(String sortByComment) {
		this.sortByComment = sortByComment;
	}

	public String getSortByCollect() {
		return sortByCollect;
	}

	public void setSortByCollect(String sortByCollect) {
		this.sortByCollect = sortByCollect;
	}

	public String getSortByDistance() {
		return sortByDistance;
	}

	public void setSortByDistance(String sortByDistance) {
		this.sortByDistance = sortByDistance;
	}

}

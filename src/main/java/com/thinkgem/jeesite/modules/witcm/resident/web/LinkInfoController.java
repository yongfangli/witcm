/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.LinkInfo;
import com.thinkgem.jeesite.modules.witcm.resident.service.LinkInfoService;

/**
 * 友情链接Controller
 * @author luoyang
 * @version 2017-12-27
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/linkInfo")
public class LinkInfoController extends BaseController {

	@Autowired
	private LinkInfoService linkInfoService;
	
	@ModelAttribute
	public LinkInfo get(@RequestParam(required=false) String id) {
		LinkInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = linkInfoService.get(id);
		}
		if (entity == null){
			entity = new LinkInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:linkInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(LinkInfo linkInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LinkInfo> page = linkInfoService.findPage(new Page<LinkInfo>(request, response), linkInfo); 
		model.addAttribute("page", page);
		return "witcm/resident/linkInfoList";
	}

	@RequiresPermissions("resident:linkInfo:view")
	@RequestMapping(value = "form")
	public String form(LinkInfo linkInfo, Model model) {
		model.addAttribute("linkInfo", linkInfo);
		return "witcm/resident/linkInfoForm";
	}

	@RequiresPermissions("resident:linkInfo:edit")
	@RequestMapping(value = "save")
	public String save(LinkInfo linkInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, linkInfo)){
			return form(linkInfo, model);
		}
		linkInfoService.save(linkInfo);
		addMessage(redirectAttributes, "保存友情链接成功");
		return "redirect:"+Global.getAdminPath()+"/resident/linkInfo/?repage";
	}
	
	@RequiresPermissions("resident:linkInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(LinkInfo linkInfo, RedirectAttributes redirectAttributes) {
		linkInfoService.delete(linkInfo);
		addMessage(redirectAttributes, "删除友情链接成功");
		return "redirect:"+Global.getAdminPath()+"/resident/linkInfo/?repage";
	}

}
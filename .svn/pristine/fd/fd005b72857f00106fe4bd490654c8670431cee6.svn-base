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
import com.thinkgem.jeesite.modules.witcm.resident.entity.BuildNo;
import com.thinkgem.jeesite.modules.witcm.resident.service.BuildNoService;

/**
 * 楼栋信息Controller
 * @author luoyang
 * @version 2017-12-27
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/buildNo")
public class BuildNoController extends BaseController {

	@Autowired
	private BuildNoService buildNoService;
	
	@ModelAttribute
	public BuildNo get(@RequestParam(required=false) String id) {
		BuildNo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = buildNoService.get(id);
		}
		if (entity == null){
			entity = new BuildNo();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:buildNo:view")
	@RequestMapping(value = {"list", ""})
	public String list(BuildNo buildNo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<BuildNo> page = buildNoService.findPage(new Page<BuildNo>(request, response), buildNo); 
		model.addAttribute("page", page);
		return "witcm/resident/buildNoList";
	}

	@RequiresPermissions("resident:buildNo:view")
	@RequestMapping(value = "form")
	public String form(BuildNo buildNo, Model model) {
		model.addAttribute("buildNo", buildNo);
		return "witcm/resident/buildNoForm";
	}

	@RequiresPermissions("resident:buildNo:edit")
	@RequestMapping(value = "save")
	public String save(BuildNo buildNo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, buildNo)){
			return form(buildNo, model);
		}
		buildNoService.save(buildNo);
		addMessage(redirectAttributes, "保存楼栋信息成功");
		return "redirect:"+Global.getAdminPath()+"/resident/buildNo/?repage";
	}
	
	@RequiresPermissions("resident:buildNo:edit")
	@RequestMapping(value = "delete")
	public String delete(BuildNo buildNo, RedirectAttributes redirectAttributes) {
		buildNoService.delete(buildNo);
		addMessage(redirectAttributes, "删除楼栋信息成功");
		return "redirect:"+Global.getAdminPath()+"/resident/buildNo/?repage";
	}

}
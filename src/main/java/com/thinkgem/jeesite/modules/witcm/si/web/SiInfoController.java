/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.web;

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
import com.thinkgem.jeesite.modules.witcm.si.entity.SiInfo;
import com.thinkgem.jeesite.modules.witcm.si.service.SiInfoService;

/**
 * si信息管理Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/si/siInfo")
public class SiInfoController extends BaseController {

	@Autowired
	private SiInfoService siInfoService;
	
	@ModelAttribute
	public SiInfo get(@RequestParam(required=false) String id) {
		SiInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = siInfoService.get(id);
		}
		if (entity == null){
			entity = new SiInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("si:siInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(SiInfo siInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SiInfo> page = siInfoService.findPage(new Page<SiInfo>(request, response), siInfo); 
		model.addAttribute("page", page);
		return "witcm/si/siInfoList";
	}

	@RequiresPermissions("si:siInfo:view")
	@RequestMapping(value = "form")
	public String form(SiInfo siInfo, Model model) {
		model.addAttribute("siInfo", siInfo);
		return "witcm/si/siInfoForm";
	}

	@RequiresPermissions("si:siInfo:edit")
	@RequestMapping(value = "save")
	public String save(SiInfo siInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, siInfo)){
			return form(siInfo, model);
		}
		siInfoService.save(siInfo);
		addMessage(redirectAttributes, "保存si信息管理成功");
		return "redirect:"+Global.getAdminPath()+"/si/siInfo/?repage";
	}
	
	@RequiresPermissions("si:siInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(SiInfo siInfo, RedirectAttributes redirectAttributes) {
		siInfoService.delete(siInfo);
		addMessage(redirectAttributes, "删除si信息管理成功");
		return "redirect:"+Global.getAdminPath()+"/si/siInfo/?repage";
	}

}
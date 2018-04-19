/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.resident.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Consult;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.service.ConsultService;

/**
 * 咨询Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/consult")
public class ConsultController extends BaseController {

	@Autowired
	private ConsultService consultService;
	
	@ModelAttribute
	public Consult get(@RequestParam(required=false) String id) {
		Consult entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = consultService.get(id);
		}
		if (entity == null){
			entity = new Consult();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:consult:view")
	@RequestMapping(value = {"list", ""})
	public String list(Consult consult, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Consult> page = consultService.findPage(new Page<Consult>(request, response), consult); 
		model.addAttribute("page", page);
		return "witcm/resident/consultList";
	}

	@RequiresPermissions("resident:consult:view")
	@RequestMapping(value = "form")
	public String form(Consult consult, Model model) {
		model.addAttribute("consult", consult);
		return "witcm/resident/consultForm";
	}

	@RequiresPermissions("resident:consult:edit")
	@RequestMapping(value = "save")
	public String save(Consult consult, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, consult)){
			return form(consult, model);
		}
		consultService.save(consult);
		addMessage(redirectAttributes, "保存咨询成功");
		return "redirect:"+Global.getAdminPath()+"/resident/consult/?repage";
	}
	
	@RequiresPermissions("resident:consult:edit")
	@RequestMapping(value = "delete")
	public String delete(Consult consult, RedirectAttributes redirectAttributes) {
		consultService.delete(consult);
		addMessage(redirectAttributes, "删除咨询成功");
		return "redirect:"+Global.getAdminPath()+"/resident/consult/?repage";
	}
	
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(
			@RequestParam(required = false) String officeId,
			HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Consult> list = consultService.findByOfficeId(officeId);
		for (int i = 0; i < list.size(); i++) {
			Consult e = list.get(i);
			Map<String, Object> map = Maps.newHashMap();
			map.put("id", "u_" + e.getId());
			map.put("pId", officeId);
			map.put("name", StringUtils.replace(e.getTitles(), " ", ""));
			mapList.add(map);
		}
		return mapList;
	}

}
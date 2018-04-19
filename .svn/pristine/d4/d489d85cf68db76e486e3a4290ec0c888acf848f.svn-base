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
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Collect;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.service.CollectService;

/**
 * 收藏Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/collect")
public class CollectController extends BaseController {

	@Autowired
	private CollectService collectService;
	
	@ModelAttribute
	public Collect get(@RequestParam(required=false) String id) {
		Collect entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = collectService.get(id);
		}
		if (entity == null){
			entity = new Collect();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:collect:view")
	@RequestMapping(value = {"list", ""})
	public String list(Collect collect, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		for(Role role:user.getRoleList()){
			if("社区管理人员".equals(role.getName())){
				if(collect.getResident()==null){
					Resident resident = new Resident();
					resident.setBelongOrg(user.getCompany());
					collect.setResident(resident);
				}else{
					collect.getResident().setBelongOrg(user.getOffice());
				}
				break;
			}
		}
		Page<Collect> page = collectService.findPage(new Page<Collect>(request, response), collect); 
		model.addAttribute("page", page);
		return "witcm/resident/collectList";
	}

	@RequiresPermissions("resident:collect:view")
	@RequestMapping(value = "form")
	public String form(Collect collect, Model model) {
		model.addAttribute("collect", collect);
		return "witcm/resident/collectForm";
	}

	@RequiresPermissions("resident:collect:edit")
	@RequestMapping(value = "save")
	public String save(Collect collect, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, collect)){
			return form(collect, model);
		}
		collectService.save(collect);
		addMessage(redirectAttributes, "保存收藏成功");
		return "redirect:"+Global.getAdminPath()+"/resident/collect/?repage";
	}
	
	@RequiresPermissions("resident:collect:edit")
	@RequestMapping(value = "delete")
	public String delete(Collect collect, RedirectAttributes redirectAttributes) {
		collectService.delete(collect);
		addMessage(redirectAttributes, "删除收藏成功");
		return "redirect:"+Global.getAdminPath()+"/resident/collect/?repage";
	}

}
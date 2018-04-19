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
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.ConsultReply;
import com.thinkgem.jeesite.modules.witcm.resident.service.ConsultReplyService;

/**
 * 咨询回复Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/consultReply")
public class ConsultReplyController extends BaseController {

	@Autowired
	private ConsultReplyService consultReplyService;
	
	@ModelAttribute
	public ConsultReply get(@RequestParam(required=false) String id) {
		ConsultReply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = consultReplyService.get(id);
		}
		if (entity == null){
			entity = new ConsultReply();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:consultReply:view")
	@RequestMapping(value = {"list", ""})
	public String list(ConsultReply consultReply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<ConsultReply> page = consultReplyService.findPage(new Page<ConsultReply>(request, response), consultReply); 
		model.addAttribute("page", page);
		return "witcm/resident/consultReplyList";
	}

	@RequiresPermissions("resident:consultReply:view")
	@RequestMapping(value = "form")
	public String form(ConsultReply consultReply, Model model) {
		model.addAttribute("consultReply", consultReply);
		return "witcm/resident/consultReplyForm";
	}

	@RequiresPermissions("resident:consultReply:edit")
	@RequestMapping(value = "save")
	public String save(ConsultReply consultReply, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, consultReply)){
			return form(consultReply, model);
		}
		consultReply.setUser(UserUtils.getUser());
		consultReplyService.save(consultReply);
		addMessage(redirectAttributes, "保存咨询回复成功");
		return "redirect:"+Global.getAdminPath()+"/resident/consultReply/?repage";
	}
	
	@RequiresPermissions("resident:consultReply:edit")
	@RequestMapping(value = "delete")
	public String delete(ConsultReply consultReply, RedirectAttributes redirectAttributes) {
		consultReplyService.delete(consultReply);
		addMessage(redirectAttributes, "删除咨询回复成功");
		return "redirect:"+Global.getAdminPath()+"/resident/consultReply/?repage";
	}

}
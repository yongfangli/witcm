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
import com.thinkgem.jeesite.modules.witcm.resident.entity.CommentReply;
import com.thinkgem.jeesite.modules.witcm.resident.service.CommentReplyService;

/**
 * 评论回复Controller
 * @author liyongfang
 * @version 2017-12-09
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/commentReply")
public class CommentReplyController extends BaseController {

	@Autowired
	private CommentReplyService commentReplyService;
	
	@ModelAttribute
	public CommentReply get(@RequestParam(required=false) String id) {
		CommentReply entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = commentReplyService.get(id);
		}
		if (entity == null){
			entity = new CommentReply();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:commentReply:view")
	@RequestMapping(value = {"list", ""})
	public String list(CommentReply commentReply, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CommentReply> page = commentReplyService.findPage(new Page<CommentReply>(request, response), commentReply); 
		model.addAttribute("page", page);
		return "witcm/resident/commentReplyList";
	}

	@RequiresPermissions("resident:commentReply:view")
	@RequestMapping(value = "form")
	public String form(CommentReply commentReply, Model model) {
		model.addAttribute("commentReply", commentReply);
		return "witcm/resident/commentReplyForm";
	}

	@RequiresPermissions("resident:commentReply:edit")
	@RequestMapping(value = "save")
	public String save(CommentReply commentReply, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, commentReply)){
			return form(commentReply, model);
		}
		commentReplyService.save(commentReply);
		addMessage(redirectAttributes, "保存评论回复成功");
		return "redirect:"+Global.getAdminPath()+"/resident/commentReply/?repage";
	}
	
	@RequiresPermissions("resident:commentReply:edit")
	@RequestMapping(value = "delete")
	public String delete(CommentReply commentReply, RedirectAttributes redirectAttributes) {
		commentReplyService.delete(commentReply);
		addMessage(redirectAttributes, "删除评论回复成功");
		return "redirect:"+Global.getAdminPath()+"/resident/commentReply/?repage";
	}

}
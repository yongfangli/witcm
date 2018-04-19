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
import com.thinkgem.jeesite.modules.witcm.resident.entity.Comments;
import com.thinkgem.jeesite.modules.witcm.resident.service.CommentsService;

/**
 * 评论Controller
 * @author liyongfang
 * @version 2017-12-09
 */
@Controller
@RequestMapping(value = "${adminPath}/resident/comments")
public class CommentsController extends BaseController {

	@Autowired
	private CommentsService commentsService;
	
	@ModelAttribute
	public Comments get(@RequestParam(required=false) String id) {
		Comments entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = commentsService.get(id);
		}
		if (entity == null){
			entity = new Comments();
		}
		return entity;
	}
	
	@RequiresPermissions("resident:comments:view")
	@RequestMapping(value = {"list", ""})
	public String list(Comments comments, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Comments> page = commentsService.findPage(new Page<Comments>(request, response), comments); 
		model.addAttribute("page", page);
		return "witcm/resident/commentsList";
	}

	@RequiresPermissions("resident:comments:view")
	@RequestMapping(value = "form")
	public String form(Comments comments, Model model) {
		model.addAttribute("comments", comments);
		return "witcm/resident/commentsForm";
	}

	@RequiresPermissions("resident:comments:edit")
	@RequestMapping(value = "save")
	public String save(Comments comments, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, comments)){
			return form(comments, model);
		}
		commentsService.save(comments);
		addMessage(redirectAttributes, "保存评论成功");
		return "redirect:"+Global.getAdminPath()+"/resident/comments/?repage";
	}
	
	@RequiresPermissions("resident:comments:edit")
	@RequestMapping(value = "delete")
	public String delete(Comments comments, RedirectAttributes redirectAttributes) {
		commentsService.delete(comments);
		addMessage(redirectAttributes, "删除评论成功");
		return "redirect:"+Global.getAdminPath()+"/resident/comments/?repage";
	}

}
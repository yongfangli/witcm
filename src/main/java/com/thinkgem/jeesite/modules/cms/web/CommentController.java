/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.web;

import java.util.Date;

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

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Comment;
import com.thinkgem.jeesite.modules.cms.service.CommentService;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Comments;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.service.CommentsService;

/**
 * 评论Controller
 * @author ThinkGem
 * @version 2013-3-23
 */
@Controller
@RequestMapping(value = "${adminPath}/cms/comment")
public class CommentController extends BaseController {

	@Autowired
	private CommentService commentService;
	@Autowired
	private CommentsService commentsService;
	
	@ModelAttribute
	public Comment get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return commentService.get(id);
		}else{
			return new Comment();
		}
	}
	
	@RequiresPermissions("cms:comment:view")
	@RequestMapping(value = {"list", ""})
	public String list(Comments comment, HttpServletRequest request, HttpServletResponse response, Model model) {
		Resident resident = new Resident();
		resident.setBelongOrg(UserUtils.getUser().getCompany());
		if(UserUtils.checkRole("社区管理人员")){
			comment.setResident(resident);
		}
		Page<Comments> searchPage = new Page<Comments>(request,response);
        Page<Comments> page = commentsService.findPage(searchPage, comment); 
        model.addAttribute("page", page);
        model.addAttribute("comment", comment);
		return "modules/cms/commentList";
	}
	
	@RequiresPermissions("cms:comment:edit")
	@RequestMapping(value = "deleteC")
	public String deleteC(Comments comment, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		commentsService.delete(comment);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + adminPath + "/cms/comment/list";
	}
	
	@RequiresPermissions("cms:comment:edit")
	@RequestMapping(value = "formC")
	public String formC(Comments comment,Model model) {
		
		Comments comments = commentsService.get(comment.getId());
		model.addAttribute("comments",comments);
		return "witcm/resident/commentsForm";
	}

	@RequiresPermissions("cms:comment:edit")
	@RequestMapping(value = "save")
	public String save(Comment comment, RedirectAttributes redirectAttributes) {
		if (beanValidator(redirectAttributes, comment)){
			if (comment.getAuditUser() == null){
				comment.setAuditUser(UserUtils.getUser());
				comment.setAuditDate(new Date());
			}
			comment.setDelFlag(Comment.DEL_FLAG_NORMAL);
			commentService.save(comment);
			addMessage(redirectAttributes, DictUtils.getDictLabel(comment.getDelFlag(), "cms_del_flag", "保存")
					+"评论'" + StringUtils.abbr(StringUtils.replaceHtml(comment.getContent()),50) + "'成功");
		}
		return "redirect:" + adminPath + "/cms/comment/?repage&delFlag=2";
	}
	
	@RequiresPermissions("cms:comment:edit")
	@RequestMapping(value = "delete")
	public String delete(Comment comment, @RequestParam(required=false) Boolean isRe, RedirectAttributes redirectAttributes) {
		commentService.delete(comment, isRe);
		addMessage(redirectAttributes, (isRe!=null&&isRe?"恢复审核":"删除")+"评论成功");
		return "redirect:" + adminPath + "/cms/comment/?repage&delFlag=2";
	}

}

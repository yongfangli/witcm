/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.web;

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
import com.thinkgem.jeesite.modules.witcm.business.entity.GoodsComments;
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsCommentsService;

/**
 * 商品评价Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/business/goodsComments")
public class GoodsCommentsController extends BaseController {

	@Autowired
	private GoodsCommentsService goodsCommentsService;
	
	@ModelAttribute
	public GoodsComments get(@RequestParam(required=false) String id) {
		GoodsComments entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsCommentsService.get(id);
		}
		if (entity == null){
			entity = new GoodsComments();
		}
		return entity;
	}
	
	@RequiresPermissions("business:goodsComments:view")
	@RequestMapping(value = {"list", ""})
	public String list(GoodsComments goodsComments, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<GoodsComments> page = goodsCommentsService.findPage(new Page<GoodsComments>(request, response), goodsComments); 
		model.addAttribute("page", page);
		return "witcm/business/goodsCommentsList";
	}

	@RequiresPermissions("business:goodsComments:view")
	@RequestMapping(value = "form")
	public String form(GoodsComments goodsComments, Model model) {
		model.addAttribute("goodsComments", goodsComments);
		return "witcm/business/goodsCommentsForm";
	}

	@RequiresPermissions("business:goodsComments:edit")
	@RequestMapping(value = "save")
	public String save(GoodsComments goodsComments, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goodsComments)){
			return form(goodsComments, model);
		}
		goodsCommentsService.save(goodsComments);
		addMessage(redirectAttributes, "保存商品评价成功");
		return "redirect:"+Global.getAdminPath()+"/business/goodsComments/?repage";
	}
	
	@RequiresPermissions("business:goodsComments:edit")
	@RequestMapping(value = "delete")
	public String delete(GoodsComments goodsComments, RedirectAttributes redirectAttributes) {
		goodsCommentsService.delete(goodsComments);
		addMessage(redirectAttributes, "删除商品评价成功");
		return "redirect:"+Global.getAdminPath()+"/business/goodsComments/?repage";
	}

}
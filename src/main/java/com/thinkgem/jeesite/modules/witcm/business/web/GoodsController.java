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
import com.thinkgem.jeesite.modules.sys.entity.Role;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.business.entity.Goods;
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsService;

/**
 * 商品Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/business/goods")
public class GoodsController extends BaseController {

	@Autowired
	private GoodsService goodsService;
	
	@ModelAttribute
	public Goods get(@RequestParam(required=false) String id) {
		Goods entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsService.get(id);
		}
		if (entity == null){
			entity = new Goods();
		}
		return entity;
	}
	
	@RequiresPermissions("business:goods:view")
	@RequestMapping(value = {"list", ""})
	public String list(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = UserUtils.getUser();
		for(Role role:user.getRoleList()){
			if("社区管理人员".equals(role.getName())){
				goods.setOrgId(user.getCompany().getId());
			}
		}
		Page<Goods> page = goodsService.findPage(new Page<Goods>(request, response), goods); 
		model.addAttribute("page", page);
		return "witcm/business/goodsList";
	}
	
	@RequiresPermissions("business:goods:view")
	@RequestMapping(value = {"blist"})
	public String blist(Goods goods, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Goods> page = goodsService.findPage(new Page<Goods>(request, response), goods); 
		model.addAttribute("page", page);
		return "witcm/business/bgoodsList";
	}

	@RequiresPermissions("business:goods:view")
	@RequestMapping(value = "form")
	public String form(Goods goods, Model model) {
		model.addAttribute("goods", goods);
		return "witcm/business/goodsForm";
	}
	
	@RequiresPermissions("business:goods:view")
	@RequestMapping(value = "bform")
	public String bform(Goods goods, Model model) {
		model.addAttribute("goods", goods);
		return "witcm/business/bgoodsForm";
	}

	@RequiresPermissions("business:goods:edit")
	@RequestMapping(value = "save")
	public String save(Goods goods, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goods)){
			return form(goods, model);
		}
		goodsService.save(goods);
		addMessage(redirectAttributes, "保存商品成功");
		return "redirect:"+Global.getAdminPath()+"/business/goods/?repage";
	}
	
	@RequiresPermissions("business:goods:edit")
	@RequestMapping(value = "bsave")
	public String bsave(Goods goods, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goods)){
			return form(goods, model);
		}
		goodsService.save(goods);
		addMessage(redirectAttributes, "保存商品成功");
		return "redirect:"+Global.getAdminPath()+"/business/goods/blist?repage&business.id="+goods.getBusiness().getId();
	}
	
	@RequiresPermissions("business:goods:edit")
	@RequestMapping(value = "delete")
	public String delete(Goods goods, RedirectAttributes redirectAttributes) {
		goodsService.delete(goods);
		addMessage(redirectAttributes, "删除商品成功");
		return "redirect:"+Global.getAdminPath()+"/business/goods/?repage";
	}

}
/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.business.web;

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
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.witcm.business.entity.GoodsTypes;
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsTypesService;

/**
 * 商品类别Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/business/goodsTypes")
public class GoodsTypesController extends BaseController {

	@Autowired
	private GoodsTypesService goodsTypesService;
	
	@ModelAttribute
	public GoodsTypes get(@RequestParam(required=false) String id) {
		GoodsTypes entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = goodsTypesService.get(id);
		}
		if (entity == null){
			entity = new GoodsTypes();
		}
		return entity;
	}
	
	@RequiresPermissions("business:goodsTypes:view")
	@RequestMapping(value = {"list", ""})
	public String list(GoodsTypes goodsTypes, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<GoodsTypes> list =  Lists.newArrayList();
		List<GoodsTypes> sourcelist = goodsTypesService.findList(goodsTypes);
		GoodsTypes.sortList(list, sourcelist, GoodsTypes.getRootId(), true);
		model.addAttribute("list", list);
		return "witcm/business/goodsTypesList";
	}

	@RequiresPermissions("business:goodsTypes:view")
	@RequestMapping(value = "form")
	public String form(GoodsTypes goodsTypes, Model model) {
		if (goodsTypes.getParent()==null||goodsTypes.getParent().getId()==null){
			goodsTypes.setParent(new GoodsTypes(GoodsTypes.getRootId()));
		}
		goodsTypes.setParent(goodsTypesService.get(goodsTypes.getParent().getId()));
		
		model.addAttribute("goodsTypes", goodsTypes);
		return "witcm/business/goodsTypesForm";
	}

	@RequiresPermissions("business:goodsTypes:edit")
	@RequestMapping(value = "save")
	public String save(GoodsTypes goodsTypes, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, goodsTypes)){
			return form(goodsTypes, model);
		}
		goodsTypesService.save(goodsTypes);
		addMessage(redirectAttributes, "保存商品类别成功");
		return "redirect:"+Global.getAdminPath()+"/business/goodsTypes/?repage";
	}
	
	@RequiresPermissions("business:goodsTypes:edit")
	@RequestMapping(value = "delete")
	public String delete(GoodsTypes goodsTypes, RedirectAttributes redirectAttributes) {
		goodsTypesService.delete(goodsTypes);
		addMessage(redirectAttributes, "删除商品类别成功");
		return "redirect:"+Global.getAdminPath()+"/business/goodsTypes/?repage";
	}
	
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<GoodsTypes> list = goodsTypesService.findAllList(new GoodsTypes());
		for (int i=0; i<list.size(); i++){
			GoodsTypes e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()))){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent()!=null ? e.getParent().getId() : "");
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		
		return mapList;
	}

}
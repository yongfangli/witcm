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
import com.thinkgem.jeesite.modules.witcm.business.entity.BusinessTypes;
import com.thinkgem.jeesite.modules.witcm.business.service.BusinessTypesService;

/**
 * 商户类型Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/business/businessTypes")
public class BusinessTypesController extends BaseController {

	@Autowired
	private BusinessTypesService businessTypesService;
	
	@ModelAttribute
	public BusinessTypes get(@RequestParam(required=false) String id) {
		BusinessTypes entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = businessTypesService.get(id);
		}
		if (entity == null){
			entity = new BusinessTypes();
		}
		return entity;
	}
	
	@RequiresPermissions("business:businessTypes:view")
	@RequestMapping(value = {"list", ""})
	public String list(BusinessTypes businessTypes, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<BusinessTypes> list =  Lists.newArrayList();
		List<BusinessTypes> sourcelist = businessTypesService.findList(businessTypes);
		BusinessTypes.sortList(list, sourcelist, BusinessTypes.getRootId(), true);
		model.addAttribute("list", list);
		return "witcm/business/businessTypesList";
	}

	@RequiresPermissions("business:businessTypes:view")
	@RequestMapping(value = "form")
	public String form(BusinessTypes businessTypes, Model model) {
		if (businessTypes.getParent()==null||businessTypes.getParent().getId()==null){
			businessTypes.setParent(new BusinessTypes(BusinessTypes.getRootId()));
		}
		businessTypes.setParent(businessTypesService.get(businessTypes.getParent().getId()));
		model.addAttribute("businessTypes", businessTypes);
		return "witcm/business/businessTypesForm";
	}

	@RequiresPermissions("business:businessTypes:edit")
	@RequestMapping(value = "save")
	public String save(BusinessTypes businessTypes, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, businessTypes)){
			return form(businessTypes, model);
		}
		businessTypesService.save(businessTypes);
		addMessage(redirectAttributes, "保存商户类别成功");
		return "redirect:"+Global.getAdminPath()+"/business/businessTypes/?repage";
	}
	
	@RequiresPermissions("business:businessTypes:edit")
	@RequestMapping(value = "delete")
	public String delete(BusinessTypes businessTypes, RedirectAttributes redirectAttributes) {
		businessTypesService.delete(businessTypes);
		addMessage(redirectAttributes, "删除商户类别成功");
		return "redirect:"+Global.getAdminPath()+"/business/businessTypes/?repage";
	}

	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<BusinessTypes> list = businessTypesService.findAllList(new BusinessTypes());
		for (int i=0; i<list.size(); i++){
			BusinessTypes e = list.get(i);
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
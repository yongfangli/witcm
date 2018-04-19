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
import com.thinkgem.jeesite.modules.witcm.business.entity.OrdersRecord;
import com.thinkgem.jeesite.modules.witcm.business.service.OrdersRecordService;

/**
 * 订单状态Controller
 * @author liyongfang
 * @version 2017-12-04
 */
@Controller
@RequestMapping(value = "${adminPath}/business/ordersRecord")
public class OrdersRecordController extends BaseController {

	@Autowired
	private OrdersRecordService ordersRecordService;
	
	@ModelAttribute
	public OrdersRecord get(@RequestParam(required=false) String id) {
		OrdersRecord entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = ordersRecordService.get(id);
		}
		if (entity == null){
			entity = new OrdersRecord();
		}
		return entity;
	}
	
	@RequiresPermissions("business:ordersRecord:view")
	@RequestMapping(value = {"list", ""})
	public String list(OrdersRecord ordersRecord, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<OrdersRecord> page = ordersRecordService.findPage(new Page<OrdersRecord>(request, response), ordersRecord); 
		model.addAttribute("page", page);
		return "witcm/business/ordersRecordList";
	}

	@RequiresPermissions("business:ordersRecord:view")
	@RequestMapping(value = "form")
	public String form(OrdersRecord ordersRecord, Model model) {
		model.addAttribute("ordersRecord", ordersRecord);
		return "witcm/business/ordersRecordForm";
	}

	@RequiresPermissions("business:ordersRecord:edit")
	@RequestMapping(value = "save")
	public String save(OrdersRecord ordersRecord, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ordersRecord)){
			return form(ordersRecord, model);
		}
		ordersRecordService.save(ordersRecord);
		addMessage(redirectAttributes, "保存订单状态成功");
		return "redirect:"+Global.getAdminPath()+"/business/ordersRecord/?repage";
	}
	
	@RequiresPermissions("business:ordersRecord:edit")
	@RequestMapping(value = "delete")
	public String delete(OrdersRecord ordersRecord, RedirectAttributes redirectAttributes) {
		ordersRecordService.delete(ordersRecord);
		addMessage(redirectAttributes, "删除订单状态成功");
		return "redirect:"+Global.getAdminPath()+"/business/ordersRecord/?repage";
	}

}
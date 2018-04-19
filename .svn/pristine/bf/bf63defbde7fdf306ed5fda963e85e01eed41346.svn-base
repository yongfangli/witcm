/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.witcm.si.codeimage.web;

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
import com.thinkgem.jeesite.modules.witcm.si.codeimage.entity.CodeImage;
import com.thinkgem.jeesite.modules.witcm.si.codeimage.service.CodeImageService;

/**
 * 二维码生成Controller
 * @author liyongfang
 * @version 2018-01-25
 */
@Controller
@RequestMapping(value = "${adminPath}/codeimage/codeImage")
public class CodeImageController extends BaseController {

	@Autowired
	private CodeImageService codeImageService;
	
	@ModelAttribute
	public CodeImage get(@RequestParam(required=false) String id) {
		CodeImage entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = codeImageService.get(id);
		}
		if (entity == null){
			entity = new CodeImage();
		}
		return entity;
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = {"list", ""})
	public String list(CodeImage codeImage, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<CodeImage> page = codeImageService.findPage(new Page<CodeImage>(request, response), codeImage); 
		model.addAttribute("page", page);
		return "si/codeimage/codeImageList";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "form")
	public String form(CodeImage codeImage, Model model) {
		model.addAttribute("codeImage", codeImage);
		return "si/codeimage/codeImageForm";
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "save")
	public String save(CodeImage codeImage, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, codeImage)){
			return form(codeImage, model);
		}
		codeImageService.save(codeImage);
		addMessage(redirectAttributes, "保存二维码生成成功");
		return "redirect:"+Global.getAdminPath()+"/codeimage/codeImage/?repage";
	}
	
	@RequiresPermissions("user")
	@RequestMapping(value = "delete")
	public String delete(CodeImage codeImage, RedirectAttributes redirectAttributes) {
		codeImageService.delete(codeImage);
		addMessage(redirectAttributes, "删除二维码生成成功");
		return "redirect:"+Global.getAdminPath()+"/codeimage/codeImage/?repage";
	}

}
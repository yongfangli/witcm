package com.thinkgem.jeesite.modules.cms.web.front;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.constants.Constants;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.security.MD5Util;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.witcm.business.entity.Business;
import com.thinkgem.jeesite.modules.witcm.business.entity.BusinessTypes;
import com.thinkgem.jeesite.modules.witcm.business.entity.Convenient;
import com.thinkgem.jeesite.modules.witcm.business.entity.Goods;
import com.thinkgem.jeesite.modules.witcm.business.entity.GoodsComments;
import com.thinkgem.jeesite.modules.witcm.business.entity.Orders;
import com.thinkgem.jeesite.modules.witcm.business.entity.OrdersRecord;
import com.thinkgem.jeesite.modules.witcm.business.entity.Promotion;
import com.thinkgem.jeesite.modules.witcm.business.service.BusinessService;
import com.thinkgem.jeesite.modules.witcm.business.service.BusinessTypesService;
import com.thinkgem.jeesite.modules.witcm.business.service.ConvenientService;
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsCommentsService;
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsService;
import com.thinkgem.jeesite.modules.witcm.business.service.OrdersRecordService;
import com.thinkgem.jeesite.modules.witcm.business.service.OrdersService;
import com.thinkgem.jeesite.modules.witcm.business.service.PromotionService;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Collect;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Comments;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Family;
import com.thinkgem.jeesite.modules.witcm.resident.entity.HealthRecord;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.service.CollectService;
import com.thinkgem.jeesite.modules.witcm.resident.service.CommentsService;
import com.thinkgem.jeesite.modules.witcm.resident.service.FamilyService;
import com.thinkgem.jeesite.modules.witcm.resident.service.HealthRecordService;
import com.thinkgem.jeesite.modules.witcm.resident.service.ResidentService;

/**
 * itv Controller
 * 
 * @author luoyang
 * @version 2017-12-10
 */
@Controller
@RequestMapping(value = "${frontPath}/itv")
public class FrontITVController extends BaseController {
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private BusinessTypesService businessTypesService;
	@Autowired
	private BusinessService businessService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsCommentsService goodsCommentsService;
	@Autowired
	private ConvenientService convenientService;
	@Autowired
	private ResidentService residentService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private OrdersRecordService ordersRecordService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private FamilyService familyService;
	@Autowired
	private HealthRecordService healthRecordService;
	@Autowired
	private PromotionService promotionService;
	@Autowired
	private CommentsService commentsService;
	/**
	 * 退出
	 */
	@RequestMapping(value = "exits")
	public String exits(Model model) {
		UserUtils.getSession().removeAttribute(Constants.ITV_USER_KEY);
		return "modules/cms/front/themes/itv/login";
	}

	/**
	 * 登录
	 */
	@ResponseBody
	@RequestMapping(value = "loginAjax.do")
	public Map<String, Object> login(String userName, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (StringUtils.isEmpty(userName)) {
			map.put("result", false);
			map.put("msg", "请输入手机号");
			return map;
		}
		if (StringUtils.isEmpty(password)) {
			map.put("result", false);
			map.put("msg", "请输入密码");
			return map;
		}
		password = MD5Util.getMD5(password);
		Resident resident = residentService
				.findByTelAndPswd(userName, password);
		if (resident == null) {
			map.put("result", false);
			map.put("msg", "手机号或密码错误，请重新输入");
			return map;
		}
		resident.setLoginPswd("");
		UserUtils.getSession().setAttribute(Constants.ITV_USER_KEY, resident);

		// 更新积分 0.5分
		residentService.updatePoints(resident.getId(), 0.5);

		map.put("result", true);
		return map;
	}

	/**
	 * 用户中心-菜单
	 */
	@RequestMapping(value = "userMenu")
	public String userMenu(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		return "modules/cms/front/themes/itv/userMenu";
	}

	/**
	 * 用户信息
	 */
	@RequestMapping(value = "userInfo")
	public String userInfo(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);
		return "modules/cms/front/themes/itv/userInfo";
	}

	/**
	 * 用户中心－预订商家
	 */
	@RequestMapping(value = "userOrder")
	public String userOrder(Orders orders, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);
		if (orders == null) {
			orders = new Orders();
		}
		orders.setResident(resident);
		Page<Orders> p = new Page<Orders>(request, response);
		p.setPageSize(12);
		Page<Orders> page = ordersService.findPage(p, orders);
		model.addAttribute("page", page);
		return "modules/cms/front/themes/itv/userOrder";
	}
	
	/**
	 * 预订商家－save
	 * 
	 * @param gnum
	 * @param gid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "userOrderSave.do")
	public Map<String, Object> userOrderSave(String gnum, String gid) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			map.put("result", false);
			map.put("msg", "请先登录");
			return map;
		}
		Goods goods = goodsService.get(gid);
		Orders orders = new Orders();
		Date now = new Date();
		String code = DateUtils.formatDate(now, "yyyyMMdd");
		List<Orders> list = ordersService.findList(orders);
		if (list != null && list.size() > 0) {
			code = code + (10000 + list.size() + 1);
		} else {
			code += 10001;
		}
		orders.setResident(resident);
		orders.setGoods(goods);
		orders.setBusinessId(goods.getBusiness().getId());
		orders.setCode(code);
		orders.setNumbers(gnum);
		orders.setStatus(Constants.ORDER_STATUS_0);
		orders.setComStatus(Constants.COM_STATUS_0);
		orders.setBelongOrg(resident.getBelongOrg());
		orders.setBelongArea(resident.getBelongArea());
		orders.setCreateBy(new User("1"));
		orders.setUpdateBy(new User("1"));
		orders.setCreateDate(now);
		orders.setUpdateDate(now);
		try {
			ordersService.saveFront(orders, resident.getName());
		} catch (Exception e) {
			map.put("result", false);
			map.put("msg", "预订商品失败，请稍候在试……");
			e.printStackTrace();
			return map;
		}
		//更新积分 2分
		residentService.updatePoints(resident.getId(), 2);
		
		map.put("result", true);
		return map;
	}

	/**
	 * 用户中心－预订商家-详情
	 */
	@RequestMapping(value = "userOrderDetail")
	public String userOrderDetail(@RequestParam(required = false) String id,
			Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}

		Orders orders = new Orders();
		Business business = new Business();
		List<OrdersRecord> list = new ArrayList<OrdersRecord>();
		if (StringUtils.isNotBlank(id)) {
			orders = ordersService.get(id);
		}
		if (orders != null && StringUtils.isNotEmpty(orders.getId())) {
			OrdersRecord record = new OrdersRecord();
			record.setOrders(orders);
			list = ordersRecordService.findList(record);
		}
		if (orders != null && StringUtils.isNoneEmpty(orders.getId())) {
			business = businessService.get(orders.getBusinessId());
		}

		model.addAttribute("orders", orders);
		model.addAttribute("business", business);
		model.addAttribute("list", list);
		return "modules/cms/front/themes/itv/userOrderDetail";
	}
	
	/**
	 * 用户中心－预订商家-取消
	 */
	@RequestMapping(value = "userOrderUpd")
	public String userOrderUpd(@RequestParam(required = false) String id,
			RedirectAttributes redirectAttributes) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Orders o = ordersService.get(id);
		if(o==null){
			addMessage(redirectAttributes, "该订单不存在或已删除，不能操作");
			return "redirect:" + Global.getFrontPath() + "/itv/userOrder/?repage";
		}
		if(Constants.ORDER_STATUS_3.equals(o.getStatus())){
			addMessage(redirectAttributes, "该订单已完成，不能操作，请刷新页面");
			return "redirect:" + Global.getFrontPath() + "/itv/userOrder/?repage";
		}
		if(Constants.ORDER_STATUS_2.equals(o.getStatus())){
			addMessage(redirectAttributes, "该订单已配送，不能操作，请刷新页面");
			return "redirect:" + Global.getFrontPath() + "/itv/userOrder/?repage";
		}
		if(Constants.ORDER_STATUS_4.equals(o.getStatus())){
			addMessage(redirectAttributes, "该订单已取消，不能操作，请刷新页面");
			return "redirect:" + Global.getFrontPath() + "/itv/userOrder/?repage";
		}
		
		Orders orders = new Orders(id);
		orders.setStatus(Constants.ORDER_STATUS_4);
		orders.setUpdateDate(new Date());
		try {
			ordersService.updateFront(orders, resident.getName(), "");
		} catch (Exception e) {
			e.printStackTrace();
			addMessage(redirectAttributes, "取消失败，请稍候在试……");
			return "redirect:" + Global.getFrontPath() + "/itv/userOrder/?repage";
		}
		
		addMessage(redirectAttributes, "取消成功");
		return "redirect:" + Global.getFrontPath() + "/itv/userOrder/?repage";
	}

	/**
	 * 用户中心－个人积分
	 */
	@RequestMapping(value = "userPoints")
	public String userPoints(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);
		return "modules/cms/front/themes/itv/userPoints";
	}

	/**
	 * 用户中心－家庭档案
	 */
	@RequestMapping(value = "userFamily")
	public String userFamily(Family family, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);

		if (family == null) {
			family = new Family();
		}
		family.setResident(resident);
		Page<Family> p = new Page<Family>(request, response);
		p.setPageSize(12);
		Page<Family> page = familyService.findPage(p, family);
		model.addAttribute("page", page);
		return "modules/cms/front/themes/itv/userFamily";
	}

	/**
	 * 用户中心－健康档案
	 */
	@RequestMapping(value = "userHealth")
	public String userHealth(HealthRecord healthRecord,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);

		if (healthRecord == null) {
			healthRecord = new HealthRecord();
		}
		healthRecord.setResidentId(resident.getId());
		Page<HealthRecord> p = new Page<HealthRecord>(request, response);
		p.setPageSize(7);
		Page<HealthRecord> page = healthRecordService.findPage(p, healthRecord);
		model.addAttribute("page", page);
		return "modules/cms/front/themes/itv/userHealth";
	}

	/**
	 * 用户中心－个人收藏
	 */
	@RequestMapping(value = "userCollect")
	public String userCollect(Collect collect, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);

		if (collect == null) {
			collect = new Collect();
		}
		collect.setResident(resident);
		Page<Collect> p = new Page<Collect>(request, response);
		p.setPageSize(12);
		Page<Collect> page = collectService.findPage(p, collect);
		model.addAttribute("page", page);
		return "modules/cms/front/themes/itv/userCollect";
	}

	/**
	 * 个人收藏－delete
	 */
	@RequestMapping(value = "userCollectDel")
	public String resCollectDel(Collect collect,
			RedirectAttributes redirectAttributes) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/itv/login";
		}
		collectService.delete(collect);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getFrontPath() + "/itv/userCollect/?repage";
	}

	/**
	 * 网站首页
	 */
	@RequestMapping
	public String index(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "7") Integer pageSize,
			Model model) {
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		List<Category> categories = CmsUtils.getMainNavList(site.getId());
		model.addAttribute("categoryId", categories.get(0).getId());
		Page<Category> cPage = new Page<Category>(pageNo, pageSize);
		Category category = new Category();
		category.setParent(new Category(categories.get(0).getId()));
		category.setSite(site);
		
		cPage = categoryService.findPage(cPage, category);
		
		
		model.addAttribute("site", site);
		model.addAttribute("page", cPage);
		model.addAttribute("categoryId", categories.get(0).getId());
		return "modules/cms/front/themes/itv/index";
	}

	/**
	 * 
	 * @param pageNo
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/indexToggle")
	public String indexToggle(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "4") Integer pageSize,
			String categoryId,String childId, Model model) {
		if(StringUtils.isBlank(categoryId)&&!StringUtils.isBlank(childId)){
			Category chileCategory = categoryService.get(childId);
			categoryId=chileCategory.getParentId();
		}
		Category category = categoryService.get(categoryId);
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		List<Category> categoriess = CmsUtils.getMainNavList(Site.defaultSiteId());
		if(categoriess.indexOf(category)==0){
			return "redirect:" + frontPath + "/itv";
		}
		// 首页toggle页面判断是否是专题类，如果是转到文章列表页面
		if (CmsUtils.isArticleListCategory(category)||CmsUtils.isNews(category)) {
			pageSize = 7;
			Page<Article> cPage = new Page<Article>(pageNo, pageSize);
			Article article = new Article();
			article.setCategory(category);
			cPage = articleService.findPage(cPage, article);
			model.addAttribute("page", cPage);
			model.addAttribute("category", category);
			return "modules/cms/front/themes/itv/articleList";
		} else if (Constants.VIDEO_ENMU.equals(category.getShowModes())) {
			Category scategory = new Category();
			scategory.setParent(new Category(categoryId));
			List<Category> categories = categoryService.findList(scategory);
			model.addAttribute("site", site);
			model.addAttribute("categoryList", categories);
			model.addAttribute("category", category);
			model.addAttribute("categoryId", categoryId);
			List<Article> articles=articleService.findImage(categories.get(0).getId());
			model.addAttribute("articleList", articles);
			return "modules/cms/front/themes/itv/tourIndex";
		} else {
			Page<Category> cPage = new Page<Category>(pageNo, pageSize);
			Category scategory = new Category();
			scategory.setParent(new Category(categoryId));
			scategory.setSite(site);
			cPage = categoryService.findPage(cPage, scategory);
			model.addAttribute("site", site);
			model.addAttribute("page", cPage);
			model.addAttribute("categoryId", categoryId);
			return "modules/cms/front/themes/itv/indexToggle";
		}
	}

	@RequestMapping("/categoryList")
	public String categoryList(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "7") Integer pageSize,
			String categoryId, Model model) {
		model.addAttribute("returnCategoryIdId",categoryId);
		Category category = categoryService.get(categoryId);
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		Category scategory = new Category();
		scategory.setParent(new Category(categoryId));
		scategory.setSite(site);
		List<Category> categories = categoryService.findList(scategory);
		if (Constants.VIDEO_ENMU.equals(category.getShowModes())) {
			model.addAttribute("categoryList", categories);
			model.addAttribute("category", category);
			return "modules/cms/front/themes/itv/tourIndex";
		} else if (CmsUtils.isArticleListCategory(category)||CmsUtils.isNews(category)) {
			pageSize = 7;
			Page<Article> cPage = new Page<Article>(pageNo, pageSize);
			Article article = new Article();
			article.setCategory(category);
			cPage = articleService.findPage(cPage, article);
			model.addAttribute("page", cPage);
			model.addAttribute("category", category);
			return "modules/cms/front/themes/itv/articleList";
		} else {
			if (categories.size() > 0) {
				Category cate = categories.get(0);
				if (CmsUtils.isPicture(cate)) {
					if (CmsUtils.isPicture(cate)
							&& cate.getShowModes().equals("3")) {
						pageSize = 4;
						Page<Article> cPage = new Page<Article>(pageNo,
								pageSize);
						Article article = new Article();
						article.setCategory(cate);
						cPage = articleService.findPage(cPage, article);
						model.addAttribute("category", category);
						model.addAttribute("categoryList", categories);
						model.addAttribute("page", cPage);
						model.addAttribute("curId", cate.getId());
						model.addAttribute("dec", cate.getDescription());
						model.addAttribute("flag", "0");
						return "modules/cms/front/themes/itv/tourList";
					} else {
						pageSize = 8;
						Page<Article> cPage = new Page<Article>(pageNo,
								pageSize);
						Article article = new Article();
						article.setCategory(cate);
						cPage = articleService.findPage(cPage, article);
						model.addAttribute("category", category);
						model.addAttribute("categoryList", categories);
						model.addAttribute("page", cPage);
						model.addAttribute("curId", cate.getId());
						return "modules/cms/front/themes/itv/piclist";
					}
				} else if (CmsUtils.isSpecial(cate)) {
					Page<Article> cPage = new Page<Article>(pageNo,
							pageSize);
					Article article = new Article();
					article.setCategory(cate);
					cPage = articleService.findPage(cPage, article);
					for (Article a :cPage.getList()) {
						a.setArticleData(articleDataService.get(a.getId()));
					}
					model.addAttribute("category", category);
					model.addAttribute("categoryList", categories);
					model.addAttribute("page", cPage);
					model.addAttribute("curId", cate.getId());
					return "modules/cms/front/themes/itv/spelist";
				} else if (CmsUtils.isArticleListCategory(cate)
						|| CmsUtils.isNews(cate)) {
					pageSize = 9;
					Page<Article> cPage = new Page<Article>(pageNo, pageSize);
					Article article = new Article();
					article.setCategory(cate);
					cPage = articleService.findPage(cPage, article);
					model.addAttribute("category", category);
					model.addAttribute("categoryList", categories);
					model.addAttribute("page", cPage);
					model.addAttribute("curId", cate.getId());
					return "modules/cms/front/themes/itv/list";
				}
				pageSize = 9;
				Page<Article> cPage = new Page<Article>(pageNo, pageSize);
				Article article = new Article();
				article.setCategory(cate);
				cPage = articleService.findPage(cPage, article);
				model.addAttribute("category", category);
				model.addAttribute("categoryList", categories);
				model.addAttribute("page", cPage);
				model.addAttribute("curId", cate.getId());
				return "modules/cms/front/themes/itv/list";
			}
		}
		return "";
	}

	@RequestMapping("/categoryToggle")
	public String categoryToggle(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "7") Integer pageSize,
			String categoryId,
			@RequestParam(required = false, defaultValue = "0") String flag,
			Model model) {
		Category category = categoryService.get(categoryId);
		model.addAttribute("flag", flag);
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		Category scategory = new Category();
		scategory.setParent(category.getParent());
		scategory.setSite(site);
		List<Category> categories = categoryService.findList(scategory);
		if (CmsUtils.isPicture(category)) {
			if (CmsUtils.isPicture(category)
					&& category.getShowModes().equals("3")) {
				pageSize = 4;
				Page<Article> cPage = new Page<Article>(pageNo, pageSize);
				Article article = new Article();
				article.setCategory(category);
				cPage = articleService.findPage(cPage, article);
				model.addAttribute("category",
						categoryService.get(category.getParent()));
				model.addAttribute("categoryList", categories);
				model.addAttribute("page", cPage);
				model.addAttribute("curId", category.getId());
				model.addAttribute("dec", category.getDescription());
				return "modules/cms/front/themes/itv/tourList";
			}  else {
				pageSize = 8;
				Page<Article> cPage = new Page<Article>(pageNo, pageSize);
				Article article = new Article();
				article.setCategory(category);
				cPage = articleService.findPage(cPage, article);
				model.addAttribute("category",
						categoryService.get(category.getParent()));
				model.addAttribute("categoryList", categories);
				model.addAttribute("page", cPage);
				model.addAttribute("curId", category.getId());
				return "modules/cms/front/themes/itv/piclist";
			}
			
		}
		else if (CmsUtils.isSpecial(category)) {
			Page<Article> cPage = new Page<Article>(pageNo,
					pageSize);
			Article article = new Article();
			article.setCategory(category);
			cPage = articleService.findPage(cPage, article);
			for (Article a :cPage.getList()) {
				a.setArticleData(articleDataService.get(a.getId()));
			}
			model.addAttribute("category", categoryService.get(category.getParent()));
			model.addAttribute("categoryList", categories);
			model.addAttribute("page", cPage);
			model.addAttribute("curId", category.getId());
			return "modules/cms/front/themes/itv/spelist";
		}
		pageSize = 9;
		Page<Article> cPage = new Page<Article>(pageNo, pageSize);
		Article article = new Article();
		article.setCategory(category);
		cPage = articleService.findPage(cPage, article);
		model.addAttribute("category",
				categoryService.get(category.getParent()));
		model.addAttribute("categoryList", categories);
		model.addAttribute("page", cPage);
		model.addAttribute("curId", categoryId);
		return "modules/cms/front/themes/itv/list";
	}

	/**
	 * 红色旅游-首页
	 */
	@RequestMapping(value = "tour")
	public String tourIndex(Model model) {

		return "modules/cms/front/themes/itv/tourIndex";
	}

	/**
	 * 二级列表－页面
	 */
	@RequestMapping(value = "list")
	public String list(Model model) {

		return "modules/cms/front/themes/itv/list";
	}

	/**
	 * 二级列表详情－页面
	 */
	@RequestMapping(value = "listDetail")
	public String listDetail(Model model) {

		return "modules/cms/front/themes/itv/list_detail";
	}

	/**
	 * 详情－页面
	 */
	@RequestMapping(value = "detail-{id}")
	public String detail(Model model, String urlFlag, @PathVariable String id) {
		Article article = new Article();
		article = articleService.get(id);
		article.setArticleData(articleDataService.get(id));
		Category category = categoryService.get(article.getCategory().getId())
				;
		article.getCategory().setParent(category.getParent());
        Page<Comments> cPage=new Page<Comments>(1,5);
        Comments comments=new Comments();
        comments.setArticle(article);
        cPage=commentsService.findPage(cPage, comments);
		model.addAttribute("article", article);
		model.addAttribute("commentsPage", cPage);
		model.addAttribute("category",category);
		model.addAttribute("urlFlag", urlFlag);
		return "modules/cms/front/themes/itv/detail";
	}

	@RequestMapping(value = "business")
	public String businessIndex(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "3") Integer pageSize,
			Model model) {
		// 商家类型列表
		BusinessTypes businessTypes=new BusinessTypes();
		businessTypes.setParent(new BusinessTypes("1"));
		List<BusinessTypes> types = businessTypesService
				.findList(businessTypes);
		if (types.size() > 0) {
			BusinessTypes typest = types.get(0);
			Page<Business> bPage = new Page<Business>(pageNo, pageSize);
			Business business = new Business();
			business.setTypes(typest);
			bPage = businessService.findPage(bPage, business);
			model.addAttribute("page", bPage);
			model.addAttribute("type", typest);
		}
		model.addAttribute("typeList", types);
		return "modules/cms/front/themes/itv/business";
	}
	
	@RequestMapping(value = "businessFather")
	public String businessFather(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "3") Integer pageSize,
			Model model) {
		// 商家类型列表
		Category category = new Category();
		category.setName("便民服务");
		List<Category> categorys = categoryService.findList(category);
		if(categorys.size()>0){
		return "redirect:" + frontPath + "/itv/indexToggle?categoryId="+categorys.get(0).getId();
		}
		return "redirect:" + frontPath + "/itv";
	}

	@RequestMapping(value = "businessToggle")
	public String businessToggle(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "3") Integer pageSize,
			String businessTypeId, Model model) {
		BusinessTypes typest = businessTypesService.get(businessTypeId);
		// 商家类型列表
		BusinessTypes businessTypes=new BusinessTypes();
		businessTypes.setParent(new BusinessTypes("1"));
		List<BusinessTypes> types = businessTypesService
				.findList(businessTypes);
		model.addAttribute("typeList", types);
		Page<Business> bPage = new Page<Business>(pageNo, pageSize);
		Business business = new Business();
		business.setTypes(typest);
		bPage = businessService.findPage(bPage, business);
		model.addAttribute("page", bPage);
		model.addAttribute("type", typest);

		return "modules/cms/front/themes/itv/business";
	}

	@RequestMapping(value = "businessDetail")
	public String businessDetail(
			@RequestParam(required = false, defaultValue = "1") Integer gpageNo,
			@RequestParam(required = false, defaultValue = "3") Integer gpageSize,
			@RequestParam(required = false, defaultValue = "1") Integer cpageNo,
			@RequestParam(required = false, defaultValue = "3") Integer cpageSize,
			String businessId,
			@RequestParam(required = false, defaultValue = "0") String flag,
			Model model) {
		// 商家类型列表
        businessService.updateViewCount(businessId);
        BusinessTypes businessTypes=new BusinessTypes();
		businessTypes.setParent(new BusinessTypes("1"));
		List<BusinessTypes> types = businessTypesService
				.findList(businessTypes);
		Business business = businessService.get(businessId);

		Page<Goods> gPage = new Page<Goods>(gpageNo, gpageSize);
		Goods goods = new Goods();
		goods.setBusiness(business);
		gPage = goodsService.findPage(gPage, goods);

		Page<GoodsComments> cPage = new Page<GoodsComments>(cpageNo, cpageSize);
		GoodsComments comments = new GoodsComments();
		comments.setBusiness(business);
		cPage = goodsCommentsService.findPage(cPage, comments);

		model.addAttribute("business", business);
		model.addAttribute("gpage", gPage);
		model.addAttribute("cpage", cPage);
		model.addAttribute("typeList", types);
		model.addAttribute("flag", flag);
		return "modules/cms/front/themes/itv/businessDetail";
	}

	@RequestMapping(value = "nearByService")
	public String businessDetail(
			Model model,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "4") Integer pageSize,
			HttpServletRequest request) {
		String url = request.getRequestURI();
		String[] mapping = url.split("/");
		String s = mapping[mapping.length - 1];
		Category categoryr = new Category();
		categoryr.setHref(s);
		List<Category> category = categoryService.findList(categoryr);
		if (category.size() > 0) {
			model.addAttribute("category", category.get(0));
		}
		Page<Convenient> cPage = new Page<Convenient>(pageNo, pageSize);
		cPage = convenientService.findPage(cPage, new Convenient());
		model.addAttribute("page", cPage);
		return "modules/cms/front/themes/itv/nearByService";
	}

	@RequestMapping(value = "promotion")
	public String promotion(Model model,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "7") Integer pageSize) {
		Page<Promotion> page = new Page<Promotion>(pageNo, pageSize);
		page = promotionService.findPage(page, new Promotion());
		model.addAttribute("page", page);
		return "modules/cms/front/themes/itv/promotionList";
	}

	@RequestMapping(value = "promotionDetail")
	public String promotionDetail(Model model, String id) {
		model.addAttribute("promotion", promotionService.get(id));
		return "modules/cms/front/themes/itv/promotionDetail";
	}
	
	/**
	 * 收藏商家
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "collect-{id}.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public String collect(@PathVariable String id) {
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.ITV_USER_KEY);
		if (null == resident) {
			return "{\"msg\":\"nologin\"}";
		} else {
			try {
				collectService.saveNewInstance(resident.getId(), id);
			} catch (Exception e) {
				return "{\"msg\":\"false\"}";
			}
			return "{\"msg\":\"true\"}";
		}
	}
	
}

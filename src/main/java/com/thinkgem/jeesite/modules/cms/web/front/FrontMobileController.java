package com.thinkgem.jeesite.modules.cms.web.front;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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
import com.thinkgem.jeesite.common.utils.ObjectUtils;
import com.thinkgem.jeesite.common.utils.RelativeDateFormat;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.service.SiteService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
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
import com.thinkgem.jeesite.modules.witcm.business.service.GoodsTypesService;
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
import com.thinkgem.jeesite.modules.witcm.si.codeimage.service.CodeImageService;

/**
 * 商户中心Controller
 * 
 * @author luoyang
 * @version 2017-12-10
 */
@Controller
@RequestMapping(value = "${frontPath}/mobile")
public class FrontMobileController extends BaseController {
	@Autowired
	private SiteService siteService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private BusinessService businessService;
	@Autowired
	private PromotionService promotionService;
	@Autowired
	private GoodsTypesService goodsTypesService;
	@Autowired
	private BusinessTypesService businessTypesService;
	@Autowired
	private OrdersRecordService ordersRecordService;
	@Autowired
	private CodeImageService codeImageService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ArticleDataService articleDataService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private ResidentService residentService;
	@Autowired
	private FamilyService familyService;
	@Autowired
	private HealthRecordService healthRecordService;
	@Autowired
	private CollectService collectService;
	@Autowired
	private GoodsCommentsService goodsCommentsService;
	@Autowired
	private ConvenientService convenientService;

	/**
	 * 退出
	 */
	@RequestMapping(value = "exits")
	public String exits(Model model) {
		UserUtils.getSession().removeAttribute(Constants.MOBILE_USER_KEY);
		return "modules/cms/front/themes/mobile/login";
	}

	/**
	 * 退出
	 */
	@RequestMapping(value = "login")
	public String login(Model model) {
		return "modules/cms/front/themes/mobile/login";
	}

	/**
	 * 登录 ajax
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
		UserUtils.getSession()
				.setAttribute(Constants.MOBILE_USER_KEY, resident);

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
		return "modules/cms/front/themes/mobile/userMenu";
	}

	/**
	 * 用户信息
	 */
	@RequestMapping(value = "userInfo")
	public String userInfo(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);
		return "modules/cms/front/themes/mobile/userInfo";
	}

	/**
	 * 用户中心－预订商家
	 */
	@RequestMapping(value = "userOrder")
	public String userOrder(Orders orders, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
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
		return "modules/cms/front/themes/mobile/userOrder";
	}

	@ResponseBody
	@RequestMapping(value = "userOrder.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Orders> userOrderJson(String status,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize)
			throws UnsupportedEncodingException {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return new ArrayList<Orders>();
		}
		Resident res = residentService.get(resident.getId());
		Orders orders = new Orders();
		orders.setStatus(DictUtils.getDictValue(
				URLDecoder.decode(status, "utf-8"), "goods_status", ""));
		orders.setResident(resident);
		Page<Orders> p = new Page<Orders>(pageNo, pageSize);
		p = ordersService.findPage(p, orders);
		if (pageNo > p.getPageNo()) {
			return new ArrayList<Orders>();
		}
		for (Orders o : p.getList()) {
			o.setStatusString(DictUtils.getDictLabel(o.getStatus(),
					"goods_status", ""));
		}
		return p.getList();
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
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
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
		// 更新积分 2分
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
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
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
		return "modules/cms/front/themes/mobile/userOrderDetail";
	}

	/**
	 * 用户中心－个人积分
	 */
	@RequestMapping(value = "userPoints")
	public String userPoints(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
		}
		Resident res = residentService.get(resident.getId());
		model.addAttribute("resident", res);
		return "modules/cms/front/themes/mobile/userPoints";
	}

	/**
	 * 用户中心－家庭档案
	 */
	@RequestMapping(value = "userFamily")
	public String userFamily(Family family, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
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
		return "modules/cms/front/themes/mobile/userFamily";
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
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
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
		return "modules/cms/front/themes/mobile/userHealth";
	}

	/**
	 * 用户中心－个人收藏
	 */
	@RequestMapping(value = "userCollect")
	public String userCollect(Collect collect, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
		}
		return "modules/cms/front/themes/mobile/userCollect";
	}

	@ResponseBody
	@RequestMapping(value = "userCollect.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Collect> userCollect(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize)
			throws UnsupportedEncodingException {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return new ArrayList<Collect>();
		}
		Resident res = residentService.get(resident.getId());
		Collect collect = new Collect();
		collect.setResident(resident);
		Page<Collect> p = new Page<Collect>(pageNo, pageSize);
		p = collectService.findPage(p, collect);
		if (pageNo > p.getPageNo()) {
			return new ArrayList<Collect>();
		}
		return p.getList();
	}

	/**
	 * 个人收藏－delete
	 */
	@RequestMapping(value = "userCollectDel")
	public String resCollectDel(Collect collect,
			RedirectAttributes redirectAttributes) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			return "modules/cms/front/themes/mobile/login";
		}
		collectService.delete(collect);
		addMessage(redirectAttributes, "删除成功");
		return "redirect:" + Global.getFrontPath()
				+ "/mobile/userCollect/?repage";
	}

	/**
	 * 登录页面
	 */
	@RequestMapping(value = "")
	public String index(Model model) {
		// 促销信息取最新十条
		Page<Promotion> page = new Page<Promotion>(1, 10);
		page = promotionService.findPage(page, new Promotion());
		// 取内容分类
		Site site = siteService.get(Site.defaultSiteId());
		List<Category> categories = CmsUtils.getMainNavList(site.getId());
		List<Category> categoriesCopy = new ArrayList<Category>();
		categoriesCopy = ObjectUtils.clone(categories);
		Category category = new Category();
		category.setName("便民服务");
		List<Category> cateList = categoryService.findList(category);
		if (cateList.size() > 0) {
			categoriesCopy.remove(cateList.get(0));
		}
		category.setName("社区新闻");
		List<Category> cateLists = categoryService.findList(category);
		if (cateLists.size() > 0) {
			Category lastCategory = cateLists.get(0);
			// 文章
			Page<Article> aPage = new Page<Article>(1, 10);
			Article a = new Article();
			a.setCategory(lastCategory);
			aPage = articleService.findPage(aPage, a);
			model.addAttribute("apage", aPage);
			model.addAttribute("last", lastCategory);
		}
		model.addAttribute("ppage", page);
		model.addAttribute("cList", categoriesCopy);
		return "modules/cms/front/themes/mobile/index";
	}

	/**
	 * 发现页面
	 */
	@RequestMapping(value = "/discover")
	public String discover(Model model) {
		Category category = new Category();
		category.setName("便民服务");
		List<Category> cateList = categoryService.findList(category);
		if (cateList.size() > 0) {
			Category category2 = new Category();
			category2.setParent(cateList.get(0));
			List<Category> categories = categoryService.findList(category2);
			model.addAttribute("categoryList", categories);
		}
		Page<Business> bPage = new Page<Business>(1, 10);
		bPage.setOrderBy("star desc");
		bPage = businessService.findPage(bPage, new Business());
		model.addAttribute("bpage", bPage);
		return "modules/cms/front/themes/mobile/discover";
	}

	/**
	 * 发现页面
	 */
	@RequestMapping(value = "/categoryIndex")
	public String categoryIndex(String id, Model model) {
		Category category = categoryService.get(id);
		model.addAttribute("category", category);
		Category category2 = new Category();
		category2.setParent(category);
		List<Category> categories = categoryService.findList(category2);
		model.addAttribute("categoryList", categories);
		model.addAttribute("curId", categories.get(0).getId());

		category2.setParent(categories.get(0));
		List<Category> categories1 = categoryService.findList(category2);
		if (categories1.size() <= 0) {
			return "modules/cms/front/themes/mobile/newsList";
		} else {
			model.addAttribute("categoryListc", categories1);
			model.addAttribute("cone", categories1.get(0));

			// 红色旅游
			if (category.getShowModes().equals(Constants.VIDEO_ENMU)) {

				return "modules/cms/front/themes/mobile/tour";
			} else {

				return "modules/cms/front/themes/mobile/articleList";
			}
		}

	}

	/**
	 * 新闻列表
	 */
	@RequestMapping(value = "/newsList")
	public String newList(String id, Model model) {
		Category category = categoryService.get(id);
		if (null == category) {
			return "modules/cms/front/themes/mobile/404";
		}
		model.addAttribute("category", category);
		return "modules/cms/front/themes/mobile/newsListIndex";
	}

	/**
	 * 发现页面
	 */
	@RequestMapping(value = "/categoryToggle")
	public String categoryToggle(String id, Model model) {
		Category category = categoryService.get(id);
		Category parent = categoryService.get(category.getParent().getId());
		model.addAttribute("category", parent);

		Category category2 = new Category();
		category2.setParent(parent);
		List<Category> categories = categoryService.findList(category2);
		model.addAttribute("categoryList", categories);
		model.addAttribute("curId", category.getId());
		model.addAttribute("index", categories.indexOf(category));

		category2.setParent(category);
		List<Category> categories1 = categoryService.findList(category2);
		if (categories1.size() <= 0) {
			return "modules/cms/front/themes/mobile/newsList";
		} else {
			model.addAttribute("categoryListc", categories1);
			model.addAttribute("cone", categories1.get(0));
			// 红色旅游
			if (parent.getShowModes().equals(Constants.VIDEO_ENMU)) {

				return "modules/cms/front/themes/mobile/tour";
			} else {
				return "modules/cms/front/themes/mobile/articleList";
			}
		}
	}

	@RequestMapping(value = "/articleView")
	public String articleView(String id, Model model,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "4") Integer pageSize) {
		articleService.updateHitsAddOne(id);
		Article article = articleService.get(id);
		article.setArticleData(articleDataService.get(id));
		Comments commentss = new Comments();
		commentss.setArticle(article);
		List<Comments> commentsList = commentsService.findList(commentss);
		article.setComments(commentsList.size());
		Category category = categoryService.get(article.getCategory());
		model.addAttribute("category", category);
		model.addAttribute("article", article);
		if (category.getAllowComment().equals(Global.YES)) {
			Page<Comments> cPage = new Page<Comments>(pageNo, pageSize);
			Comments comments = new Comments();
			comments.setArticle(article);
			cPage = commentsService.findPage(cPage, comments);
			model.addAttribute("page", cPage);
			return "modules/cms/front/themes/mobile/articleDetailComment";
		}
		return "modules/cms/front/themes/mobile/articleDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/categoryToggleJson.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map categoryToggleJson(String id) {
		Map reMap = new HashMap<String, Object>();
		Category category = categoryService.get(id);
		if (null == category) {
			reMap.put("result", "fail");
		} else {
			reMap.put("result", "success");
			reMap.put("category", category);
			Category category2 = new Category();
			category2.setParent(category.getParent());
			List<Category> categories = categoryService.findList(category2);
			reMap.put("index", categories.indexOf(category));

			/*
			 * Article article = new Article(); article.setCategory(category);
			 * Page<Article> aPage = new Page<Article>(1,8); aPage =
			 * articleService.findPage(aPage, article); reMap.put("childList",
			 * aPage.getList());
			 */
		}
		return reMap;
	}

	@ResponseBody
	@RequestMapping(value = "/articleMoreJson.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map articleMoreJson(Integer pageNo, Integer pageSize,
			String categoryId) {
		Map reMap = new HashMap<String, Object>();
		Category category = categoryService.get(categoryId);
		if (null == category) {
			reMap.put("result", "fail");
		} else {
			reMap.put("result", "success");
			reMap.put("category", category);
			Article article = new Article();
			article.setCategory(new Category(categoryId));
			Page<Article> aPage = new Page<Article>(pageNo, pageSize);
			aPage = articleService.findPage(aPage, article);
			for (Article a : aPage.getList()) {
				Comments commentss = new Comments();
				commentss.setArticle(a);
				List<Comments> commentsList = commentsService
						.findList(commentss);
				a.setComments(commentsList.size());
				a.setArticleData(articleDataService.get(a.getId()));
			}
			if (pageNo > aPage.getPageNo()) {
				reMap.put("list", new ArrayList<Article>());
			} else {
				reMap.put("list", aPage.getList());
			}
		}
		return reMap;
	}

	@ResponseBody
	@RequestMapping(value = "/businessList.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Business> businessListJson(String typeId,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize) {
		Business business = new Business();
		business.setTypes(new BusinessTypes(typeId));
		Page<Business> page = new Page<Business>(pageNo, pageSize);
		page = businessService.findPage(page, business);
		if (pageNo > page.getPageNo()) {
			return new ArrayList<Business>();
		}
		return page.getList();
	}

	@RequestMapping(value = "/businessList")
	public String businessList(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize,
			Model model) {
		BusinessTypes businessTypes = new BusinessTypes();
		businessTypes.setParent(new BusinessTypes("1"));
		List<BusinessTypes> types = businessTypesService
				.findList(businessTypes);
		model.addAttribute("typeList", types);
		Business business = new Business();
		business.setTypes(types.get(0));
		model.addAttribute("current", types.get(0));
		Page<Business> page = new Page<Business>(pageNo, pageSize);
		page = businessService.findPage(page, business);
		model.addAttribute("page", page);
		return "modules/cms/front/themes/mobile/businessList";
	}

	@RequestMapping(value = "/businessDetail")
	public String businessDetail(
			String id,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize,
			Model model) {
		Business business = businessService.get(id);
		model.addAttribute("business", business);
		return "modules/cms/front/themes/mobile/businessDetail";
	}

	@ResponseBody
	@RequestMapping(value = "/businessGoodsJson.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Goods> businessGoodsJson(String id,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize) {
		Goods goods = new Goods();
		goods.setBusiness(new Business(id));
		Page<Goods> page = new Page<Goods>(pageNo, pageSize);
		page = goodsService.findPage(page, goods);
		if (pageNo > page.getPageNo()) {
			return new ArrayList<Goods>();
		}
		return page.getList();
	}

	@ResponseBody
	@RequestMapping(value = "/businessComment.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<GoodsComments> businessComment(String id,
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize) {
		GoodsComments goodsComments = new GoodsComments();
		goodsComments.setBusiness(new Business(id));
		Page<GoodsComments> page = new Page<GoodsComments>(pageNo, pageSize);
		page = goodsCommentsService.findPage(page, goodsComments);
		if (pageNo > page.getPageNo()) {
			return new ArrayList<GoodsComments>();
		}
		return page.getList();
	}

	@RequestMapping(value = "/promotionDetail")
	public String promotionDetail(String id, Model model) {
		Promotion promotion = promotionService.get(id);
		if (null == promotion) {
			return "modules/cms/front/themes/mobile/404";
		} else {
			model.addAttribute("promotion", promotion);
		}
		return "modules/cms/front/themes/mobile/promotionDetail";
	}

	// 商品预定页面跳转
	@RequestMapping(value = "/goodOrderPage")
	public String goodsOrderPage(String id, Model model) {
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (null == resident) {
			Page<Business> bPage = new Page<Business>(1, 10);
			bPage.setOrderBy("star desc");
			bPage = businessService.findPage(bPage, new Business());
			model.addAttribute("bpage", bPage);
			return "modules/cms/front/themes/mobile/goLogin";
		}
		Goods goods = goodsService.get(id);
		if (null == goods) {
			return "modules/cms/front/themes/mobile/404";
		} else {
			model.addAttribute("goods", goods);
		}
		return "modules/cms/front/themes/mobile/goodOrderPage";
	}

	/**
	 * 预订商家－save
	 * 
	 * @param gnum
	 * @param gid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "orderSave.json")
	public Map<String, Object> resOrderSave(String gnum, String gid) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			map.put("result", false);
			map.put("msg", "请使用居民账户登录后再预定商品");
			return map;
		}
		Goods goods = goodsService.get(gid);
		if (null == goods) {
			map.put("result", false);
			map.put("msg", "预订商品失败，请稍候在试……");
			return map;
		}
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
		// 更新积分 2分
		residentService.updatePoints(resident.getId(), 2);

		map.put("result", true);
		return map;
	}

	@RequestMapping(value = "convenientList")
	public String convenientList() {

		return "modules/cms/front/themes/mobile/convenientList";
	}

	@ResponseBody
	@RequestMapping(value = "convenientList.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Convenient> convenientListJson(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize) {
		Page<Convenient> cPage = new Page<Convenient>(pageNo, pageSize);
		convenientService.findPage(cPage, new Convenient());
		if (pageNo > cPage.getPageNo()) {
			return new ArrayList<Convenient>();
		}
		return cPage.getList();
	}

	@RequestMapping(value = "promotionList")
	public String promotionList() {

		return "modules/cms/front/themes/mobile/promotionList";
	}

	@ResponseBody
	@RequestMapping(value = "promotionList.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Promotion> promotionListJson(
			@RequestParam(required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(required = false, defaultValue = "8") Integer pageSize) {
		Page<Promotion> cPage = new Page<Promotion>(pageNo, pageSize);
		promotionService.findPage(cPage, new Promotion());
		if (pageNo > cPage.getPageNo()) {
			return new ArrayList<Promotion>();
		}
		for (Promotion p : cPage.getList()) {
			p.setRelativeTime(RelativeDateFormat.format(p.getCreateDate()));
		}
		return cPage.getList();
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
				Constants.MOBILE_USER_KEY);
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

	/**
	 * 删除收藏
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "collectDelete.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public String collectDelete(String id) {
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (null == resident) {
			return "{\"msg\":\"nologin\"}";
		} else {
			try {
				collectService.delete(new Collect(id));
			} catch (Exception e) {
				return "{\"msg\":\"false\"}";
			}
			return "{\"msg\":\"true\"}";
		}
	}

	/**
	 * 家属添加
	 */
	@RequestMapping(value = "userFamilyAdd", produces = MediaType.APPLICATION_JSON_VALUE)
	public String familyAdd(Family family, Model model) {
		if (StringUtils.isNotEmpty(family.getId())) {
			family = familyService.get(family.getId());

		} else {
			family = new Family();
		}
		model.addAttribute("family", family);
		return "modules/cms/front/themes/mobile/userFamilyAdd";
	}

	@ResponseBody
	@RequestMapping(value = "familySave.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> familySaveJson(Family family, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			map.put("result", false);
			map.put("msg", "请登录之后再添加");
			return map;
		} else {
			family.setResident(resident);
			if (null == family.getCreateBy()) {
				family.setCreateBy(new User("1"));
			}
			if (!beanValidator(model, family)) {
				map.put("result", false);
				map.put("msg", model.asMap().get("message"));
				return map;
			}
			familyService.save(family);
			map.put("result", true);
		}
		return map;
	}

	/**
	 * 健康档案添加
	 */
	@RequestMapping(value = "healthRecordAdd")
	public String healthRecordAdd(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			Page<Business> bPage = new Page<Business>(1, 10);
			bPage.setOrderBy("star desc");
			bPage = businessService.findPage(bPage, new Business());
			model.addAttribute("bpage", bPage);
			return "modules/cms/front/themes/mobile/goLogin";
		}
		Family family = new Family();
		family.setResident(resident);
		List<Family> families = familyService.findList(family);
		model.addAttribute("familyList", families);
		return "modules/cms/front/themes/mobile/healthRecordAdd";
	}

	@ResponseBody
	@RequestMapping(value = "healthRecordSave.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map healthRecordSave(HealthRecord healthRecord, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			map.put("result", false);
			map.put("msg", "请登录之后再添加");
			return map;
		} else {
			healthRecord.setResidentId(resident.getId());
			if (null == healthRecord.getCreateBy()) {
				healthRecord.setCreateBy(new User("1"));
			}
			if (!beanValidator(model, healthRecord)) {
				map.put("result", false);
				map.put("msg", model.asMap().get("message"));
				return map;
			}
			healthRecordService.save(healthRecord);
			map.put("result", true);
		}
		return map;
	}

	/**
	 * 密码修改－form
	 */
	@RequestMapping(value = "resPswd")
	public String resPswdForm(Model model) {
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			Page<Business> bPage = new Page<Business>(1, 10);
			bPage.setOrderBy("star desc");
			bPage = businessService.findPage(bPage, new Business());
			model.addAttribute("bpage", bPage);
			return "modules/cms/front/themes/mobile/goLogin";
		}
		return "modules/cms/front/themes/mobile/resPswdForm";
	}

	/**
	 * 密码修改－update
	 */
	@ResponseBody
	@RequestMapping(value = "resPswdUpd.do")
	public Map<String, Object> resPswdUpd(String oldpswd, String newpswd) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			map.put("result", false);
			map.put("msg", "响应超时或用户已失效，请重新登录");
			return map;
		}
		resident = residentService.get(resident.getId());
		if (!MD5Util.getMD5(oldpswd).equals(resident.getLoginPswd())) {
			map.put("result", false);
			map.put("msg", "旧密码不正确，请重新输入");
			return map;
		}

		residentService.updatePswd(MD5Util.getMD5(newpswd), resident.getId());

		map.put("result", true);
		return map;
	}

	/**
	 * 居民评论
	 * 
	 * @param id
	 * @param content
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/comment-{id}.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public String articleComment(@PathVariable("id") String id, String content) {
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (null == resident) {
			return "{\"msg\":\"nologin\"}";
		} else {
			if (StringUtils.isEmpty(content)) {
				return "{\"msg\":\"false\"}";
			} else {
				Comments comments = new Comments();
				comments.setArticle(new Article(id));
				comments.setContent(content);
				comments.setHasReply(Constants.TYPE_STATUS_0);
				comments.setCreateDate(new Date());
				comments.setResident(resident);
				comments.setCreateBy(new User("1"));
				commentsService.save(comments);
				return "{\"msg\":\"true\"}";
			}
		}
	}

	/**
	 * 注册页面
	 */
	@RequestMapping(value = "register")
	public String registerPage(Model model, Resident resident) {
		if (resident == null) {
			resident = new Resident();
		}
		model.addAttribute("resident", resident);
		return "modules/cms/front/themes/mobile/register";
	}

	/**
	 * 注册页面 save
	 */
	@RequestMapping(value = "registerSave")
	public String registerSave(Model model, Resident resident,
			String validateCode, RedirectAttributes redirectAttributes) {
		if (resident == null) {
			resident = new Resident();
		}
		if (StringUtils.isEmpty(validateCode)) {
			addMessage(model, "请输入验证码");
			return registerPage(model, resident);
		}
		// 验证码
		String code = (String) UserUtils.getSession().getAttribute(
				"validateCode");
		if (!validateCode.toUpperCase().equals(code)) {
			addMessage(model, "验证码错误");
			return registerPage(model, resident);
		}

		resident.setLoginPswd(MD5Util.getMD5(resident.getLoginPswd()));
		resident.setLoginFlag(Constants.LOGIN_FLAG_NORMAL);
		resident.setAduitStatus(Constants.ADUIT_STATUS_YES);
		resident.setCreateBy(new User("1"));
		resident.setUpdateBy(new User("1"));
		resident.setCreateDate(new Date());
		resident.setUpdateDate(new Date());
		residentService.save(resident);
		addMessage(redirectAttributes, "注册成功");

		// 更新积分 5分
		residentService.updatePoints(resident.getId(), 5);

		return "redirect:" + Global.getFrontPath() + "/mobile/login?repage";
	}

	@RequestMapping(value = "findBackPassword")
	public String findBackPassword() {
		return "modules/cms/front/themes/mobile/findBackPassword";
	}

	@RequestMapping(value = "resetPassword")
	public String resetPassword() {
		return "modules/cms/front/themes/mobile/resetPassword";
	}

	@ResponseBody
	@RequestMapping(value = "checkResidentInfo.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public String checkResidentInfo(Resident resident) {
		Resident residentsear = new Resident();
		if (StringUtils.isEmpty(resident.getName())) {
			return "false";
		} else {
			residentsear.setName(resident.getName());
			List<Resident> residents = residentService.findList(residentsear);
			if (residents.size() <= 0) {
				return "false";
			} else {
				Resident resident2 = residents.get(0);
				if (StringUtils.isNotEmpty(resident.getBuildingNo())
						&& resident.getBuildingNo().equals(
								resident2.getBuildingNo())
						&& StringUtils.isNotEmpty(resident.getIdentityNo())
						&& resident.getIdentityNo().equals(
								resident2.getIdentityNo())
						&& StringUtils.isNotEmpty(resident.getTelphone())
						&& resident.getTelphone().equals(
								resident2.getTelphone())) {
					return "true";
				} else {
					return "false";
				}
			}
		}
	}

	@ResponseBody
	@RequestMapping(value = "resetPasswordByName.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public String resetPasswordByName(String name, String password) {
		Resident residentsear = new Resident();
		if (StringUtils.isEmpty(name) || StringUtils.isEmpty(password)) {
			return "flase";
		} else {
			residentsear.setName(name);
			List<Resident> residents = residentService.findList(residentsear);
			if (residents.size() <= 0) {
				return "flase";
			} else {
				Resident resident2 = residents.get(0);
				resident2.setLoginPswd(MD5Util.getMD5(password));
				residentService.save(resident2);
			}
		}
		return "true";
	}

	@ResponseBody
	@RequestMapping(value = "orderDelete.json", produces = MediaType.APPLICATION_JSON_VALUE)
	public String orderDelete(String id) {
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (null == resident) {
			return "{\"msg\":\"nologin\"}";
		} else {
			Orders orders = new Orders(id);
			try {
				orders.setStatus(DictUtils.getDictValue("已取消","goods_status", ""));
				ordersService.save(orders);
				return "{\"msg\":\"true\"}";
			} catch (Exception e) {
				return "{\"msg\":\"false\"}";
			}
		}
	}
	/**
	 * 预订商家－评论update
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "resOrderUpdComSt.do")
	public Map<String, Object> resOrderUpdComSt(String oid, String stars,
			String remarks) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 判断是否登录
		Resident resident = (Resident) UserUtils.getSession().getAttribute(
				Constants.MOBILE_USER_KEY);
		if (resident == null || StringUtils.isEmpty(resident.getId())) {
			map.put("result", false);
			map.put("msg", "响应超时或用户已失效，请重新登录");
			return map;
		}
		Orders orders = new Orders(oid);
		orders.setResident(resident);
		orders.setComStatus(Constants.COM_STATUS_1);
		orders.setUpdateDate(new Date());
		try {
			ordersService.updateComStatusFront(orders, stars, remarks);
		} catch (Exception e) {
			map.put("result", false);
			map.put("msg", "保存失败，请稍候在试……");
			e.printStackTrace();
			return map;
		}
		//更新积分 2分
		residentService.updatePoints(resident.getId(), 2);
		map.put("result", true);
		return map;
	}

}

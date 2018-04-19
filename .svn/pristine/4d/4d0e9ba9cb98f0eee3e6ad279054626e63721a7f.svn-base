package com.thinkgem.jeesite.client.endpoint;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thinkgem.jeesite.common.constants.Constants;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.ArticleData;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.service.ArticleDataService;
import com.thinkgem.jeesite.modules.cms.service.ArticleService;
import com.thinkgem.jeesite.modules.cms.service.CategoryService;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.witcm.resident.entity.Resident;
import com.thinkgem.jeesite.modules.witcm.resident.service.ResidentService;

/**
 * 前台登陆控制器
 * 
 * @author liyongfang
 * 
 */
@Controller
@RequestMapping(value = "${clientPath}")
public class LoginEndpoint {
	@Autowired
	private ResidentService residentService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ArticleDataService articleDataService;
	/**
	 * 系统当前登陆居民
	 */
	// TODO 添加或者改写为自己的逻辑
	private Resident resident=new Resident();
	/**
	 * 首页图片
	 */
	// TODO 添加自己的去图片的逻辑
	public static List<String> imageList = new ArrayList<String>();
	static {
		imageList.add("/client/img/lunbo-chrome-icon.png");
		imageList.add("/client/img/lunbo-chrome-icon.png");
		imageList.add("/client/img/lunbo-chrome-icon.png");
	}



	public Resident getResident() {
		resident = residentService.get("221fd60cb7544f51af6e7443dacdec5a");
		return resident;
	};

	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping("/index${urlSuffix}")
	public String index(Model model) {
		// 首页文章分类数据
		List<Category> categories = CmsUtils.getMainNavList("1");
		for (Category category : categories) {
			category.setIndexLink(MessageFormat.format(
					Constants.ARTCLE_INDEX_LINK,category.getId()));
		}
		model.addAttribute("categoryList", categories);
		model.addAttribute("imageList", imageList);
		return "client/common/index";
	}
	/**
	 * 文章详情
	 * 
	 * @return
	 */
	@RequestMapping("/articleDetail${urlSuffix}/{id}")
	public String articleDetail(@PathVariable("id") String id, String pageName, Model model) {
        Article article=articleService.get(id);
        article.setArticleData(articleDataService.get(id));
        Article article2=new Article();
        article2.setCategory(new Category(article.getCategory().getId()));
        List<Article> articles=articleService.findList(article2);
        int index=articles.indexOf(article);
        //取前一个和后一个
        int preIndex=index-1;
        int nextIndex=index+1;
        if(preIndex>=0&&preIndex<articles.size()&nextIndex>=0&&nextIndex<articles.size()){
        	model.addAttribute("pre",articles.get(preIndex));
        	model.addAttribute("next",articles.get(nextIndex));
        }else if(preIndex>=0&&preIndex<articles.size()){
        	model.addAttribute("pre",articles.get(preIndex));
        	model.addAttribute("next",null);
        }else{
        	model.addAttribute("pre",null);
        	model.addAttribute("next",articles.get(nextIndex));
        }
        model.addAttribute("article", article);
		return "client/common/"+pageName;
	}
	/**
	 * 文章中心 id : 帖子分类id
	 * 
	 * @return
	 */
	@RequestMapping("/articleIndex${urlSuffix}/{id}")
	public String articleIndex(@PathVariable("id") String id, Model model) {

		return "client/common/articleIndex";
	}
	/**
	 * 文章中心 id : 帖子分类id
	 * 
	 * @return
	 */
	@ResponseBody
 	@RequestMapping(value="/articleIndex${urlSuffix}/{id}",method=RequestMethod.GET)
	public List<Article> articleIndexJson(@PathVariable("id") String id, Model model) {
		getResident();
        List<Article> articles=articleService.getList(id,"1",resident.getBelongOrg().getId(),7);
		return articles;
	}
	/**
	 * 文章中心 id : 帖子分类id
	 * 
	 * @return
	 */
	@RequestMapping("/articleList${urlSuffix}/{id}")
	public String articleList(@PathVariable("id") String id,@RequestParam(required=false, defaultValue="1") Integer pageNo,
			@RequestParam(required=false, defaultValue="10") Integer pageSize,String pageName, Model model) {
		Category category = categoryService.get(id);
		if (category==null){
			return "client/common/404";
		}
		//获取文章列表
		Page<Article> page=new Page<Article>(pageNo,pageSize);
		Article article=new Article();
		article.setCategory(new Category(id));
		page=articleService.findPage(page, article);
		if(page.getList().size()>0){
			List<Article> aList=page.getList();
			for (int i=0;i<aList.size();i++) {
				Article a=aList.get(i);
				ArticleData articleData=articleDataService.get(a.getId());
			    articleData.setContent(StringUtils.abbr(articleData.getContent(), 600));
				a.setArticleData(articleData);
			}
		}
		model.addAttribute("page", page);
		return "client/common/"+pageName;
	}

	@RequestMapping("/login${urlSuffix}")
	public String login() {
		return "client/common/login";
	}
}

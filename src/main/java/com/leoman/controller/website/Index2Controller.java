package com.leoman.controller.website;

import com.leoman.controller.common.CommonController;
import com.leoman.entity.BaseInfo;
import com.leoman.service.BaseInfoService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2016/4/11.
 */
@RequestMapping(value = "/ws")
@Controller
public class Index2Controller extends CommonController{


    @Autowired
    private BaseInfoService service;

    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "website2/index";
    }

    /**
     * 单页详情
     * 包括(关于我们，公司发展)
     * @return
     */
    @RequestMapping(value = "/about")
    public String about(Integer type,Model model) {
        BaseInfo infoAbout = service.findByType(1);
        BaseInfo infoCompany = service.findByType(2);
        if(infoAbout.getContent() != null) {
            infoAbout.setContent(StringUtils.isNotBlank(infoAbout.getContent()) ? infoAbout.getContent().replaceAll("&lt","<").replaceAll("&gt",">") : "");
        }
        if(infoCompany.getContent() != null) {
            infoCompany.setContent(StringUtils.isNotBlank(infoCompany.getContent()) ? infoCompany.getContent().replaceAll("&lt","<").replaceAll("&gt",">") : "");
        }
        model.addAttribute("infoAbout",infoAbout);
        model.addAttribute("infoCompany",infoCompany);
//        if(type == 3 || type == 4) {
//            return "website/baseinfo-detail1";
//        }
//        else {
//            return "website/baseinfo-detail2";
//        }
        return "website2/aboutus";
    }

    /**
     * 单页详情
     * 加入我们
     * @return
     */
    @RequestMapping(value = "/join")
    public String join(Model model) {
        BaseInfo joinInfo = service.findByType(3);
        if(joinInfo.getContent() != null) {
            joinInfo.setContent(StringUtils.isNotBlank(joinInfo.getContent()) ? joinInfo.getContent().replaceAll("&lt","<").replaceAll("&gt",">") : "");
        }
        model.addAttribute("joinInfo",joinInfo);
        return "website2/joinus";
    }

    /**
     * 单页详情
     * 联系我们
     * @return
     */
    @RequestMapping(value = "/contact")
    public String contact(Model model) {
        BaseInfo contactInfo = service.findByType(4);
        if(contactInfo.getContent() != null) {
            contactInfo.setContent(StringUtils.isNotBlank(contactInfo.getContent()) ? contactInfo.getContent().replaceAll("&lt","<").replaceAll("&gt",">") : "");
        }
        model.addAttribute("contactInfo",contactInfo);
        return "website2/contactus";
    }
}

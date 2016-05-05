package com.leoman.controller.website;

import com.leoman.controller.common.CommonController;
import com.leoman.entity.BaseInfo;
import com.leoman.service.BaseInfoService;
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
        return "website/index";
    }

    /**
     * 单页详情
     * 包括(关于我们，公司发展)
     * @return
     */
    @RequestMapping(value = "/about")
    public String about(Integer type,Model model) {
        BaseInfo info = service.findByType(type);
        if(info.getContent() != null) {
            info.setContent(info.getContent().replaceAll("&lt","<").replaceAll("&gt",">"));
        }
        model.addAttribute("info",info);
        if(type == 3 || type == 4) {
            return "website/baseinfo-detail1";
        }
        else {
            return "website/baseinfo-detail2";
        }
    }
}

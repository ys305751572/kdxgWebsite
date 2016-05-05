package com.leoman.controller.website;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.entity.ClassifyWs;
import com.leoman.entity.InformationWs;
import com.leoman.service.ClassifyWsService;
import com.leoman.service.InformationWsService;
import com.leoman.utils.DateUtils;
import com.leoman.utils.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/4/5.
 */
@Controller
@RequestMapping(value = "ws/infows")
public class InfoWsController extends CommonController{

    @Autowired
    public InformationWsService service;

    @Autowired
    public ClassifyWsService classifyWsService;

    /**
     * 资讯首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(Model model) {
        List<ClassifyWs> list = classifyWsService.findAll();
        model.addAttribute("wsList",list);
        return "website/infows-list";
    }

    /**
     * 翻页查询
     * @param response
     * @param draw
     * @param start
     * @param length
     * @param type
     */
    @RequestMapping(value = "/list",method = RequestMethod.POST)
    public void list(HttpServletRequest request, HttpServletResponse response,
                     Integer draw,
                     Integer start,
                     Integer length,
                     Integer type) {
        try {
            start = (start == null ? 1 : start);
            length = (length == null ? 10 : length);
            Page<InformationWs> page = service.findPage(null,type,start,length);
            Map<String, Object> result = DataTableFactory.fitting(draw, page);

            List<InformationWs> infoList = page.getContent();
            String html = "";

            for (InformationWs info : infoList) {
                html += " <div class=\"aside\" style=\"height:auto\">";
                html += "<div class=\"side_box\">";
                html += "<span class=\"time\">"+ DateUtils.longToString(info.getCreateDate(),"yyyy-MM-dd") +"</span><br><span></span>";
                html += "</div>";
                html += "</div>";
                html += "<div class=\"section1\" style=\"height:auto\">";
                html += "<span>"+ info.getTitle() +"</span>";
                html += info.getContent().replaceAll("&lt","<").replaceAll("&gt",">");
                html += "<a href=\"#\" onclick=\"website.fn.detail("+ info.getId() +")\" class=\"link_all\">阅读全文</a>";
                html += "</div>";
            }
            result.put("html",html);
            result.put("start",++start);
            result.put("lenght",length);
            result.put("isEnd",!page.hasNextPage());
            WebUtil.print(response, result);
        } catch (Exception e) {
            GeneralExceptionHandler.log(e);
            WebUtil.print(response, emptyData);
        }
    }

    /**
     * 资讯详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail")
    public String detail(@RequestParam(value = "id", required = true) Long id, Model model) {

        InformationWs info = service.getById(id);
        if(info.getContent() != null) {
            info.setContent(info.getContent().replaceAll("&lt","<").replaceAll("&gt",">"));
        }
        model.addAttribute("info",info);
        return "website/info-detail";
    }
}

package com.leoman.controller;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.core.bean.Result;
import com.leoman.entity.Single;
import com.leoman.service.SingleService;
import com.leoman.utils.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by Administrator on 2016/3/31.
 */
@Controller
@RequestMapping(value = "admin/single")
public class SingleController extends CommonController {
    @Autowired
    private SingleService service;

    /**
     * 列表页面
     *
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "single/list";
    }


    /**
     * @param request
     * @param response
     * @param length
     * @param start
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public void list(HttpServletRequest request,
                     HttpServletResponse response,
                     Integer length,
                     Integer start,
                     Single single,
                     Integer draw) {
        try {
            int pageNum = getPageNum(start, length);
            Page<Single> page = service.find(pageNum, length);
            Map<String, Object> result = DataTableFactory.fitting(draw, page);
            WebUtil.print(response, result);
        } catch (Exception e) {
            GeneralExceptionHandler.log(e);
            WebUtil.print(response, emptyData);
        }
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(Long id, Model model) {

        if (id != null) {
            try {
                Single single = service.getById(id);
                if(single.getContent() != null) {
                    single.setContent(single.getContent().replace("&lt","<").replace("&gt",">"));
                }
                model.addAttribute("single", single);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "single/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletResponse response,Single single) {
        try{
            Single _s = service.getById(single.getId());
            _s.setContent(single.getContent());
            service.create(_s);
            WebUtil.print(response, new Result(true).msg("操作成功!"));
        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
    }

    /**
     * 详情
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(Long id,Model model) {

        Single single = service.getById(id);
        if(single.getContent() != null) {
            single.setContent(single.getContent().replace("&lt","<").replace("&gt",">"));
        }
        model.addAttribute("single",single);
        return "single/detail";
    }
}

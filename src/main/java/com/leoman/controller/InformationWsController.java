package com.leoman.controller;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.core.bean.Result;
import com.leoman.entity.Information;
import com.leoman.entity.InformationWs;
import com.leoman.service.InformationWsService;
import com.leoman.utils.JsonUtil;
import com.leoman.utils.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by Administrator on 2016/3/21.
 */
@RequestMapping(value = "admin/infows")
@Controller
public class InformationWsController extends CommonController{

    @Autowired
    private InformationWsService service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "infows/list";
    }

    /**
     * @param response
     * @param draw
     * @param start
     * @param length
     * @param title
     */
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public void list(HttpServletResponse response, Integer draw, Integer start, Integer length, String title,Integer type,Integer status) {
        try {
            int pageNum = getPageNum(start, length);
            Page<InformationWs> page = service.findPage(title,type,status,pageNum,length);
            Map<String, Object> result = DataTableFactory.fitting(draw, page);
            WebUtil.print(response, result);
        } catch (Exception e) {
            GeneralExceptionHandler.log(e);
            WebUtil.print(response, emptyData);
        }
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String edit(Long id, Model model) {
        if(id != null) {
            InformationWs ws = service.getById(id);
            ws.setContent( ws.getContent().replace(">","&gt").replace("<","&lt"));
            model.addAttribute("ws",ws);
        }
        return "infows/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletResponse response,InformationWs ws) {

        try {
            ws.setStatus(0);
            service.create(ws);
            WebUtil.print(response, new Result(true).msg("操作成功!"));
        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
    }

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(Long id,Model model) {
        InformationWs ws = service.getById(id);
        ws.setContent( ws.getContent().replace("&gt",">").replace("&lt","<"));
        model.addAttribute("ws",ws);
        return "infows/detail";
    }

    @RequestMapping(value = "delete",method = RequestMethod.GET)
    public String delete(HttpServletResponse response,Long id) {
        try {
            service.deleteById(id);
            WebUtil.print(response, new Result(true).msg("操作成功!"));
            return "infows/list";
        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
        return null;
    }

    /**
     *
     * @param response
     * @param ids
     */
    @RequestMapping(value = "/publish", method =  RequestMethod.POST)
    @ResponseBody
    public void publish(HttpServletResponse response,String ids) {
        Long[] arrayId = JsonUtil.json2Obj(ids, Long[].class);
        service.publish(arrayId);
        WebUtil.print(response, new Result(true).msg("操作成功!"));
    }
}

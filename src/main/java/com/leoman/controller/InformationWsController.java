package com.leoman.controller;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.core.bean.Result;
import com.leoman.entity.ClassifyWs;
import com.leoman.entity.InformationWs;
import com.leoman.service.ClassifyWsService;
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
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/3/21.
 */
@RequestMapping(value = "admin/infows")
@Controller
public class InformationWsController extends CommonController{

    @Autowired
    private InformationWsService service;

    @Autowired
    private ClassifyWsService classifyWsService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        List<ClassifyWs> list = classifyWsService.findAll();
        model.addAttribute("typeList",list);
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
    public void list(HttpServletResponse response,
                     Integer draw,
                     Integer start,
                     Integer length,
                     String title,
                     Integer type) {
        try {
            int pageNum = getPageNum(start, length);
            Page<InformationWs> page = service.findPage(title,type,pageNum,length);
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
            try {
                InformationWs ws = service.getById(id);
                ws.setContent(ws.getContent().replace(">", "&gt").replace("<", "&lt"));
                model.addAttribute("ws", ws);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<ClassifyWs> list = classifyWsService.findAll();
        model.addAttribute("typeList",list);
        return "infows/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletResponse response,InformationWs ws,Long type2,Model model) {

        try {
            if(ws.getId() != null) {
                InformationWs _ws = service.getById(ws.getId());
                ws.setCreateDate(_ws.getCreateDate());
            }

            ClassifyWs ws2 = new ClassifyWs();
            ws2.setId(type2);
            ws.setClassifyWs(ws2);

            service.create(ws);
            WebUtil.print(response, new Result(true).msg("操作成功!"));
            List<ClassifyWs> list = classifyWsService.findAll();
            model.addAttribute("typeList",list);
        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
    }

    @RequestMapping(value = "/detail",method = RequestMethod.GET)
    public String detail(Long id,Model model) {
        InformationWs ws = service.getById(id);
        ws.setContent( ws.getContent().replace("&gt",">").replace("&lt","<"));
//        List<ClassifyWs> list = classifyWsService.findAll();
//        model.addAttribute("typeList",list);
        model.addAttribute("ws",ws);
        return "infows/detail";
    }

    /**
     * 删除
     *
     * @param response
     * @param id
     */
    @RequestMapping(value = "/delete", method = RequestMethod.GET )
    @ResponseBody
    public int delete(HttpServletResponse response, Long id) {
        try {
            service.deleteById(id);
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
        return 0;
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

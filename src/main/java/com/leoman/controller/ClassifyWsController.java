package com.leoman.controller;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.core.bean.Result;
import com.leoman.entity.Admin;
import com.leoman.entity.ClassifyWs;
import com.leoman.entity.Information;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/3/30.
 */
@Controller
@RequestMapping(value = "admin/classifyws")
public class ClassifyWsController extends CommonController {

    @Autowired
    private ClassifyWsService service;

    @Autowired
    private InformationWsService informationWsService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "classifyws/list";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @ResponseBody
    public void list(HttpServletRequest request,
                     HttpServletResponse response,
                     Integer length,
                     Integer start,
                     ClassifyWs classifyws,
                     Number number,
                     String name,
                     Integer draw) {
        try {
            int pageNum = getPageNum(start, length);
            Page<ClassifyWs> page = service.findPage(name,pageNum, length);
            List<ClassifyWs> list = page.getContent();
            if(list != null && !list.isEmpty()) {
                for (ClassifyWs ws : list) {
                    Integer count = informationWsService.count(ws.getId());
                    ws.setNumber(count == null ? 0 : count);
                }
            }

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
                ClassifyWs classifyws = service.getById(id);
                model.addAttribute("classifyws", classifyws);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "classifyws/add";
    }


    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletResponse response,ClassifyWs classifyws) {
        try{
            if(classifyws.getId() != null) {
                ClassifyWs _ws = service.getById(classifyws.getId());
                classifyws.setCreateDate(_ws.getCreateDate());
            }
            service.create(classifyws);
            WebUtil.print(response, new Result(true).msg("操作成功!"));
        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
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
}

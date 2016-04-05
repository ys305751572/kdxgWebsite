package com.leoman.controller;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.common.factory.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.core.bean.Result;
import com.leoman.entity.Admin;
import com.leoman.entity.Single;
import com.leoman.service.AdminService;
import com.leoman.utils.Md5Util;
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
@RequestMapping(value = "admin/admin")
public class AdminController extends CommonController {

    @Autowired
    private AdminService service;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "admin/list";
    }

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
        } catch (Exception e) {
            GeneralExceptionHandler.log(e);
            WebUtil.print(response, emptyData);
        }
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public String edit(Long id, Model model) {
        if(id != null) {
            try {
                Admin admin = service.getById(id);
                model.addAttribute("admin", admin);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "admin/add";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public void save(HttpServletRequest request,HttpServletResponse response,String password,String password1) {
        try{

            Admin _admin = (Admin) request.getSession().getAttribute(Constant.SESSION_MEMBER_GLOBLE);
            Admin _admin2 = service.getById(_admin.getId());
            if(_admin2.getPassword().equals(Md5Util.md5(password))) {
                _admin2.setPassword(Md5Util.md5(password1));
                service.update(_admin2);
                WebUtil.print(response, new Result(true).msg("操作成功!"));
            }
            else {
                WebUtil.print(response, new Result(false).msg("原密码错误!"));
            }


        } catch (Exception e) {
            e.printStackTrace();
            WebUtil.print(response, new Result(false).msg("操作失败!"));
        }
    }

}

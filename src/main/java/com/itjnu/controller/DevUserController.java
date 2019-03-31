package com.itjnu.controller;

import com.itjnu.pojo.DevUser;
import com.itjnu.service.AppInfoService;
import com.itjnu.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dev")
public class DevUserController {

    @Autowired
    private DevUserService devUserService;

    @Autowired
    private AppInfoService appInfoService;

    @RequestMapping("/toLogin")
    public String toLogin(){

        return "dev/login";
    }

    @RequestMapping("/login")
    public String login(DevUser devUser, Model model, HttpSession session){
        devUser = devUserService.login(devUser);
        if(devUser != null){
            //登录成功
            session.setAttribute("devUser",devUser);
            return "dev/index";
        }else{
            model.addAttribute("errMsg","登录失败");
            return "dev/login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("devUser");
        session.invalidate();
        return "redirect:/";
    }
}

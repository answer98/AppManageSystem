package com.itjnu.controller;

import com.itjnu.pojo.AppCategory;
import com.itjnu.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/category")
public class AppCategoryController {

    @Autowired
    private AppCategoryService appCategoryService;

    @RequestMapping("/queryLevelTwoByLevelOne/{levelOneId}")
    @ResponseBody
    public List<AppCategory> queryLevelTwoByLevelOne(@PathVariable("levelOneId") Long id){
        List<AppCategory> levelTwo = appCategoryService.queryLevelTwoByLevelOne(id);
        return levelTwo;
    }

    @RequestMapping("/queryLevelThreeByLevelTwo/{levelTwoId}")
    @ResponseBody
    public List<AppCategory> queryLevelThreeByLevelTwo(@PathVariable("levelTwoId") Long id){
        List<AppCategory> levelThree = appCategoryService.queryLevelThreeByLevelTwo(id);
        return levelThree;
    }
}

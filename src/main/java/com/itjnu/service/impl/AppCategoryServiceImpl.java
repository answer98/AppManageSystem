package com.itjnu.service.impl;

import com.itjnu.mapper.AppCategoryMapper;
import com.itjnu.pojo.AppCategory;
import com.itjnu.service.AppCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("appCategoryService")
public class AppCategoryServiceImpl implements AppCategoryService {

    @Autowired
    private AppCategoryMapper appCategoryMapper;

    @Override
    public List<AppCategory> queryAllLevelOne() {
        return appCategoryMapper.queryAllLevelOne();
    }

    @Override
    public List<AppCategory> queryLevelTwoByLevelOne(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

    @Override
    public List<AppCategory> queryLevelThreeByLevelTwo(Long id) {
        return appCategoryMapper.queryLevelByParentId(id);
    }

}

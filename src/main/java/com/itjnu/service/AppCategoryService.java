package com.itjnu.service;

import com.itjnu.pojo.AppCategory;

import java.util.List;

public interface AppCategoryService {

    List<AppCategory> queryAllLevelOne();

    List<AppCategory> queryLevelTwoByLevelOne(Long id);

    List<AppCategory> queryLevelThreeByLevelTwo(Long id);
}

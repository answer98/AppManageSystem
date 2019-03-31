package com.itjnu.service;

import com.github.pagehelper.PageInfo;
import com.itjnu.dto.AppInfoDTO;
import com.itjnu.pojo.AppInfo;
import com.itjnu.pojo.DataDictionary;

import java.util.List;

public interface AppInfoService {
    PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo);

    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatform();

    PageInfo<AppInfo> query(AppInfoDTO appInfoDTO);

    boolean add(AppInfo appInfo, long userId);

    boolean delete(Long id);

    AppInfo queryById(Long id);

    void update(AppInfo appInfo);

    AppInfo queryDetailById(Long id);
}

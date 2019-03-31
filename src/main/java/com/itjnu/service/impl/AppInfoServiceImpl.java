package com.itjnu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itjnu.constant.CommonCodeConstant;
import com.itjnu.dto.AppInfoDTO;
import com.itjnu.mapper.AppInfoMapper;
import com.itjnu.mapper.DataDictionaryMapper;
import com.itjnu.pojo.AppInfo;
import com.itjnu.pojo.DataDictionary;
import com.itjnu.pojo.DevUser;
import com.itjnu.service.AppInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service("appInfoService")
public class AppInfoServiceImpl implements AppInfoService {

    @Autowired
    private AppInfoMapper appInfoMapper;

    @Autowired
    private DataDictionaryMapper dataDictionaryMapper;

    @Override
    public PageInfo<AppInfo> queryByDevUserId(Long id,PageInfo pageInfo) {
        //第几页和页码大小
        PageHelper.startPage(pageInfo.getPageNum(),pageInfo.getPageSize());
        AppInfoDTO a = new AppInfoDTO();
        a.setDevUserId(id);
        List<AppInfo> l = appInfoMapper.query(a);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(l);
        return page;
    }

    @Override
    public List<DataDictionary> queryAllAppStatus() {

        return dataDictionaryMapper.queryAllAppStatus();
    }

    @Override
    public List<DataDictionary> queryAllFlatform() {
        return dataDictionaryMapper.queryAllFlatform();
    }

    @Override
    public PageInfo<AppInfo> query(AppInfoDTO appInfoDTO) {
        //
        if(appInfoDTO.getPageNum() == null){
            appInfoDTO.setPageNum(1);
        }
        PageHelper.startPage(appInfoDTO.getPageNum(), CommonCodeConstant.PAGE_SIZE);
        List<AppInfo> l = appInfoMapper.query(appInfoDTO);
        PageInfo<AppInfo> page = new PageInfo<AppInfo>(l);
        return page;
    }

    @Override
    public boolean add(AppInfo appInfo, long userId) {
        //先处理信息
        appInfo.setCreationDate(new Date());
        DevUser devUser = new DevUser();
        devUser.setId(userId);
        appInfo.setDevUser(devUser);
        appInfo.setCreatedBy(userId);
        DataDictionary dataDictionary = new DataDictionary();
        dataDictionary.setValueId(CommonCodeConstant.APP_STATUS_AUDITED);
        appInfo.setAppStatus(dataDictionary);
        int row = appInfoMapper.add(appInfo);
        return false;
    }

    @Override
    public boolean delete(Long id) {
        if(id != null){
            int row = appInfoMapper.deleteById(id);
            return row == 1 ? true:false;
        }
        return false;
    }

    @Override
    public AppInfo queryById(Long id) {
        return appInfoMapper.queryById(id);
    }

    @Override
    public void update(AppInfo appInfo) {
        appInfo.setModifyDate(new Date());
        appInfo.setUpdateDate(new Date());

        appInfoMapper.updateById(appInfo);
    }

    @Override
    public AppInfo queryDetailById(Long id) {
        return appInfoMapper.queryDetailById(id);
    }
}

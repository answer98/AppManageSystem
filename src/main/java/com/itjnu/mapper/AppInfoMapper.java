package com.itjnu.mapper;

import com.itjnu.dto.AppInfoDTO;
import com.itjnu.pojo.AppInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AppInfoMapper {

    //List<AppInfo> queryByDevUserId(@Param("devUserId") Long id);

    List<AppInfo> query(AppInfoDTO appInfoDTO);

    int add(AppInfo appInfo);

    int deleteById(@Param("id") Long id);

    AppInfo queryById(@Param("id") Long id);

    void updateById(AppInfo appInfo);

    AppInfo queryDetailById(@Param("id") Long id);
}
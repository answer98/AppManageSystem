package com.itjnu.mapper;

import com.itjnu.pojo.DevUser;

import java.util.List;


public interface DevUserMapper {

    List<DevUser> queryByNamePwd(DevUser devUser);
}
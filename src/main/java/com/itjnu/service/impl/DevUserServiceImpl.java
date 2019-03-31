package com.itjnu.service.impl;

import com.itjnu.mapper.DevUserMapper;
import com.itjnu.pojo.DevUser;
import com.itjnu.service.DevUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("devUserService")
public class DevUserServiceImpl implements DevUserService {

    @Autowired
    private DevUserMapper devUserMapper;

    @Override
    public DevUser login(DevUser devUser) {
        List<DevUser> users = devUserMapper.queryByNamePwd(devUser);
        if(users != null && users.size() == 1){
            return users.get(0);
        }
        return null;
    }
}

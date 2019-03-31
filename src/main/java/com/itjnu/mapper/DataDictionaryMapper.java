package com.itjnu.mapper;

import com.itjnu.pojo.DataDictionary;

import java.util.List;

public interface DataDictionaryMapper {

    List<DataDictionary> queryAllAppStatus();

    List<DataDictionary> queryAllFlatform();
}
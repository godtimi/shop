package com.cow.horse.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.cow.horse.entity.Files;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper extends BaseMapper<Files> {
}

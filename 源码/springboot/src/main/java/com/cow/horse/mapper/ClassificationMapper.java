package com.cow.horse.mapper;

import com.cow.horse.controller.dto.HomeMenuResultDTO;
import com.cow.horse.entity.Classification;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface ClassificationMapper extends BaseMapper<Classification> {

    List<HomeMenuResultDTO> getMenus();
}

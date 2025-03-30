package com.cow.horse.mapper;

import com.cow.horse.entity.LiveProduct;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface LiveProductMapper extends BaseMapper<LiveProduct> {

    List<LiveProduct> findAll(@Param("liveId") Integer liveId);
}

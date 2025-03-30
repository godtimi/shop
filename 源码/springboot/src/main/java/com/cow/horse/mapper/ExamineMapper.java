package com.cow.horse.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cow.horse.entity.Examine;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface ExamineMapper extends BaseMapper<Examine> {

    Page<Examine> findPage(Page<Object> objectPage, @Param("role") String role, @Param("userId") Integer userId);
}

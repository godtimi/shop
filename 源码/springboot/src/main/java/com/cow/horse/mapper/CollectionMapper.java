package com.cow.horse.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cow.horse.entity.Collection;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface CollectionMapper extends BaseMapper<Collection> {

    Page<Collection> findPage(Page<Object> objectPage, @Param("name") String name);
}

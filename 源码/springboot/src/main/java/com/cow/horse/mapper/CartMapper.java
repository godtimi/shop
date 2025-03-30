package com.cow.horse.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cow.horse.entity.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface CartMapper extends BaseMapper<Cart> {

    Page<Cart> page(Page<Object> objectPage, @Param("userId") Integer userId, @Param("role") String role, @Param("name") String name);

    void updateNum(@Param("id") Integer id, @Param("num") Integer num);
}

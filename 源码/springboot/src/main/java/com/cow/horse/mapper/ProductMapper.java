package com.cow.horse.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cow.horse.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface ProductMapper extends BaseMapper<Product> {

    Page<Product> findPage(Page<Object> objectPage, @Param("name") String name, @Param("role") String role);

    Integer findLovely(@Param("uid") Integer uid);

    List<Product> listByCid(@Param("cid") Integer cid, @Param("city") String city);

    Page<Product> findPages(Page<Object> objectPage, @Param("name") String name, @Param("city") String city);
}

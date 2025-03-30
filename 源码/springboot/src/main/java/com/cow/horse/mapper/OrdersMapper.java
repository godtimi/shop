package com.cow.horse.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.cow.horse.entity.Orders;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface OrdersMapper extends BaseMapper<Orders> {


    Page<Orders> finPage(Page<Object> objectPage, @Param("name") String name, @Param("role") String role, @Param("userId") Integer userId, @Param("state") Integer state);

    Double selectSale();

    Integer selectSaleToday(@Param("str") String str, @Param("str1") String str1);

    List<String> members(@Param("queryStartTime") String queryStartTime, @Param("queryEndTime") String queryEndTime, @Param("city") String city);

    List<String> dateTime(@Param("queryStartTime") String queryStartTime, @Param("queryEndTime") String queryEndTime);
}

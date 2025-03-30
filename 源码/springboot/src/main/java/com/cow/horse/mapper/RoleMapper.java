package com.cow.horse.mapper;

import com.cow.horse.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface RoleMapper extends BaseMapper<Role> {

    Integer selectByFlag(@Param("flag") String flag);
}

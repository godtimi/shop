package com.cow.horse.mapper;

import com.cow.horse.entity.RoleMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    List<Integer> getRoleMenu(@Param("roleId") Integer roleId);
}

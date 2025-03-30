package com.cow.horse.mapper;

import com.cow.horse.entity.Comment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


@Mapper
public interface CommentMapper extends BaseMapper<Comment> {

    List<Comment> findCommentDetail(@Param("productId") Integer productId);
}

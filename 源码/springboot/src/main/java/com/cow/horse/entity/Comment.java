package com.cow.horse.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.util.List;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@TableName("sys_comment")
@ApiModel(value = "Comment对象", description = "")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    private Integer id;

    @ApiModelProperty("内容")
    private String content;

    @ApiModelProperty("评论时间")
    private Integer userId;

    @ApiModelProperty("用户id")
    private String time;

    @ApiModelProperty("父id")
    private Integer pid;

    @ApiModelProperty("祖宗id")
    private Integer ancestorsId;

    @ApiModelProperty("商品id")
    private Integer productId;

    @TableField(exist = false)
    private String nickname;

    @TableField(exist = false)
    private String avatarUrl;

    @TableField(exist = false)
    private List<Comment> children;

    private String pUserName; //父节点用户名字

    @TableField(exist = false)
    private Integer pUserId;   //父节点用户Id

    @TableField(exist = false)
    private Integer orderId;   //订单id
}

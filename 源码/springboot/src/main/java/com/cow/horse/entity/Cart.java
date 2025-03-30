package com.cow.horse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@TableName("sys_cart")
@ApiModel(value = "Cart对象", description = "")
public class Cart implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("商品id")
    private Integer productId;

    @ApiModelProperty("用户id")
    private Integer userId;

    @ApiModelProperty("商品数量")
    private Integer num;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("修改时间")
    private LocalDateTime updateTime;

    @TableField(exist = false)
    private String productName;

    @TableField(exist = false)
    private String productUrl;

    @TableField(exist = false)
    private BigDecimal productPrice;

    @TableField(exist = false)
    private String username;

    @TableField(exist = false)
    private String nickname;

    @TableField(exist = false)
    private String store;
}

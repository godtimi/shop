package com.cow.horse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@TableName("sys_examine")
@ApiModel(value = "Examine对象", description = "")
public class Examine implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("订单id")
    private Integer orderId;

    @ApiModelProperty("审核状态")
    private String passno;

    @ApiModelProperty("原因")
    private String reason;

    @ApiModelProperty("用户id")
    private Integer userId;

    @ApiModelProperty("商品状态")
    private String itemStatus;

    @ApiModelProperty("用户申请内容")
    private String operation;

    @TableField(exist = false)
    private String userName;

    @TableField(exist = false)
    private String orderNo;
}

package com.cow.horse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;


@Getter
@Setter
@TableName("sys_orders")
@ApiModel(value = "Orders对象", description = "")
public class Orders implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("用户id")
    private Integer userId;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("编号")
    private String no;

    @ApiModelProperty("总金额")
    private BigDecimal allPrice;

    @ApiModelProperty("状态")
    private Integer state;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty("下单时间")
    private LocalDateTime createTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty("付款时间")
    private String payTime;

    @TableField(exist = false)
    private List<Cart> carts;

    @TableField(exist = false)
    private String username;

    @TableField(exist = false)
    private String nickname;

    @TableField(exist = false)
    private String stateName;

    @TableField(exist = false)
    private Integer num;

    @TableField(exist = false)
    private Integer productId;


    @ApiModelProperty("订单是否删除")
    private Boolean isDelete;

    @ApiModelProperty("订单是否取消")
    private Boolean isCancel;

    @ApiModelProperty("支付宝交易号")
    private String alipayNo;

    @ApiModelProperty("收货时间")
    private String deliveryTime;


    @ApiModelProperty("收货地址")
    private String address;

    @ApiModelProperty("收货电话")
    private String phone;

    @ApiModelProperty("收货姓名")
    private String fullName;

    @TableField(exist = false)
    private Integer receivingId;
}

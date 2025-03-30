package com.cow.horse.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;
import java.time.LocalDateTime;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@TableName("sys_product_params")
@ApiModel(value = "ProductParams对象", description = "")
public class ProductParams implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("商品id")
    private Integer productId;

    @ApiModelProperty("产地")
    private String productAddress;

    @ApiModelProperty("保质期")
    private String productPeriod;

    @ApiModelProperty("品牌名")
    private String brand;

    @ApiModelProperty("规格重量")
    private Double weight;

    @ApiModelProperty("生产厂名")
    private String factoryName;

    @ApiModelProperty("生产厂址")
    private String factorAddress;

    @ApiModelProperty("包装方式")
    private String packagingMethod;

    @ApiModelProperty("存储方式")
    private String stroageMethod;

    @ApiModelProperty("食用方法")
    private String eatMethod;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;


}

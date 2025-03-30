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
@TableName("sys_product")
@ApiModel(value = "Product对象", description = "")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("商品名称")
    private String name;

    @ApiModelProperty("库存")
    private Integer store;

    @ApiModelProperty("销量")
    private Integer soldNum;

    @ApiModelProperty("价格")
    private BigDecimal sellPrice;

    @ApiModelProperty("商品图片")
    private String url;

    @ApiModelProperty("描述")
    private String description;

    @ApiModelProperty("单位")
    private String unit;

    @ApiModelProperty("是否上架")
    private Boolean putOnTheShelf;

    @ApiModelProperty("是否删除商品")
    private Boolean isDelete;

    @ApiModelProperty("是否每日推荐")
    private Boolean isDaily;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("更新时间")
    private LocalDateTime updateTime;

    @TableField(exist = false)
    private Integer num;

    @ApiModelProperty("商品种类")
    private Integer classificationId;

    @ApiModelProperty("视频地址")
    private String video;

    @TableField(exist = false)
    private String classificationName;

    @ApiModelProperty("发货地点")
    private String city;
}

package com.cow.horse.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@TableName("sys_live")
@ApiModel(value = "Live对象", description = "")
public class Live implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("直播id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("直播名称")
    private String name;

    @ApiModelProperty("直播封面")
    private String url;

    @ApiModelProperty("描述")
    private String info;

    @ApiModelProperty("用户头像地址")
    private String userUrl;

    @ApiModelProperty("直播地址")
    private String liveUrl;
}

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
  @TableName("sys_receiving")
@ApiModel(value = "Receiving对象", description = "")
public class Receiving implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        @TableId(value = "id", type = IdType.AUTO)
      private Integer id;

      @ApiModelProperty("用户id")
      private Integer userId;

      @ApiModelProperty("电话")
      private String phone;

      @ApiModelProperty("收货地址")
      private String address;

      @ApiModelProperty("收货人姓名")
      private String username;

      @ApiModelProperty("备注")
      private String info;


}

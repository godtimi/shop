package com.cow.horse.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
  @TableName("sys_orders_product")
@ApiModel(value = "OrdersProduct对象", description = "")
public class OrdersProduct implements Serializable {

    private static final long serialVersionUID = 1L;

      @ApiModelProperty("id")
        private Integer id;

      @ApiModelProperty("订单id")
      private Integer orderId;

      @ApiModelProperty("商品id")
      private Integer productId;

      @ApiModelProperty("商品数量")
      private Integer num;


}

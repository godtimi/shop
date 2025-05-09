package com.cow.horse.entity;

import cn.hutool.core.annotation.Alias;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.io.Serializable;
import java.util.Date;


@Getter
@Setter
//无参构造
@NoArgsConstructor
//有参构造
@AllArgsConstructor
@TableName("sys_user")
@ApiModel(value = "User对象", description = "")
@ToString
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    //Alias() 导入导出设置别名   @ApiModelProperty swagger
    @Alias("id")
    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    @Alias("用户名")
    @ApiModelProperty("用户名")
    private String username;
    @JsonIgnore
    @Alias("密码")
    @ApiModelProperty("密码")
    private String password;
    @Alias("昵称")
    @ApiModelProperty("昵称")
    private String nickname;
    @Alias("邮箱")
    @ApiModelProperty("邮箱")
    private String email;
    @Alias("电话")
    @ApiModelProperty("电话")
    private String phone;
    @Alias("地址")
    @ApiModelProperty("地址")
    private String address;
    @Alias("创建时间")
    @ApiModelProperty("创建时间")
    private Date createTime;

    @Alias("头像")
    @ApiModelProperty("头像")
    private String avatarUrl;

    @Alias("角色")
    @ApiModelProperty("角色")
    private String role;
}

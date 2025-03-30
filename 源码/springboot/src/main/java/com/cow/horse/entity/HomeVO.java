package com.cow.horse.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomeVO {

    private Double sale;

    private Long userCount;

    private Integer saleCount;

}

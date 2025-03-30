package com.cow.horse.entity;

import lombok.Data;

import java.util.List;

@Data
public class AnalysisVO {

    private List<String> xAxis;

    private List<Series> series;

}

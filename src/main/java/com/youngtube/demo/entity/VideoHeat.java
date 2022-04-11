package com.youngtube.demo.entity;

import lombok.Builder;
import lombok.Data;

@Data
public class VideoHeat {
    private int videoId;
    private int categoryId;
    private double dayHeat;
    private double weekHeat;
    private double yearHeat;
    private double cityHeat;
    private double totalHeat;
}

package com.hotel.services;

import java.time.LocalDate;
import java.util.List;

public interface StatsService {
    List<Object[]> getRevenueByMonth(int year);
//    double getOccupancyRate(LocalDate date);
}

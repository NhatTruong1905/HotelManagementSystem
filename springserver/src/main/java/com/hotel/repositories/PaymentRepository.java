package com.hotel.repositories;

import com.hotel.entity.Payment;

import java.util.List;

public interface PaymentRepository {
    List<Payment> getAllPayments();
}

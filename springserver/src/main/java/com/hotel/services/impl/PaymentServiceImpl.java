package com.hotel.services.impl;

import com.hotel.entity.Payment;
import com.hotel.repositories.PaymentRepository;
import com.hotel.services.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    @Override
    public List<Payment> getAllPayments() {
        return paymentRepository.getAllPayments();
    }
}

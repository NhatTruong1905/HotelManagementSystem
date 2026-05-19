package com.hotel.repositories.impl;

import com.hotel.entity.Payment;
import com.hotel.repositories.PaymentRepository;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class PaymentRepositoryImpl implements PaymentRepository {
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Payment> getAllPayments() {
        Session session = factory.getObject().getCurrentSession();

        return session.createQuery("FROM Payment", Payment.class).getResultList();
    }
}

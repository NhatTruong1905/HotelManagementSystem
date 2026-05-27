package com.hotel.repositories.impl;

import com.hotel.entity.Booking;
import com.hotel.entity.BookingRoom;
import com.hotel.entity.Payment;
import com.hotel.repositories.StatsRepository;
import jakarta.persistence.criteria.*;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@Repository
@Transactional
public class StatsRepositoryImpl implements StatsRepository {
    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Object[]> getRevenueByMonth(int year) {
        Session session = factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root<Payment> root = query.from(Payment.class);

        Expression<Integer> monthExpr = builder.function("MONTH", Integer.class, root.get("createdAt"));
        Expression<Integer> yearExpr = builder.function("YEAR", Integer.class, root.get("createdAt"));

        query.multiselect(monthExpr, builder.sum(root.get("amount")));

        Predicate pStatus = builder.equal(root.get("status"), "COMPLETED");
        Predicate pYear = builder.equal(yearExpr, year);
        query.where(builder.and(pStatus, pYear));

        query.groupBy(monthExpr);
        query.orderBy(builder.asc(monthExpr));

        return session.createQuery(query).getResultList();
    }

    @Override
    public List<Object[]> getRevenueByQuarter(int year) {
        Session session = factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root<Payment> root = query.from(Payment.class);

        Expression<Integer> quarterExpr = builder.function("QUARTER", Integer.class, root.get("createdAt"));
        Expression<Integer> yearExpr = builder.function("YEAR", Integer.class, root.get("createdAt"));

        query.multiselect(quarterExpr, builder.sum(root.get("amount")));

        Predicate pStatus = builder.equal(root.get("status"), "COMPLETED");
        Predicate pYear = builder.equal(yearExpr, year);
        query.where(builder.and(pStatus, pYear));

        query.groupBy(quarterExpr);
        query.orderBy(builder.asc(quarterExpr));

        return session.createQuery(query).getResultList();
    }

    @Override
    public List<Object[]> getRevenueByYear() {
        Session session = factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Object[]> query = builder.createQuery(Object[].class);

        Root<Payment> root = query.from(Payment.class);

        Expression<Integer> yearExpr = builder.function("YEAR", Integer.class, root.get("createdAt"));

        query.multiselect(yearExpr, builder.sum(root.get("amount")));

        Predicate pStatus = builder.equal(root.get("status"), "COMPLETED");
        query.where(pStatus);

        query.groupBy(yearExpr);
        query.orderBy(builder.desc(yearExpr));

        return session.createQuery(query).getResultList();
    }

    @Override
    public long getOccupiedRoomsCount(LocalDate date) {
        Session session = factory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Long> query = builder.createQuery(Long.class);


        Root<BookingRoom> root = query.from(BookingRoom.class);
        Join<BookingRoom, Booking> bookingJoin = root.join("booking");

        query.select(builder.count(root.get("id")));

        Predicate pStatus = bookingJoin.get("status").in(Arrays.asList("CONFIRMED", "CHECKED_IN"));
        Predicate pCheckIn = builder.lessThanOrEqualTo(bookingJoin.get("expectedCheckIn"), date);
        Predicate pCheckOut = builder.greaterThan(bookingJoin.get("expectedCheckOut"), date);

        query.where(builder.and(pStatus, pCheckIn, pCheckOut));

        Long count = session.createQuery(query).uniqueResult();
        return count != null ? count : 0L;
    }
}

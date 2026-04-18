package com.hotel.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.Instant;
import java.time.LocalDate;

@Entity
@Table(name = "booking")
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @Column(name = "expected_check_in", nullable = false)
    private LocalDate expectedCheckIn;

    @Column(name = "expected_check_out", nullable = false)
    private LocalDate expectedCheckOut;

    @Column(name = "actual_check_in")
    private Instant actualCheckIn;

    @Column(name = "actual_check_out")
    private Instant actualCheckOut;

    @ColumnDefault("0.00")
    @Column(name = "total_amount", precision = 15, scale = 2)
    private BigDecimal totalAmount;

    @Lob
    @Column(name = "special_request")
    private String specialRequest;

    @ColumnDefault("'PENDING'")
    @Lob
    @Column(name = "status")
    private String status;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "created_at")
    private Instant createdAt;

    @ColumnDefault("CURRENT_TIMESTAMP")
    @Column(name = "updated_at")
    private Instant updatedAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public LocalDate getExpectedCheckIn() {
        return expectedCheckIn;
    }

    public void setExpectedCheckIn(LocalDate expectedCheckIn) {
        this.expectedCheckIn = expectedCheckIn;
    }

    public LocalDate getExpectedCheckOut() {
        return expectedCheckOut;
    }

    public void setExpectedCheckOut(LocalDate expectedCheckOut) {
        this.expectedCheckOut = expectedCheckOut;
    }

    public Instant getActualCheckIn() {
        return actualCheckIn;
    }

    public void setActualCheckIn(Instant actualCheckIn) {
        this.actualCheckIn = actualCheckIn;
    }

    public Instant getActualCheckOut() {
        return actualCheckOut;
    }

    public void setActualCheckOut(Instant actualCheckOut) {
        this.actualCheckOut = actualCheckOut;
    }

    public BigDecimal getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(BigDecimal totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSpecialRequest() {
        return specialRequest;
    }

    public void setSpecialRequest(String specialRequest) {
        this.specialRequest = specialRequest;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }

}
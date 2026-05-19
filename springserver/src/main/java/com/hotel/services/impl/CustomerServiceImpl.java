package com.hotel.services.impl;

import com.hotel.entity.Customer;
import com.hotel.repositories.CustomerRepository;
import com.hotel.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;


    @Override
    public List<Customer> listCustomer(Map<String, String> params) {
        List<Customer> listCustomer = customerRepository.listCustomer(params);
        return listCustomer;
    }

    @Override
    public long countCustomer(Map<String, String> params) {
        return customerRepository.countCustomer(params);
    }

    @Override
    public void addOrUpdateCustomer(Customer customer) {
        this.customerRepository.addOrUpdateCustomer(customer);
    }

    @Override
    public void deleteCustomer(int id) {
        this.customerRepository.deleteCustomer(id);
    }

    @Override
    public void deleteCustomer(List<Integer> ids) {
        this.customerRepository.deleteCustomer(ids);
    }
}

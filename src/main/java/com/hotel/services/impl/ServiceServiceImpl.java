package com.hotel.services.impl;

import com.hotel.entity.Service;
import com.hotel.repositories.ServiceRepository;
import com.hotel.services.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService {
    @Autowired
    private ServiceRepository serviceRepository;

    @Override
    public List<Service> listService() {
        return this.serviceRepository.listService();
    }
}

package com.hotel.controllers.admin;

import com.hotel.services.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class ServiceController {
    @Autowired
    private ServiceService serviceService;

    @GetMapping("/services")
    public String ServiceView(Model model) {
        model.addAttribute("listService", this.serviceService.listService());
        return "service";
    }
}

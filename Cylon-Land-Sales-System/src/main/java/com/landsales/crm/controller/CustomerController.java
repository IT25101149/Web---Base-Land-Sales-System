package com.landsales.crm.controller;

import com.landsales.crm.entity.Customer;
import com.landsales.crm.service.CustomerService;
import com.landsales.crm.repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/crm")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private InquiryRepository inquiryRepository;

    @GetMapping({"", "/list"})
    public String listCustomers(Model model) {
        model.addAttribute("customers", customerService.getAllCustomers());
        return "crm/list";
    }

    @GetMapping("/inquiries")
    public String listInquiries(Model model) {
        model.addAttribute("inquiries", inquiryRepository.findAll());
        return "crm/inquiries";
    }

    @GetMapping("/add")
    public String addCustomerForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "crm/form";
    }

    @GetMapping("/edit/{id}")
    public String editCustomerForm(@PathVariable("id") Long id, Model model, RedirectAttributes redirectAttributes) {
        Customer customer = customerService.getCustomerById(id);
        if (customer == null) {
            redirectAttributes.addFlashAttribute("errorMsg", "Customer not found with ID: " + id);
            return "redirect:/crm";
        }
        model.addAttribute("customer", customer);
        return "crm/form";
    }

    @PostMapping("/save")
    public String saveCustomer(@ModelAttribute("customer") Customer customer, RedirectAttributes redirectAttributes) {
        try {
            boolean isNew = (customer.getId() == null);
            customerService.saveCustomer(customer);
            redirectAttributes.addFlashAttribute("successMsg", isNew ? "Customer profile registered successfully!" : "Customer #" + customer.getId() + " updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMsg", "Failed to save customer: " + e.getMessage());
        }
        return "redirect:/crm";
    }

    @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        try {
            customerService.deleteCustomer(id);
            redirectAttributes.addFlashAttribute("successMsg", "Customer #" + id + " record deleted successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMsg", "Cannot delete customer #" + id + " because active sales, reservations, or inquiries are linked to them.");
        }
        return "redirect:/crm";
    }
}



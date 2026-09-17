package com.landsales.sales.controller;

import com.landsales.sales.service.SaleService;
import com.landsales.property.service.PropertyService;
import com.landsales.crm.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sales")
public class SaleController {

    @Autowired
    private SaleService saleService;

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private com.landsales.crm.repository.InquiryRepository inquiryRepository;

    @GetMapping({"", "/list"})
    public String listSales(Model model) {
        model.addAttribute("sales", saleService.getAllSales());
        model.addAttribute("inquiries", saleService.getAllInquiries());
        return "sales/list";
    }

    @RequestMapping(value = "/approve-inquiry/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String approveInquiry(@PathVariable("id") Long id, org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        try {
            saleService.approveInquiryAsReservation(id);
            redirectAttributes.addFlashAttribute("reservationSuccess", "Customer Land Reservation request approved successfully! Plot marked as RESERVED.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("reservationError", "Failed to approve reservation: " + e.getMessage());
        }
        return "redirect:/sales";
    }

    @PostMapping("/approve-inquiry")
    public String approveInquiryWithDetails(@RequestParam("inquiryId") Long inquiryId,
                                            @RequestParam(value = "advanceAmount", required = false, defaultValue = "0") Double advanceAmount,
                                            @RequestParam(value = "bankDetails", required = false) String bankDetails,
                                            @RequestParam(value = "salesNotes", required = false) String salesNotes,
                                            org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        try {
            if (advanceAmount == null || advanceAmount <= 0) {
                redirectAttributes.addFlashAttribute("reservationError", "Required advance deposit amount must be greater than zero.");
                return "redirect:/sales";
            }

            if (bankDetails == null || bankDetails.trim().length() < 10) {
                redirectAttributes.addFlashAttribute("reservationError", "Official company bank transfer details are required (minimum 10 characters).");
                return "redirect:/sales";
            }

            com.landsales.crm.entity.Inquiry inq = inquiryRepository.findById(inquiryId).orElse(null);
            if (inq != null && inq.getProperty() != null && inq.getProperty().getPrice() != null) {
                if (advanceAmount > inq.getProperty().getPrice()) {
                    redirectAttributes.addFlashAttribute("reservationError", "Advance deposit cannot exceed total property valuation price (LKR " + String.format("%,.0f", inq.getProperty().getPrice()) + ").");
                    return "redirect:/sales";
                }
            }

            saleService.approveInquiryWithBankDetails(inquiryId, advanceAmount, bankDetails.trim(), salesNotes);
            redirectAttributes.addFlashAttribute("reservationSuccess", "Reservation approved & Bank transfer details dispatched to customer. Waiting for customer payment proof.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("reservationError", "Failed to approve reservation: " + e.getMessage());
        }
        return "redirect:/sales";
    }

    @RequestMapping(value = "/cancel-inquiry/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String cancelInquiry(@PathVariable("id") Long id, org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        try {
            saleService.cancelInquiry(id);
            redirectAttributes.addFlashAttribute("reservationSuccess", "Customer Inquiry #" + id + " cancelled successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("reservationError", "Failed to cancel inquiry: " + e.getMessage());
        }
        return "redirect:/sales";
    }

    @RequestMapping(value = "/confirm-payment/{id}", method = {RequestMethod.GET, RequestMethod.POST})
    public String confirmPaymentAndUnlockLegal(@PathVariable("id") Long id, org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        try {
            saleService.confirmPaymentAndUnlockLegal(id);
            redirectAttributes.addFlashAttribute("reservationSuccess", "Payment verified successfully! Legal Conveyancing & Customer Document Upload unlocked.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("reservationError", "Failed to confirm payment: " + e.getMessage());
        }
        return "redirect:/sales";
    }

    @GetMapping("/cancel-reservation/{id}")
    public String cancelReservation(@PathVariable("id") Long id, org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        try {
            saleService.cancelReservation(id);
            redirectAttributes.addFlashAttribute("reservationSuccess", "Reservation #" + id + " cancelled and property restored to AVAILABLE status.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("reservationError", "Failed to cancel reservation: " + e.getMessage());
        }
        return "redirect:/sales";
    }

    @GetMapping("/reserve")
    public String reservePropertyForm(Model model) {
        model.addAttribute("properties", propertyService.getAllProperties());
        model.addAttribute("customers", customerService.getAllCustomers());
        return "sales/form";
    }

    @PostMapping("/reserve/save")
    public String saveReservation(@RequestParam("propertyId") Long propertyId,
                                  @RequestParam("customerId") Long customerId,
                                  @RequestParam(value = "salePrice", required = false) Double salePrice,
                                  org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        try {
            com.landsales.property.entity.Property prop = propertyService.getPropertyById(propertyId);
            if (prop == null) {
                redirectAttributes.addFlashAttribute("reservationError", "Selected property was not found.");
                return "redirect:/sales/reserve";
            }
            if (!"AVAILABLE".equalsIgnoreCase(prop.getStatus())) {
                redirectAttributes.addFlashAttribute("reservationError", "Property is currently in '" + prop.getStatus() + "' status and cannot be reserved.");
                return "redirect:/sales/reserve";
            }
            if (customerService.getCustomerById(customerId) == null) {
                redirectAttributes.addFlashAttribute("reservationError", "Selected customer profile does not exist.");
                return "redirect:/sales/reserve";
            }
            if (salePrice != null && salePrice <= 0) {
                redirectAttributes.addFlashAttribute("reservationError", "Agreed sale price must be greater than zero.");
                return "redirect:/sales/reserve";
            }

            saleService.createReservation(propertyId, customerId, salePrice);
            redirectAttributes.addFlashAttribute("reservationSuccess", "Reservation created successfully for property '" + prop.getTitle() + "'.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("reservationError", "Failed to reserve plot: " + e.getMessage());
        }
        return "redirect:/sales";
    }

    @GetMapping("/confirm/{id}")
    public String confirmSale(@PathVariable("id") Long id) {
        saleService.confirmSale(id);
        return "redirect:/sales";
    }
}


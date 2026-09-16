package com.landsales.sales.controller;

import com.landsales.sales.entity.Sale;
import com.landsales.sales.service.SaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/sales")
public class SaleController {

    @Autowired
    private SaleService saleService;

    // READ (list) — GET /sales
    @GetMapping
    public String listSales(Model model) {
        model.addAttribute("sales", saleService.findAll());
        return "sales/sale-list"; // -> WEB-INF/views/sales/sale-list.jsp
    }

    // CREATE (show empty form) — GET /sales/new
    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("sale", new Sale());
        model.addAttribute("formAction", "/sales/save");
        return "sales/sale-form"; // -> WEB-INF/views/sales/sale-form.jsp
    }

    // CREATE (submit) — POST /sales/save
    @PostMapping("/save")
    public String saveSale(@ModelAttribute Sale sale) {
        saleService.save(sale);
        return "redirect:/sales";
    }

    // UPDATE (show pre-filled form) — GET /sales/edit/{id}
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("sale", saleService.findById(id));
        model.addAttribute("formAction", "/sales/update/" + id);
        return "sales/sale-form";
    }

    // UPDATE (submit) — POST /sales/update/{id}
    @PostMapping("/update/{id}")
    public String updateSale(@PathVariable Long id, @ModelAttribute Sale sale) {
        saleService.update(id, sale);
        return "redirect:/sales";
    }

    // DELETE — GET /sales/delete/{id}
    @GetMapping("/delete/{id}")
    public String deleteSale(@PathVariable Long id) {
        saleService.delete(id);
        return "redirect:/sales";
    }
}


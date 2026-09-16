package com.landsales.legal.controller;

import com.landsales.legal.service.LegalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/legal")
public class LegalDocumentController {

    @Autowired
    private LegalService legalService;

    @GetMapping({"", "/list"})
    public String listLegalCases(Model model) {
        var cases = legalService.getAllConveyancingCases();
        model.addAttribute("cases", cases);
        return "legal/list";
    }

    @PostMapping("/update-status")
    public String updateCaseStatus(@RequestParam("saleId") Long saleId,
                                   @RequestParam("legalStatus") String legalStatus,
                                   @RequestParam(value = "deedNumber", required = false) String deedNumber,
                                   @RequestParam(value = "notaryName", required = false) String notaryName,
                                   @RequestParam(value = "legalNotes", required = false) String legalNotes,
                                   @RequestParam(value = "transferCertificateUrl", required = false) String transferCertificateUrl,
                                   Authentication authentication,
                                   RedirectAttributes redirectAttributes) {
        try {
            String verifier = authentication != null ? authentication.getName() : "Legal Officer";
            legalService.updateLegalCaseStatus(saleId, legalStatus, deedNumber, notaryName, legalNotes, transferCertificateUrl, verifier);
            redirectAttributes.addFlashAttribute("legalSuccess", "Legal case status updated successfully to: " + legalStatus);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("legalError", "Failed to update legal case: " + e.getMessage());
        }
        return "redirect:/legal";
    }

    @PostMapping("/reject-docs")
    public String rejectBuyerDocuments(@RequestParam("saleId") Long saleId,
                                       @RequestParam("rejectionMessage") String rejectionMessage,
                                       Authentication authentication,
                                       RedirectAttributes redirectAttributes) {
        try {
            String verifier = authentication != null ? authentication.getName() : "Legal Officer";
            legalService.rejectBuyerDocumentation(saleId, rejectionMessage, verifier);
            redirectAttributes.addFlashAttribute("legalSuccess", "Document issue notice & rejection sent to customer! Case status set to DOCS_REJECTED.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("legalError", "Failed to reject documents: " + e.getMessage());
        }
        return "redirect:/legal";
    }

    @PostMapping("/add-document")
    public String addDocument(@RequestParam("saleId") Long saleId,
                              @RequestParam("documentType") String documentType,
                              @RequestParam("documentName") String documentName,
                              @RequestParam("documentUrl") String documentUrl,
                              @RequestParam(value = "remarks", required = false) String remarks,
                              RedirectAttributes redirectAttributes) {
        try {
            legalService.addLegalDocument(saleId, documentType, documentName, documentUrl, remarks);
            redirectAttributes.addFlashAttribute("legalSuccess", "Legal document attached successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("legalError", "Failed to attach document: " + e.getMessage());
        }
        return "redirect:/legal";
    }
}

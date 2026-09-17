package com.landsales.survey.controller;

import com.landsales.survey.entity.Survey;
import com.landsales.survey.service.SurveyService;
import com.landsales.property.service.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/survey")
public class SurveyController {

    @Autowired
    private SurveyService surveyService;

    @Autowired
    private PropertyService propertyService;

    @Autowired
    private com.landsales.admin.service.AuditLogService auditLogService;

    @GetMapping({"", "/list"})
    public String listSurveys(Model model, org.springframework.security.core.Authentication authentication) {
        boolean isSurveyor = authentication != null && authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_SURVEY") || a.getAuthority().equals("ROLE_ADMIN"));
        if (!isSurveyor) {
            return "redirect:/property";
        }

        List<Survey> surveys = surveyService.getAllSurveys();
        List<com.landsales.property.entity.Property> properties = propertyService.getAllProperties();

        // Check if any property with PENDING_SURVEY does not have a survey yet, auto-queue it
        for (com.landsales.property.entity.Property p : properties) {
            if ("PENDING_SURVEY".equalsIgnoreCase(p.getStatus())) {
                surveyService.createPendingSurveyForProperty(p);
            }
        }
        // Re-fetch in case any pending surveys were created
        surveys = surveyService.getAllSurveys();

        long totalSurveys = surveys.size();
        long approvedSurveys = surveys.stream()
                .filter(s -> "APPROVED".equalsIgnoreCase(s.getStatus()) || "COMPLETED".equalsIgnoreCase(s.getStatus()))
                .count();
        long inProgressSurveys = surveys.stream()
                .filter(s -> "IN_PROGRESS".equalsIgnoreCase(s.getStatus()) || "PENDING_INSPECTION".equalsIgnoreCase(s.getStatus()) || "PENDING".equalsIgnoreCase(s.getStatus()))
                .count();
        double totalValuation = surveys.stream()
                .filter(s -> "APPROVED".equalsIgnoreCase(s.getStatus()) || "COMPLETED".equalsIgnoreCase(s.getStatus()))
                .mapToDouble(s -> s.getValuationAmount() != null ? s.getValuationAmount() : 0.0)
                .sum();

        List<Survey> pendingList = surveys.stream()
                .filter(s -> !"APPROVED".equalsIgnoreCase(s.getStatus()) && !"COMPLETED".equalsIgnoreCase(s.getStatus()))
                .toList();

        List<Survey> certifiedList = surveys.stream()
                .filter(s -> "APPROVED".equalsIgnoreCase(s.getStatus()) || "COMPLETED".equalsIgnoreCase(s.getStatus()))
                .toList();


        model.addAttribute("surveys", surveys);
        model.addAttribute("pendingSurveysList", pendingList);
        model.addAttribute("certifiedSurveysList", certifiedList);
        model.addAttribute("properties", properties);
        model.addAttribute("totalSurveys", totalSurveys);
        model.addAttribute("approvedSurveys", approvedSurveys);
        model.addAttribute("inProgressSurveys", inProgressSurveys);
        model.addAttribute("totalValuation", totalValuation);
        model.addAttribute("isSurveyor", isSurveyor);

        return "survey/list";
    }

    @PostMapping("/approve")
    public String approveSurvey(@RequestParam("surveyId") Long surveyId,
                                @RequestParam(value = "planNumber", required = false) String planNumber,
                                @RequestParam(value = "lotNumber", required = false) String lotNumber,
                                @RequestParam(value = "certifiedExtent", required = false) Double certifiedExtent,
                                @RequestParam(value = "valuationAmount", required = false) Double valuationAmount,
                                @RequestParam(value = "surveyorName", required = false) String surveyorName,
                                @RequestParam(value = "remarks", required = false) String remarks,
                                org.springframework.security.core.Authentication authentication,
                                RedirectAttributes redirectAttributes) {
        boolean isSurveyor = authentication != null && authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_SURVEY") || a.getAuthority().equals("ROLE_ADMIN"));
        if (!isSurveyor) {
            redirectAttributes.addFlashAttribute("surveyError", "Access Denied: Property Managers have Read-Only view of Surveys. Official certification, plan submission, and deletions are restricted to Licensed Surveyors.");
            return "redirect:/survey";
        }

        try {
            if (planNumber == null || planNumber.trim().length() < 3) {
                redirectAttributes.addFlashAttribute("surveyError", "Cadastral plan number is required (minimum 3 characters, e.g. PP/WP/2026/84).");
                return "redirect:/survey";
            }
            if (lotNumber == null || lotNumber.trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("surveyError", "Lot number is required (e.g. Lot 05B).");
                return "redirect:/survey";
            }
            if (certifiedExtent == null || certifiedExtent <= 0.0) {
                redirectAttributes.addFlashAttribute("surveyError", "Certified extent must be greater than zero perches.");
                return "redirect:/survey";
            }
            if (valuationAmount == null || valuationAmount <= 0.0) {
                redirectAttributes.addFlashAttribute("surveyError", "Official valuation amount must be greater than zero.");
                return "redirect:/survey";
            }
            if (surveyorName == null || surveyorName.trim().length() < 3) {
                redirectAttributes.addFlashAttribute("surveyError", "Licensed surveyor name is required (minimum 3 characters).");
                return "redirect:/survey";
            }

            Survey s = surveyService.approveAndCertifySurvey(surveyId, planNumber.trim(), lotNumber.trim(), certifiedExtent, valuationAmount, surveyorName.trim(), remarks);
            if (s != null && s.getProperty() != null) {
                auditLogService.log("CERTIFY_SURVEY", "SURVEY", "Certified Cadastral Survey Plan '" + planNumber + "' (Lot " + lotNumber + ", " + certifiedExtent + " Perches, Val: LKR " + String.format("%,.0f", valuationAmount != null ? valuationAmount : 0.0) + ") for plot '" + s.getProperty().getTitle() + "'. Plot activated to AVAILABLE.");
                redirectAttributes.addFlashAttribute("surveySuccess", "Cadastral Survey for '" + s.getProperty().getTitle() + "' successfully approved & certified! The property is now ACTIVE and available for public sale.");
            } else {
                auditLogService.log("CERTIFY_SURVEY", "SURVEY", "Certified survey plan #" + surveyId + " successfully.");
                redirectAttributes.addFlashAttribute("surveySuccess", "Survey plan certified and approved successfully!");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("surveyError", "Failed to approve survey: " + e.getMessage());
        }
        return "redirect:/survey";
    }

    @PostMapping("/save")
    public String saveSurvey(@ModelAttribute Survey survey,
                             @RequestParam(value = "propertyId", required = false) Long propertyId,
                             @RequestParam(value = "surveyDateStr", required = false) String surveyDateStr,
                             org.springframework.security.core.Authentication authentication,
                             RedirectAttributes redirectAttributes) {
        boolean isSurveyor = authentication != null && authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_SURVEY") || a.getAuthority().equals("ROLE_ADMIN"));
        if (!isSurveyor) {
            redirectAttributes.addFlashAttribute("surveyError", "Access Denied: Property Managers have Read-Only view of Surveys. Official certification, plan submission, and deletions are restricted to Licensed Surveyors.");
            return "redirect:/survey";
        }

        try {
            if (survey.getSurveyNumber() == null || survey.getSurveyNumber().trim().length() < 3) {
                redirectAttributes.addFlashAttribute("surveyError", "Survey Number is required (minimum 3 characters).");
                return "redirect:/survey";
            }

            if (propertyId == null) {
                redirectAttributes.addFlashAttribute("surveyError", "Please select an associated land plot for this survey.");
                return "redirect:/survey";
            }
            com.landsales.property.entity.Property prop = propertyService.getPropertyById(propertyId);
            if (prop == null) {
                redirectAttributes.addFlashAttribute("surveyError", "Selected land plot was not found.");
                return "redirect:/survey";
            }
            survey.setProperty(prop);

            if (survey.getValuationAmount() != null && survey.getValuationAmount() <= 0.0) {
                redirectAttributes.addFlashAttribute("surveyError", "Valuation amount must be greater than zero.");
                return "redirect:/survey";
            }

            if (survey.getSurveyorName() == null || survey.getSurveyorName().trim().length() < 3) {
                redirectAttributes.addFlashAttribute("surveyError", "Licensed surveyor name is required (minimum 3 characters).");
                return "redirect:/survey";
            }

            if (surveyDateStr != null && !surveyDateStr.trim().isEmpty()) {
                survey.setSurveyDate(LocalDate.parse(surveyDateStr.trim()));
            } else if (survey.getSurveyDate() == null) {
                survey.setSurveyDate(LocalDate.now());
            }

            surveyService.saveSurvey(survey);
            auditLogService.log("SAVE_SURVEY", "SURVEY", "Registered/Updated Cadastral Survey Plan " + survey.getPlanNumber() + " (" + survey.getSurveyNumber() + ") by " + survey.getSurveyorName());
            redirectAttributes.addFlashAttribute("surveySuccess", "Survey & Valuation report for " + survey.getSurveyNumber() + " saved successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("surveyError", "Failed to save survey: " + e.getMessage());
        }
        return "redirect:/survey";
    }

    @GetMapping("/delete/{id}")
    public String deleteSurvey(@PathVariable("id") Long id,
                               org.springframework.security.core.Authentication authentication,
                               RedirectAttributes redirectAttributes) {
        boolean isSurveyor = authentication != null && authentication.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_SURVEY") || a.getAuthority().equals("ROLE_ADMIN"));
        if (!isSurveyor) {
            redirectAttributes.addFlashAttribute("surveyError", "Access Denied: Property Managers have Read-Only view of Surveys. Official certification, plan submission, and deletions are restricted to Licensed Surveyors.");
            return "redirect:/survey";
        }

        try {
            surveyService.deleteSurvey(id);
            auditLogService.log("DELETE_SURVEY", "SURVEY", "Deleted Cadastral Survey record #" + id);
            redirectAttributes.addFlashAttribute("surveySuccess", "Survey record #" + id + " deleted successfully.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("surveyError", "Failed to delete survey: " + e.getMessage());
        }
        return "redirect:/survey";
    }

    @GetMapping("/api/{id}")
    @ResponseBody
    public Map<String, Object> getSurveyJson(@PathVariable("id") Long id) {
        Survey s = surveyService.getSurveyById(id);
        Map<String, Object> data = new HashMap<>();
        if (s != null) {
            data.put("id", s.getId());
            data.put("surveyNumber", s.getSurveyNumber());
            data.put("surveyorName", s.getSurveyorName());
            data.put("surveyDate", s.getSurveyDate() != null ? s.getSurveyDate().toString() : "");
            data.put("planNumber", s.getPlanNumber());
            data.put("lotNumber", s.getLotNumber());
            data.put("landExtent", s.getLandExtent());
            data.put("northBoundary", s.getNorthBoundary());
            data.put("southBoundary", s.getSouthBoundary());
            data.put("eastBoundary", s.getEastBoundary());
            data.put("westBoundary", s.getWestBoundary());
            data.put("valuationAmount", s.getValuationAmount());
            data.put("governmentValuation", s.getGovernmentValuation());
            data.put("topography", s.getTopography());
            data.put("accessRoadWidth", s.getAccessRoadWidth());
            data.put("utilitiesStatus", s.getUtilitiesStatus());
            data.put("status", s.getStatus());
            data.put("surveyPlanUrl", s.getSurveyPlanUrl());
            data.put("remarks", s.getRemarks());
            if (s.getProperty() != null) {
                data.put("propertyId", s.getProperty().getId());
                data.put("propertyTitle", s.getProperty().getTitle());
                data.put("propertyLocation", s.getProperty().getLocation());
                data.put("propertyPrice", s.getProperty().getPrice());
            }
        }
        return data;
    }
}


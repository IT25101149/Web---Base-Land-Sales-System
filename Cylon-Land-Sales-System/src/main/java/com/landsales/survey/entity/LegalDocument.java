package com.landsales.legal.entity;

import jakarta.persistence.*;
import com.landsales.sales.entity.Sale;
import com.landsales.property.entity.Property;
import java.time.LocalDateTime;

@Entity
public class LegalDocument {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "sale_id")
    private Sale sale;

    @ManyToOne
    @JoinColumn(name = "property_id")
    private Property property;

    private String documentType; // BUYER_NIC, ADDRESS_PROOF, TITLE_DEED, SURVEY_PLAN, DEED_OF_TRANSFER
    private String documentName;

    @Column(length = 2000)
    private String documentUrl;

    private String status; // PENDING_VERIFICATION, VERIFIED, REJECTED
    private LocalDateTime uploadedAt;
    private String verifiedBy;

    @Column(length = 1000)
    private String remarks;

    public LegalDocument() {
        this.uploadedAt = LocalDateTime.now();
        this.status = "PENDING_VERIFICATION";
    }

    public LegalDocument(Sale sale, Property property, String documentType, String documentName, String documentUrl, String remarks) {
        this.sale = sale;
        this.property = property;
        this.documentType = documentType;
        this.documentName = documentName;
        this.documentUrl = documentUrl;
        this.status = "PENDING_VERIFICATION";
        this.uploadedAt = LocalDateTime.now();
        this.remarks = remarks;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Sale getSale() { return sale; }
    public void setSale(Sale sale) { this.sale = sale; }
    public Property getProperty() { return property; }
    public void setProperty(Property property) { this.property = property; }
    public String getDocumentType() { return documentType; }
    public void setDocumentType(String documentType) { this.documentType = documentType; }
    public String getDocumentName() { return documentName; }
    public void setDocumentName(String documentName) { this.documentName = documentName; }
    public String getDocumentUrl() { return documentUrl; }
    public void setDocumentUrl(String documentUrl) { this.documentUrl = documentUrl; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public LocalDateTime getUploadedAt() { return uploadedAt; }
    public void setUploadedAt(LocalDateTime uploadedAt) { this.uploadedAt = uploadedAt; }
    public String getVerifiedBy() { return verifiedBy; }
    public void setVerifiedBy(String verifiedBy) { this.verifiedBy = verifiedBy; }
    public String getRemarks() { return remarks; }
    public void setRemarks(String remarks) { this.remarks = remarks; }
}

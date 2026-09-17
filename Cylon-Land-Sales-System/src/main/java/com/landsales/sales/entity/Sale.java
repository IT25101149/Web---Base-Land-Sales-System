package com.landsales.sales.entity;

import jakarta.persistence.*;
import com.landsales.property.entity.Property;
import com.landsales.crm.entity.Customer;
import java.time.LocalDate;

@Entity
public class Sale {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "property_id")
    private Property property;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    private Double salePrice;
    private Double advancePaid;
    private Double balanceAmount;
    private LocalDate saleDate;

    // Overall Sale/Reservation Status: PENDING_RESERVATION, RESERVED, COMPLETED, CANCELLED
    private String status;

    // Payment Status: PENDING, ADVANCE_PAID, FULLY_PAID
    private String paymentStatus;

    @Column(length = 1000)
    private String salesNotes;

    // Buyer KYC / Deed Registration Info
    private String buyerFullName;
    private String buyerNic;
    @Column(length = 2000)
    private String nicImageUrl;
    @Column(length = 2000)
    private String addressProofUrl;

    // Payment details & Bank Info
    @Column(length = 1000)
    private String bankDetails;
    private String paymentReference;
    @Column(length = 2000)
    private String paymentSlipUrl;

    // Legal & Deed Conveyancing Status
    // PENDING_DOCS, DOCS_SUBMITTED, TITLE_CLEARED, DEED_DRAFTED, READY_TO_SIGN, OWNERSHIP_TRANSFERRED
    private String legalStatus;
    private String deedNumber;
    private String notaryName;
    @Column(length = 1000)
    private String legalNotes;
    @Column(length = 2000)
    private String transferCertificateUrl;
    @Column(length = 100)
    private String paymentApprovedBy;
    private java.time.LocalDateTime paymentApprovedAt;

    public Sale() {}

    public Sale(Long id, Property property, Customer customer, Double salePrice, LocalDate saleDate, String status, String paymentStatus) {
        this.id = id;
        this.property = property;
        this.customer = customer;
        this.salePrice = salePrice;
        this.saleDate = saleDate;
        this.status = status;
        this.paymentStatus = paymentStatus;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Property getProperty() { return property; }
    public void setProperty(Property property) { this.property = property; }
    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }
    public Double getSalePrice() { return salePrice; }
    public void setSalePrice(Double salePrice) { this.salePrice = salePrice; }
    public Double getAdvancePaid() { return advancePaid; }
    public void setAdvancePaid(Double advancePaid) { this.advancePaid = advancePaid; }
    public Double getBalanceAmount() { return balanceAmount; }
    public void setBalanceAmount(Double balanceAmount) { this.balanceAmount = balanceAmount; }
    public LocalDate getSaleDate() { return saleDate; }
    public void setSaleDate(LocalDate saleDate) { this.saleDate = saleDate; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
    public String getSalesNotes() { return salesNotes; }
    public void setSalesNotes(String salesNotes) { this.salesNotes = salesNotes; }
    public String getBuyerFullName() { return buyerFullName; }
    public void setBuyerFullName(String buyerFullName) { this.buyerFullName = buyerFullName; }
    public String getBuyerNic() { return buyerNic; }
    public void setBuyerNic(String buyerNic) { this.buyerNic = buyerNic; }
    public String getNicImageUrl() { return nicImageUrl; }
    public void setNicImageUrl(String nicImageUrl) { this.nicImageUrl = nicImageUrl; }
    public String getAddressProofUrl() { return addressProofUrl; }
    public void setAddressProofUrl(String addressProofUrl) { this.addressProofUrl = addressProofUrl; }
    public String getBankDetails() { return bankDetails; }
    public void setBankDetails(String bankDetails) { this.bankDetails = bankDetails; }
    public String getPaymentReference() { return paymentReference; }
    public void setPaymentReference(String paymentReference) { this.paymentReference = paymentReference; }
    public String getPaymentSlipUrl() { return paymentSlipUrl; }
    public void setPaymentSlipUrl(String paymentSlipUrl) { this.paymentSlipUrl = paymentSlipUrl; }
    public String getLegalStatus() { return legalStatus; }
    public void setLegalStatus(String legalStatus) { this.legalStatus = legalStatus; }
    public String getDeedNumber() { return deedNumber; }
    public void setDeedNumber(String deedNumber) { this.deedNumber = deedNumber; }
    public String getNotaryName() { return notaryName; }
    public void setNotaryName(String notaryName) { this.notaryName = notaryName; }
    public String getLegalNotes() { return legalNotes; }
    public void setLegalNotes(String legalNotes) { this.legalNotes = legalNotes; }
    public String getTransferCertificateUrl() { return transferCertificateUrl; }
    public void setTransferCertificateUrl(String transferCertificateUrl) { this.transferCertificateUrl = transferCertificateUrl; }
    public String getPaymentApprovedBy() { return paymentApprovedBy; }
    public void setPaymentApprovedBy(String paymentApprovedBy) { this.paymentApprovedBy = paymentApprovedBy; }
    public java.time.LocalDateTime getPaymentApprovedAt() { return paymentApprovedAt; }
    public void setPaymentApprovedAt(java.time.LocalDateTime paymentApprovedAt) { this.paymentApprovedAt = paymentApprovedAt; }
}

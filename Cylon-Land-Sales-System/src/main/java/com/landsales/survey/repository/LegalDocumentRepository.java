package com.landsales.legal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.landsales.legal.entity.LegalDocument;
import java.util.List;

public interface LegalDocumentRepository extends JpaRepository<LegalDocument, Long> {
    List<LegalDocument> findBySaleIdOrderByUploadedAtDesc(Long saleId);
    List<LegalDocument> findByPropertyIdOrderByUploadedAtDesc(Long propertyId);
}

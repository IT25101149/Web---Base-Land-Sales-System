package com.landsales.property.service;

import com.landsales.property.entity.Property;
import com.landsales.property.repository.PropertyRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PropertyService {

    @Autowired
    private PropertyRepository propertyRepository;

    @Autowired(required = false)
    private com.landsales.survey.repository.SurveyRepository surveyRepository;

    @Autowired(required = false)
    private com.landsales.sales.repository.SaleRepository saleRepository;

    @Autowired(required = false)
    private com.landsales.legal.repository.LegalDocumentRepository legalDocumentRepository;

    @Autowired(required = false)
    private com.landsales.crm.repository.InquiryRepository inquiryRepository;

    @Autowired(required = false)
    private com.landsales.crm.repository.PropertyReviewRepository propertyReviewRepository;

    @Autowired(required = false)
    private com.landsales.crm.repository.WishlistRepository wishlistRepository;

    @PostConstruct
    public void initData() {
        // Ensure baseline properties exist for a complete 3x3 showcase
        ensureProperty("Viona Prime Plots - Attidiya", "Rathmalana", 8.0, 3850000.0,
                "Ultra-prime bare land plots in Aththidiya - Rathmalana with 3-phase electricity, pipe-borne water, and 30ft carpeted access roads.",
                "AVAILABLE", "https://images.unsplash.com/photo-1500076656116-558758c991c1?w=800&auto=format&fit=crop&q=80", "RESIDENTIAL");

        ensureProperty("Golden Rock Commercial Lands - Dambulla", "Dambulla", 20.0, 380000.0,
                "Commercial & tourism bare land plots bordering Dambulla municipal limits with direct main road frontage.",
                "AVAILABLE", "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?w=800&auto=format&fit=crop&q=80", "COMMERCIAL");

        ensureProperty("Green Valley Hillside Lands", "Kandy", 15.5, 4500000.0,
                "Scenic hillside land plots close to Kandy city limits. Ideal for residential or boutique holiday villa investments.",
                "AVAILABLE", "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&auto=format&fit=crop&q=80", "RESIDENTIAL");

        ensureProperty("Ocean Breeze Coastal Plots", "Galle", 20.0, 8500000.0,
                "Prime coastal land plots in Galle. High investment return potential, close to the Southern Expressway entrance.",
                "AVAILABLE", "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800&auto=format&fit=crop&q=80", "RESIDENTIAL");

        ensureProperty("Sunrise Hillside Plots - Ella", "Ella", 18.0, 650000.0,
                "Breathtaking mountain view lands situated in tourist hotspot Ella. Ideal for holiday cabanas and eco-resorts.",
                "AVAILABLE", "https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=800&auto=format&fit=crop&q=80", "RESIDENTIAL");

        ensureProperty("Elegance Land Plots - Boralesgamuwa", "Boralesgamuwa", 10.0, 1850000.0,
                "Exclusive residential land plots nestled in prime Boralesgamuwa, 5 minutes to 120 bus route with all modern urban utilities.",
                "AVAILABLE", "https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800&auto=format&fit=crop&q=80", "RESIDENTIAL");

        ensureProperty("Grace Field Green Lands - Kadana", "Kadana", 12.5, 920000.0,
                "Serene residential land plots within walking distance to Kadana town, expressway interchange, and super markets.",
                "AVAILABLE", "https://images.unsplash.com/photo-1524813686514-a57563d77d66?w=800&auto=format&fit=crop&q=80", "RESIDENTIAL");

        ensureProperty("Highland Cinnamon & Tea Estate - Nuwara Eliya", "Nuwara Eliya", 40.0, 320000.0,
                "Fertile agricultural land with rolling tea canopy, pure natural mountain spring streams, and clear motorable access.",
                "AVAILABLE", "https://images.unsplash.com/photo-1544984243-ec57ea16fe25?w=800&auto=format&fit=crop&q=80", "AGRICULTURAL");

        ensureProperty("Royal Palm Coconut Cultivation - Kurunegala", "Kurunegala", 60.0, 195000.0,
                "High-yield productive coconut plantation with fertile loamy soil, tube well drip irrigation system, and 3-phase electricity.",
                "AVAILABLE", "https://images.unsplash.com/photo-1598880940371-c756e015fea1?w=800&auto=format&fit=crop&q=80", "AGRICULTURAL");

        ensureProperty("Metro Gateway Commercial Hub - Negombo", "Negombo", 15.0, 2450000.0,
                "Strategic high-visibility commercial plot along airport arterial road, ideal for automobile showroom, warehouse, or retail.",
                "AVAILABLE", "https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?w=800&auto=format&fit=crop&q=80", "COMMERCIAL");

        // Clean up any outdated placeholder images
        List<Property> properties = propertyRepository.findAll();
        for (Property p : properties) {
            if (p.getImageUrl() != null && (p.getImageUrl().contains("photo-1512917774080") || p.getImageUrl().contains("photo-1600585154340") || p.getImageUrl().contains("photo-1600596542815") || p.getImageUrl().contains("photo-1542314831-068cd1dbfeeb"))) {
                p.setImageUrl("https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800&auto=format&fit=crop&q=80");
                propertyRepository.save(p);
            }
        }
    }

    private void ensureProperty(String title, String location, Double size, Double price, String description, String status, String imageUrl, String type) {
        boolean exists = propertyRepository.findAll().stream().anyMatch(p -> p.getTitle() != null && p.getTitle().equalsIgnoreCase(title.trim()));
        if (!exists) {
            propertyRepository.save(new Property(null, title, location, size, price, description, status, imageUrl, type));
        }
    }

    public List<Property> getAllProperties() {
        return propertyRepository.findAll();
    }

    public Property getPropertyById(Long id) {
        return propertyRepository.findById(id).orElse(null);
    }

    public Property saveProperty(Property property) {
        if (property.getStatus() == null) {
            property.setStatus("AVAILABLE");
        }
        return propertyRepository.save(property);
    }

    @org.springframework.transaction.annotation.Transactional
    public void deleteProperty(Long id) {
        if (legalDocumentRepository != null) {
            var docs = legalDocumentRepository.findByPropertyIdOrderByUploadedAtDesc(id);
            if (docs != null && !docs.isEmpty()) {
                legalDocumentRepository.deleteAll(docs);
            }
        }

        if (surveyRepository != null) {
            var surveys = surveyRepository.findByPropertyId(id);
            if (surveys != null && !surveys.isEmpty()) {
                surveyRepository.deleteAll(surveys);
            }
        }

        if (inquiryRepository != null) {
            var inquiries = inquiryRepository.findByPropertyId(id);
            if (inquiries != null && !inquiries.isEmpty()) {
                inquiryRepository.deleteAll(inquiries);
            }
        }

        if (propertyReviewRepository != null) {
            var reviews = propertyReviewRepository.findByPropertyIdOrderByCreatedAtDesc(id);
            if (reviews != null && !reviews.isEmpty()) {
                propertyReviewRepository.deleteAll(reviews);
            }
        }

        if (wishlistRepository != null) {
            var wishlistItems = wishlistRepository.findByPropertyId(id);
            if (wishlistItems != null && !wishlistItems.isEmpty()) {
                wishlistRepository.deleteAll(wishlistItems);
            }
        }

        /*if (saleRepository != null) {
            var sales = saleRepository.findByPropertyId(id);
            if (sales != null && !sales.isEmpty()) {
                for (var sale : sales) {
                    if (legalDocumentRepository != null) {
                        var saleDocs = legalDocumentRepository.findBySaleIdOrderByUploadedAtDesc(sale.getId());
                        if (saleDocs != null && !saleDocs.isEmpty()) {
                            legalDocumentRepository.deleteAll(saleDocs);
                        }
                    }
                    saleRepository.delete(sale);
                }
            }
        }

        propertyRepository.deleteById(id);
    }
}

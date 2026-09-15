<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${property.title} - Land Plot Details | Ceylon Lands</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --bg-color: #f4f7f5;
            --primary: #0b5e28; /* Forest Green */
            --primary-hover: #08431c;
            --secondary: #d4af37; /* Gold */
            --secondary-hover: #bfa030;
            --text-dark: #0a1a10;
            --text-muted: #526359;
            --border: #e1eae4;
            --card-bg: #ffffff;
            --white: #ffffff;
            --dark-header: #07120a;
            --success: #10b981;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        h1, h2, h3, h4, .logo {
            font-family: 'Outfit', sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* 1. Header / Navbar */
        nav {
            background-color: rgba(7, 18, 10, 0.95);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid rgba(212, 175, 55, 0.2);
            padding: 1.1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 1.65rem;
            font-weight: 700;
            color: var(--white);
            display: flex;
            align-items: center;
            gap: 0.5rem;
            text-decoration: none;
            letter-spacing: 0.5px;
        }

        .logo span.highlight {
            color: var(--secondary);
        }

        .logo i {
            color: var(--secondary);
            font-size: 1.5rem;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
            align-items: center;
        }

        .nav-links a {
            color: #cbd5e1;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.25s ease;
            position: relative;
            padding: 0.25rem 0;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background-color: var(--secondary);
            transition: width 0.25s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .nav-links a:hover {
            color: var(--secondary);
        }

        .btn-outline-portal {
            border: 1px solid var(--secondary);
            color: var(--secondary) !important;
            padding: 0.55rem 1.2rem;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.25s ease;
            text-decoration: none;
        }

        .btn-outline-portal:hover {
            background-color: var(--secondary);
            color: var(--dark-header) !important;
            box-shadow: 0 4px 15px rgba(212, 175, 55, 0.3);
        }

        /* Detail Layout Container */
        .detail-container {
            display: grid;
            grid-template-columns: 3fr 2fr;
            gap: 2.5rem;
            padding: 3.5rem 5%;
            max-width: 1250px;
            margin: 0 auto;
            width: 100%;
            flex: 1;
        }

        /* Property Main Area */
        .property-main {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
        }

        .detail-img {
            height: 420px;
            width: 100%;
        .detail-gallery-wrap {
            display: flex;
            flex-direction: column;
            background: #ffffff;
        }

        .detail-img-main {
            height: 480px;
            position: relative;
            background: #0f172a;
            overflow: hidden;
        }

        .detail-img-main img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: opacity 0.25s ease, transform 0.3s ease;
        }

        .gallery-counter-badge {
            position: absolute;
            bottom: 1.25rem;
            left: 1.25rem;
            background: rgba(15, 23, 42, 0.75);
            backdrop-filter: blur(8px);
            color: #ffffff;
            padding: 0.4rem 0.9rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            z-index: 5;
            box-shadow: 0 4px 10px rgba(0,0,0,0.25);
        }

        .gallery-arrow-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(6px);
            color: var(--text-dark);
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            transition: all 0.2s ease;
            z-index: 6;
        }

        .gallery-arrow-btn:hover {
            background: #ffffff;
            color: var(--primary);
            transform: translateY(-50%) scale(1.1);
        }

        .gallery-arrow-btn.prev { left: 1.25rem; }
        .gallery-arrow-btn.next { right: 1.25rem; }

        .gallery-thumbs-row {
            display: flex;
            gap: 0.75rem;
            padding: 0.85rem 1.5rem;
            background: #f8fafc;
            border-bottom: 1px solid var(--border);
            overflow-x: auto;
            align-items: center;
        }

        .gallery-thumb-item {
            position: relative;
            width: 95px;
            height: 65px;
            border-radius: 10px;
            overflow: hidden;
            cursor: pointer;
            border: 2px solid transparent;
            opacity: 0.6;
            transition: all 0.2s ease;
            flex-shrink: 0;
            background: #e2e8f0;
        }

        .gallery-thumb-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .gallery-thumb-item:hover {
            opacity: 0.95;
            transform: translateY(-2px);
        }

        .gallery-thumb-item.active {
            border-color: var(--primary);
            opacity: 1;
            box-shadow: 0 4px 10px rgba(11, 94, 40, 0.25);
            transform: translateY(-2px);
        }

        .gallery-thumb-num {
            position: absolute;
            bottom: 3px;
            right: 4px;
            background: rgba(0,0,0,0.7);
            color: #fff;
            font-size: 0.65rem;
            font-weight: 700;
            padding: 1px 5px;
            border-radius: 6px;
        }

        .status-badge {
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            padding: 0.45rem 1.2rem;
            border-radius: 30px;
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: var(--white);
            box-shadow: 0 4px 12px rgba(0,0,0,0.18);
            z-index: 5;
        }

        .status-available { background-color: var(--primary); }
        .status-reserved { background-color: #d97706; color: #ffffff; }
        .status-sold { background-color: #dc2626; color: #ffffff; }

        .detail-info {
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }

        .detail-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            border-bottom: 1px solid var(--border);
            padding-bottom: 1.5rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .detail-location {
            font-size: 0.95rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 0.35rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .detail-location i {
            color: var(--secondary);
        }

        .detail-title {
            font-size: 2.2rem;
            font-weight: 800;
            color: var(--text-dark);
            margin-top: 0.5rem;
        }

        .detail-price {
            font-size: 2.25rem;
            font-weight: 850;
            color: var(--primary);
            text-align: right;
        }

        .detail-price span {
            font-size: 1rem;
            font-weight: 700;
            color: var(--text-muted);
            display: block;
            text-transform: uppercase;
            margin-bottom: 0.25rem;
        }

        .specs-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 1.5rem;
        }

        .spec-item {
            background: var(--bg-color);
            padding: 1.25rem;
            border-radius: 12px;
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .spec-icon {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            background-color: rgba(11, 94, 40, 0.08);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
        }

        .spec-details h4 {
            font-size: 0.78rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.15rem;
        }

        .spec-details p {
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--text-dark);
        }

        .description-box h3 {
            font-size: 1.35rem;
            margin-bottom: 1rem;
            font-weight: 700;
            color: var(--text-dark);
            position: relative;
            padding-bottom: 0.4rem;
        }

        .description-box h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background-color: var(--secondary);
        }

        .description-box p {
            color: var(--text-muted);
            line-height: 1.75;
            font-size: 1rem;
        }

        /* Inquiry Form Sidebar */
        .sidebar-inquiry {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 2.2rem;
            height: fit-content;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
            position: sticky;
            top: 100px;
        }

        .sidebar-inquiry h3 {
            font-size: 1.35rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            font-size: 0.8rem;
            font-weight: 700;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-group input, .form-group textarea {
            padding: 0.8rem 1rem;
            border: 1px solid #ccd9d0;
            border-radius: 8px;
            font-size: 0.95rem;
            outline: none;
            background-color: var(--white);
            color: var(--text-dark);
            transition: all 0.25s ease;
        }

        .form-group input:focus, .form-group textarea:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(11, 94, 40, 0.15);
        }

        .btn-submit {
            background-color: var(--primary);
            color: var(--white);
            border: none;
            padding: 0.95rem;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            transition: all 0.25s ease;
            text-transform: uppercase;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(11, 94, 40, 0.15);
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        /* Success Alert */
        .alert-success {
            background-color: rgba(16, 185, 129, 0.08);
            border: 1px solid var(--success);
            color: #065f46;
            padding: 1.1rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: flex-start;
            gap: 0.75rem;
            font-weight: 500;
            font-size: 0.92rem;
            line-height: 1.5;
        }

        .alert-success i {
            color: var(--success);
            font-size: 1.25rem;
            margin-top: 0.1rem;
        }

        /* Footer */
        footer {
            background-color: var(--dark-header);
            color: #94a3b8;
            padding: 4rem 5% 2rem 5%;
            border-top: 3px solid var(--secondary);
            margin-top: 4rem;
            width: 100%;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 3.5rem;
            max-width: 1200px;
            margin: 0 auto 4rem auto;
        }

        .footer-col h3 {
            color: var(--white);
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
            font-weight: 700;
            position: relative;
            padding-bottom: 0.5rem;
            font-family: 'Outfit', sans-serif;
        }

        .footer-col h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 35px;
            height: 2px;
            background-color: var(--secondary);
        }

        .footer-col ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 1rem;
            padding: 0;
            margin: 0;
        }

        .footer-col a {
            color: #94a3b8;
            text-decoration: none;
            transition: all 0.2s ease;
            font-size: 0.95rem;
        }

        .footer-col a:hover {
            color: var(--secondary);
            padding-left: 5px;
        }

        .footer-col p {
            font-size: 0.95rem;
            line-height: 1.7;
        }

        .footer-bottom {
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            padding-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 0.9rem;
            max-width: 1200px;
            margin: 0 auto;
            flex-wrap: wrap;
            gap: 1.5rem;
            color: #64748b;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .detail-container {
                grid-template-columns: 1fr;
            }
            .sidebar-inquiry {
                position: static;
            }
            .detail-img {
                height: 300px;
            }
        }
        @media (max-width: 600px) {
            nav {
                flex-direction: column;
                gap: 1rem;
            }
            .nav-links {
                gap: 1rem;
            }
            .detail-header {
                flex-direction: column;
                align-items: stretch;
            }
            .detail-price {
                text-align: left;
            }
            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>
<body>

    <!-- Header Navigation -->
    <nav>
        <a href="${pageContext.request.contextPath}/home" class="logo" style="text-decoration: none;">
            <img src="${pageContext.request.contextPath}/uploads/ceylon-lands-logo.jpg" alt="Ceylon Lands" style="height: 46px; width: 46px; border-radius: 10px; object-fit: cover; border: 2px solid #d4af37; box-shadow: 0 4px 10px rgba(0,0,0,0.35);">
            <div style="display: flex; flex-direction: column; line-height: 1.15;">
                <span style="font-family: 'Outfit', sans-serif; font-weight: 800; font-size: 1.45rem; letter-spacing: 0.5px; color: #ffffff;">Ceylon<span class="highlight" style="color: var(--secondary);">Lands</span></span>
                <span style="font-size: 0.62rem; text-transform: uppercase; letter-spacing: 1.5px; color: #94a3b8; font-weight: 600;">Prime Land Sales &amp; Development</span>
            </div>
        </a>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/properties">Lands & Projects</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/how-it-works">How It Works</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <c:if test="${pageContext.request.isUserInRole('ROLE_LEGAL') or pageContext.request.isUserInRole('LEGAL')}">
                        <li><a href="${pageContext.request.contextPath}/legal" class="btn-outline-portal" style="border-color: #3b82f6; color: #60a5fa !important;"><i class="bi bi-shield-check"></i> Legal Portal</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.isUserInRole('ROLE_SALES') or pageContext.request.isUserInRole('SALES')}">
                        <li><a href="${pageContext.request.contextPath}/sales" class="btn-outline-portal" style="border-color: #10b981; color: #34d399 !important;"><i class="bi bi-currency-dollar"></i> Sales Portal</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.isUserInRole('ROLE_SURVEY') or pageContext.request.isUserInRole('SURVEY')}">
                        <li><a href="${pageContext.request.contextPath}/survey" class="btn-outline-portal" style="border-color: #f59e0b; color: #fbbf24 !important;"><i class="bi bi-geo-alt"></i> Survey Portal</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.isUserInRole('ROLE_PROPERTY') or pageContext.request.isUserInRole('PROPERTY')}">
                        <li><a href="${pageContext.request.contextPath}/property" class="btn-outline-portal" style="border-color: #38bdf8; color: #38bdf8 !important;"><i class="bi bi-buildings"></i> Property Portal</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN') or pageContext.request.isUserInRole('ADMIN')}">
                        <li><a href="${pageContext.request.contextPath}/" class="btn-outline-portal"><i class="bi bi-speedometer2"></i> Admin ERP</a></li>
                    </c:if>
                    <c:if test="${pageContext.request.isUserInRole('ROLE_CUSTOMER') or pageContext.request.isUserInRole('CUSTOMER')}">
                        <li><a href="${pageContext.request.contextPath}/customer/portal" class="btn-outline-portal" style="border-color: #22c55e; color: #4ade80 !important;"><i class="bi bi-person-circle"></i> My Account (${pageContext.request.userPrincipal.name})</a></li>
                    </c:if>
                    <li>
                        <form action="${pageContext.request.contextPath}/logout" method="POST" style="display: inline;">
                            <button type="submit" class="btn-outline-portal" style="background: rgba(239, 68, 68, 0.15); border-color: rgba(239, 68, 68, 0.4); color: #fca5a5; cursor: pointer;">
                                <i class="bi bi-box-arrow-right"></i> Logout
                            </button>
                        </form>
                    </li>
                </c:when>
                <c:otherwise>
                    <li><a href="${pageContext.request.contextPath}/login" class="btn-outline-portal"><i class="bi bi-person-fill"></i> Sign In</a></li>
                    <li><a href="${pageContext.request.contextPath}/register" class="btn-outline-portal" style="background: #0b5e28; border-color: #0b5e28; color: #fff;"><i class="bi bi-person-plus-fill"></i> Register</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>

    <!-- Details view container -->
    <div class="detail-container">
        
        <div class="property-main">
            <!-- Multi-Photo Gallery Section -->
            <div class="detail-gallery-wrap">
                <div class="detail-img-main" id="galleryMainWrap">
                    <img id="activeGalleryImg" src="${property.allImages[0]}" alt="${property.title}">
                    
                    <c:choose>
                        <c:when test="${property.status != null and property.status.equalsIgnoreCase('AVAILABLE')}">
                            <span class="status-badge status-available"><i class="bi bi-check-circle-fill"></i> Available</span>
                        </c:when>
                        <c:when test="${property.status != null and property.status.equalsIgnoreCase('RESERVED')}">
                            <span class="status-badge status-reserved"><i class="bi bi-bookmark-fill"></i> Reserved</span>
                        </c:when>
                        <c:when test="${property.status != null and property.status.equalsIgnoreCase('SOLD')}">
                            <span class="status-badge status-sold"><i class="bi bi-patch-check-fill"></i> Sold</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status-badge status-available">${property.status}</span>
                        </c:otherwise>
                    </c:choose>

                    <c:if test="${property.allImages.size() > 1}">
                        <button type="button" class="gallery-arrow-btn prev" onclick="navigateGallery(-1)" aria-label="Previous photo">
                            <i class="bi bi-chevron-left"></i>
                        </button>
                        <button type="button" class="gallery-arrow-btn next" onclick="navigateGallery(1)" aria-label="Next photo">
                            <i class="bi bi-chevron-right"></i>
                        </button>
                    </c:if>

                    <div class="gallery-counter-badge" id="galleryCounter">
                        <i class="bi bi-camera-fill"></i> Photo <span id="currentImgIdx">1</span> of ${property.allImages.size()}
                    </div>
                </div>

                <!-- Thumbnail Strip (when multiple photos exist) -->
                <c:if test="${property.allImages.size() > 1}">
                    <div class="gallery-thumbs-row">
                        <c:forEach var="imgSrc" items="${property.allImages}" varStatus="status">
                            <div class="gallery-thumb-item ${status.first ? 'active' : ''}" onclick="selectGalleryPhoto(${status.index})" id="thumb-${status.index}" title="View photo ${status.count}">
                                <img src="${imgSrc}" alt="Thumbnail ${status.count}" onerror="this.src='https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=300';">
                                <span class="gallery-thumb-num">${status.count}</span>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            
            <div class="detail-info">
                <div class="detail-header">
                    <div>
                        <span class="detail-location"><i class="bi bi-geo-alt-fill"></i> ${property.location}</span>
                        <h1 class="detail-title">${property.title}</h1>
                        <div style="display: flex; align-items: center; gap: 0.75rem; margin-top: 0.5rem;">
                            <span style="color: #f59e0b; font-weight: 700; font-size: 1rem;">★ <fmt:formatNumber value="${avgRating}" maxFractionDigits="1"/> / 5.0</span>
                            <span style="color: var(--text-muted); font-size: 0.85rem;">(${reviews.size()} Verified Reviews)</span>
                        </div>
                    </div>
                    <div style="text-align: right; display: flex; flex-direction: column; align-items: flex-end; gap: 0.75rem;">
                        <div class="detail-price">
                            <span>Total Land Price</span>
                            Rs. <fmt:formatNumber value="${property.price}" type="number" maxFractionDigits="2"/>
                        </div>
                        <c:choose>
                            <c:when test="${pageContext.request.userPrincipal != null}">
                                <form action="${pageContext.request.contextPath}/customer/wishlist/toggle" method="POST">
                                    <input type="hidden" name="propertyId" value="${property.id}">
                                    <input type="hidden" name="redirectUrl" value="/properties/${property.id}">
                                    <button type="submit" style="background: ${inWishlist ? '#ef4444' : '#fff'}; color: ${inWishlist ? '#fff' : '#ef4444'}; border: 1px solid #ef4444; padding: 0.5rem 1.2rem; border-radius: 30px; font-weight: 700; font-size: 0.88rem; cursor: pointer; display: inline-flex; align-items: center; gap: 0.45rem; transition: all 0.2s ease; box-shadow: 0 4px 10px rgba(239, 68, 68, 0.15);">
                                        <i class="bi ${inWishlist ? 'bi-heart-fill' : 'bi-heart'}"></i>
                                        <span>${inWishlist ? 'Saved in Wishlist' : 'Add to Wishlist'}</span>
                                    </button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login" style="background: #fff; color: #ef4444; border: 1px solid #ef4444; padding: 0.5rem 1.2rem; border-radius: 30px; font-weight: 700; font-size: 0.88rem; text-decoration: none; display: inline-flex; align-items: center; gap: 0.45rem;">
                                    <i class="bi bi-heart"></i> Save to Wishlist
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="specs-grid">
                    <div class="spec-item">
                        <div class="spec-icon"><i class="bi bi-rulers"></i></div>
                        <div class="spec-details">
                            <h4>Land Area</h4>
                            <p>${property.size} Perches</p>
                        </div>
                    </div>
                    <div class="spec-item">
                        <div class="spec-icon"><i class="bi bi-patch-check-fill"></i></div>
                        <div class="spec-details">
                            <h4>Title Status</h4>
                            <p style="color: var(--primary);">100% Clear</p>
                        </div>
                    </div>
                    <div class="spec-item">
                        <div class="spec-icon"><i class="bi bi-tag-fill"></i></div>
                        <div class="spec-details">
                            <h4>Property Type</h4>
                            <p>${property.type != null ? property.type : 'Residential'}</p>
                        </div>
                    </div>
                </div>

                <div class="description-box">
                    <h3>About this Property Listing</h3>
                    <p>${property.description}</p>
                </div>

                <!-- Customer Ratings & Reviews Section -->
                <div style="margin-top: 2rem; border-top: 1px solid var(--border); padding-top: 2rem;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem; flex-wrap: wrap; gap: 1rem;">
                        <div>
                            <h3 style="font-size: 1.4rem; font-weight: 800; color: var(--text-dark);"><i class="bi bi-star-fill" style="color: #f59e0b;"></i> Customer Reviews & Ratings</h3>
                            <p style="color: var(--text-muted); font-size: 0.9rem;">Verified feedback from interested buyers and land visitors.</p>
                        </div>
                        <div style="background: #fef3c7; border: 1px solid #fde68a; padding: 0.5rem 1rem; border-radius: 12px; font-weight: 800; color: #92400e;">
                            ⭐ <fmt:formatNumber value="${avgRating}" maxFractionDigits="1"/> / 5.0 Rating
                        </div>
                    </div>

                    <!-- Review Submission Form -->
                    <c:choose>
                        <c:when test="${pageContext.request.userPrincipal != null}">
                            <div style="background: #f8fafc; border: 1px solid var(--border); border-radius: 16px; padding: 1.5rem; margin-bottom: 2rem;">
                                <h4 style="font-size: 1.1rem; font-weight: 700; margin-bottom: 1rem;">Rate & Review this Property</h4>
                                <form action="${pageContext.request.contextPath}/customer/review/add" method="POST">
                                    <input type="hidden" name="propertyId" value="${property.id}">
                                    <input type="hidden" name="redirectUrl" value="/properties/${property.id}">
                                    
                                    <div style="margin-bottom: 1rem;">
                                        <label style="display: block; font-weight: 700; font-size: 0.85rem; margin-bottom: 0.5rem; text-transform: uppercase;">Your Rating (1 to 5 Stars)</label>
                                        <select name="rating" class="form-control" style="width: 200px; padding: 0.6rem; border-radius: 8px; border: 1px solid var(--border);" required>
                                            <option value="5">★★★★★ (5 - Excellent)</option>
                                            <option value="4">★★★★☆ (4 - Very Good)</option>
                                            <option value="3">★★★☆☆ (3 - Good)</option>
                                            <option value="2">★★☆☆☆ (2 - Fair)</option>
                                            <option value="1">★☆☆☆☆ (1 - Poor)</option>
                                        </select>
                                    </div>

                                    <div style="margin-bottom: 1rem;">
                                        <label style="display: block; font-weight: 700; font-size: 0.85rem; margin-bottom: 0.5rem; text-transform: uppercase;">Your Review Comment</label>
                                        <textarea name="comment" rows="3" class="form-control" style="width: 100%; padding: 0.8rem; border-radius: 8px; border: 1px solid var(--border);" placeholder="Share your opinion on this land plot, location accessibility, or pricing..." required></textarea>
                                    </div>

                                    <button type="submit" style="background: #0b5e28; color: #fff; border: none; padding: 0.7rem 1.5rem; border-radius: 8px; font-weight: 700; cursor: pointer;">Submit Review</button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div style="background: #f8fafc; border: 1px solid var(--border); border-radius: 12px; padding: 1.25rem; margin-bottom: 1.5rem; text-align: center;">
                                <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 0.75rem;">Are you an interested buyer? Sign in to rate and review this property.</p>
                                <a href="${pageContext.request.contextPath}/login" style="background: #0b5e28; color: #fff; padding: 0.5rem 1.25rem; border-radius: 20px; font-weight: 600; text-decoration: none; font-size: 0.88rem; display: inline-block;">Sign In to Review</a>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <!-- Reviews List -->
                    <c:choose>
                        <c:when test="${empty reviews}">
                            <p style="color: var(--text-muted); font-style: italic; font-size: 0.92rem;">No reviews posted yet for this listing. Be the first to review!</p>
                        </c:when>
                        <c:otherwise>
                            <div style="display: flex; flex-direction: column; gap: 1rem;">
                                <c:forEach var="rev" items="${reviews}">
                                    <div style="background: #fff; border: 1px solid var(--border); border-radius: 12px; padding: 1.25rem; box-shadow: 0 2px 4px rgba(0,0,0,0.02);">
                                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 0.5rem;">
                                            <div style="display: flex; align-items: center; gap: 0.6rem;">
                                                <div style="width: 32px; height: 32px; border-radius: 50%; background: #e0e7ff; color: #4338ca; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 0.85rem;">
                                                    ${rev.customerName.substring(0, 1).toUpperCase()}
                                                </div>
                                                <span style="font-weight: 700; color: var(--text-dark);">${rev.customerName}</span>
                                            </div>
                                            <div style="color: #f59e0b; font-size: 1rem; letter-spacing: 2px;">
                                                <c:forEach begin="1" end="${rev.rating}">★</c:forEach>
                                                <c:forEach begin="${rev.rating + 1}" end="5">☆</c:forEach>
                                            </div>
                                        </div>
                                        <p style="color: #334155; font-size: 0.95rem; line-height: 1.5; margin-bottom: 0.35rem;">"${rev.comment}"</p>
                                        <small style="color: var(--text-muted); font-size: 0.78rem;"><i class="bi bi-clock"></i> ${rev.createdAt}</small>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!-- Reservation Sidebar -->
        <c:choose>
            <c:when test="${property.status != null and property.status.equalsIgnoreCase('SOLD')}">
                <div class="sidebar-inquiry" style="text-align: center; padding: 2.5rem 1.5rem; border-top: 4px solid #dc2626;">
                    <div style="width: 60px; height: 60px; border-radius: 50%; background: rgba(220, 38, 38, 0.12); color: #dc2626; font-size: 1.8rem; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.25rem auto;">
                        <i class="bi bi-patch-check-fill"></i>
                    </div>
                    <h3 style="font-size: 1.3rem; margin-bottom: 0.65rem; color: var(--text-dark);">Plot Sold & Ownership Transferred</h3>
                    <p style="font-size: 0.92rem; color: var(--text-muted); line-height: 1.6; margin-bottom: 1.5rem;">
                        This land plot has already been purchased and ownership deeds finalized. Reservations are currently closed for this listing.
                    </p>
                    <a href="${pageContext.request.contextPath}/properties" class="btn-submit" style="display: flex; align-items: center; justify-content: center; gap: 0.5rem; text-decoration: none; font-size: 0.95rem; font-weight: 700;">
                        <i class="bi bi-compass"></i> Explore Available Lands
                    </a>
                </div>
            </c:when>
            <c:when test="${pageContext.request.userPrincipal != null}">
                <div class="sidebar-inquiry">
                    <c:if test="${param.success == 'true'}">
                        <div class="alert-success" style="background: rgba(16, 185, 129, 0.12); border: 1px solid #10b981; color: #047857; padding: 1rem; border-radius: 12px; margin-bottom: 1.25rem; font-size: 0.9rem;">
                            <i class="bi bi-check-circle-fill"></i>
                            <span>Reservation request submitted successfully! A Ceylon Lands representative will contact you shortly to review layout plans and reservation options.</span>
                        </div>
                    </c:if>

                    <c:if test="${property.status != null and property.status.equalsIgnoreCase('RESERVED')}">
                        <div style="background: rgba(245, 158, 11, 0.12); border: 1px solid #f59e0b; color: #b45309; padding: 0.85rem 1rem; border-radius: 10px; margin-bottom: 1.25rem; font-size: 0.88rem; line-height: 1.5;">
                            <i class="bi bi-exclamation-triangle-fill" style="margin-right: 0.35rem;"></i>
                            <strong>Reservation Hold:</strong> This land plot is currently held by a buyer. You may still submit a backup reservation inquiry.
                        </div>
                    </c:if>

                    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 0.5rem;">
                        <h3 style="margin: 0; font-size: 1.3rem;"><i class="bi bi-patch-check-fill" style="color: #22c55e;"></i> ${property.status != null and property.status.equalsIgnoreCase('RESERVED') ? 'Submit Backup Inquiry' : 'Reserve Land Plot'}</h3>
                    </div>
                    <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 1.25rem;">
                        Verified Account: <strong style="color: #0b5e28;">${pageContext.request.userPrincipal.name}</strong>
                    </p>

                    <form action="${pageContext.request.contextPath}/properties/inquire" method="post">
                        <input type="hidden" name="propertyId" value="${property.id}">
                        
                        <div class="form-group">
                            <label for="customerName">Full Name</label>
                            <input type="text" id="customerName" name="customerName" value="${customer != null && customer.name != null ? customer.name : pageContext.request.userPrincipal.name}" required placeholder="e.g. John Doe">
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <input type="email" id="email" name="email" value="${customer != null ? customer.email : ''}" required placeholder="e.g. john@example.com">
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="text" id="phone" name="phone" value="${customer != null ? customer.phone : ''}" required placeholder="e.g. +94771234567">
                        </div>

                        <div class="form-group">
                            <label for="message">Reservation Note / Requirements</label>
                            <textarea id="message" name="message" rows="3" required>I would like to request a reservation for this plot (${property.title}). Please contact me with the survey plan and payment installment details.</textarea>
                        </div>

                        <button type="submit" class="btn-submit" style="display: flex; align-items: center; justify-content: center; gap: 0.5rem;">
                            <i class="bi bi-send-check-fill"></i> Submit Reservation Request
                        </button>
                    </form>
                </div>
            </c:when>
            <c:otherwise>
                <div class="sidebar-inquiry" style="text-align: center; padding: 2.5rem 1.5rem;">
                    <div style="width: 60px; height: 60px; border-radius: 50%; background: rgba(212, 175, 55, 0.15); color: #d4af37; font-size: 1.8rem; display: flex; align-items: center; justify-content: center; margin: 0 auto 1.25rem auto;">
                        <i class="bi bi-shield-lock-fill"></i>
                    </div>
                    <h3 style="font-size: 1.3rem; margin-bottom: 0.65rem; color: var(--text-dark);">Registration Required</h3>
                    <p style="font-size: 0.92rem; color: var(--text-muted); line-height: 1.6; margin-bottom: 1.75rem;">
                        To protect buyer security and maintain verified records, you must be a registered customer to submit land plot reservation requests and view survey deeds.
                    </p>

                    <div style="display: flex; flex-direction: column; gap: 0.85rem;">
                        <a href="${pageContext.request.contextPath}/login" class="btn-submit" style="display: flex; align-items: center; justify-content: center; gap: 0.5rem; text-decoration: none; font-size: 0.95rem; font-weight: 700;">
                            <i class="bi bi-box-arrow-in-right"></i> Sign In to Reserve
                        </a>
                        <a href="${pageContext.request.contextPath}/register" style="display: flex; align-items: center; justify-content: center; gap: 0.5rem; background: #fff; color: #0b5e28; border: 1.5px solid #0b5e28; padding: 0.85rem; border-radius: 10px; font-weight: 700; text-decoration: none; font-size: 0.95rem; transition: all 0.2s ease;">
                            <i class="bi bi-person-plus-fill"></i> Create Free Account
                        </a>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- Footer -->
    <footer id="contact">
        <div class="footer-grid">
            <div class="footer-col">
                <div class="logo" style="color: var(--white); margin-bottom: 1.25rem; display: flex; align-items: center; gap: 0.75rem;">
                    <img src="${pageContext.request.contextPath}/uploads/ceylon-lands-logo.jpg" alt="Ceylon Lands" style="height: 42px; width: 42px; border-radius: 8px; object-fit: cover; border: 1.5px solid #d4af37;">
                    <div style="display: flex; flex-direction: column; line-height: 1.15;">
                        <span style="font-family: 'Outfit', sans-serif; font-weight: 800; font-size: 1.35rem; color: #ffffff;">Ceylon<span class="highlight" style="color: var(--secondary);">Lands</span></span>
                        <span style="font-size: 0.6rem; text-transform: uppercase; letter-spacing: 1.2px; color: #94a3b8; font-weight: 600;">Prime Real Estate &amp; Development</span>
                    </div>
                </div>
                <p style="font-size: 0.92rem; line-height: 1.7;">The premier real estate authority designed for secure, legally verified, and prestigious land block reservation and conveyancing across Sri Lanka.</p>
            </div>
            <div class="footer-col">
                <h3>Quick Navigation</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/home">Home Page</a></li>
                    <li><a href="${pageContext.request.contextPath}/properties">Land Listings</a></li>
                    <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                    <li><a href="${pageContext.request.contextPath}/how-it-works">How It Works</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h3>Our Offerings</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/properties?search=Residential">Residential Plots</a></li>
                    <li><a href="${pageContext.request.contextPath}/properties?search=Commercial">Commercial Land</a></li>
                    <li><a href="${pageContext.request.contextPath}/properties?search=Agricultural">Agricultural Plots</a></li>
                    <li><a href="${pageContext.request.contextPath}/how-it-works">Buyer's Guide</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h3>Headquarters</h3>
                <ul>
                    <li><i class="bi bi-geo-alt-fill" style="color: var(--secondary);"></i> No. 45, Prime Tower, Galle Road, Colombo 03, Sri Lanka</li>
                    <li><i class="bi bi-telephone-fill" style="color: var(--secondary);"></i> +94 11 234 5678</li>
                    <li><i class="bi bi-envelope-fill" style="color: var(--secondary);"></i> info@ceylonlands.lk</li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Ceylon Lands (Pvt) Ltd. All rights reserved.</p>
            <p>Designed for premium web-based Land Sales &amp; Conveyancing Management</p>
        </div>
    </footer>

    <!-- Interactive Gallery Script -->
    <script>
        const galleryPhotos = [
            <c:forEach var="imgSrc" items="${property.allImages}" varStatus="status">
                "${imgSrc}"<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];
        let currentPhotoIdx = 0;

        function selectGalleryPhoto(idx) {
            if (idx < 0 || idx >= galleryPhotos.length) return;
            currentPhotoIdx = idx;
            const mainImg = document.getElementById('activeGalleryImg');
            if (mainImg) {
                mainImg.style.opacity = '0.3';
                setTimeout(() => {
                    mainImg.src = galleryPhotos[currentPhotoIdx];
                    mainImg.style.opacity = '1';
                }, 100);
            }
            const counter = document.getElementById('currentImgIdx');
            if (counter) counter.textContent = (currentPhotoIdx + 1);

            document.querySelectorAll('.gallery-thumb-item').forEach((thumb, i) => {
                if (i === currentPhotoIdx) {
                    thumb.classList.add('active');
                    thumb.scrollIntoView({ behavior: 'smooth', block: 'nearest', inline: 'center' });
                } else {
                    thumb.classList.remove('active');
                }
            });
        }

        function navigateGallery(direction) {
            if (galleryPhotos.length <= 1) return;
            let nextIdx = currentPhotoIdx + direction;
            if (nextIdx < 0) nextIdx = galleryPhotos.length - 1;
            if (nextIdx >= galleryPhotos.length) nextIdx = 0;
            selectGalleryPhoto(nextIdx);
        }

        document.addEventListener('keydown', function(e) {
            if (e.key === 'ArrowLeft') navigateGallery(-1);
            if (e.key === 'ArrowRight') navigateGallery(1);
        });
    </script>

</body>
</html>

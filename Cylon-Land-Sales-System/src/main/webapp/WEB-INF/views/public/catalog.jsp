<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Land Catalog - Lands for Sale in Sri Lanka | Ceylon Lands</title>
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
            --faq-btn-bg: #1a2b5c; /* Dark Blue from screenshot */
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        h1, h2, h3, h4, h5, .logo {
            font-family: 'Outfit', sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Header / Navbar */
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

        /* Inner Banner */
        .inner-banner {
            height: 280px;
            background-image: linear-gradient(rgba(7, 18, 10, 0.5), rgba(7, 18, 10, 0.5)), url('https://plcms.primelands.lk/images/260602120601Greenhide_1920x400.webp');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 5%;
            color: var(--white);
            position: relative;
        }

        .inner-banner h1 {
            font-size: 2.8rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
        }

        .breadcrumb {
            display: flex;
            gap: 0.5rem;
            list-style: none;
            font-size: 0.9rem;
            color: #cbd5e1;
            align-items: center;
        }

        .breadcrumb a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .breadcrumb a:hover {
            color: var(--white);
        }

        .breadcrumb-separator {
            color: rgba(255, 255, 255, 0.3);
        }

        /* Catalog Layout */
        .catalog-container {
            display: grid;
            grid-template-columns: 320px 1fr;
            gap: 2.5rem;
            padding: 4rem 5% 2rem 5%;
            max-width: 1300px;
            margin: 0 auto;
            width: 100%;
        }

        /* Sidebar Filters */
        .sidebar-filters {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 2rem;
            height: fit-content;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
            position: sticky;
            top: 100px;
        }

        .sidebar-filters h3 {
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-group {
            margin-bottom: 1.5rem;
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

        .form-group input, .form-group select {
            padding: 0.8rem 1rem;
            border: 1px solid #ccd9d0;
            border-radius: 8px;
            font-size: 0.95rem;
            outline: none;
            background-color: var(--white);
            color: var(--text-dark);
            transition: all 0.25s ease;
        }

        .form-group input:focus, .form-group select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(11, 94, 40, 0.15);
        }

        .btn-filter {
            background-color: var(--primary);
            color: var(--white);
            border: none;
            padding: 0.9rem;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            transition: all 0.25s ease;
            text-transform: uppercase;
            font-size: 0.9rem;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(11, 94, 40, 0.15);
        }

        .btn-filter:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        /* Results List Header */
        .results-section h2 {
            font-size: 1.9rem;
            margin-bottom: 2rem;
            font-weight: 800;
            color: var(--text-dark);
        }

        .results-section h2 span {
            color: var(--primary);
        }

        /* Cards Grid */
        .catalog-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(310px, 1fr));
            gap: 2.5rem;
        }

        .property-card {
            position: relative;
            background: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.05);
            display: flex;
            flex-direction: column;
            transition: all 0.35s cubic-bezier(0.165, 0.84, 0.44, 1);
            text-decoration: none;
            color: inherit;
            border: 1px solid var(--border);
        }

        .property-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(7, 18, 10, 0.12);
            border-color: rgba(11, 94, 40, 0.2);
        }

        .property-img {
            height: 250px;
            width: 100%;
            position: relative;
            overflow: hidden;
        }

        .property-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .property-card:hover .property-img img {
            transform: scale(1.08);
        }

        .status-badge {
            position: absolute;
            top: 1.25rem;
            right: 1.25rem;
            padding: 0.4rem 1rem;
            border-radius: 30px;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            color: var(--white);
            z-index: 5;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        }

        .status-available { background-color: var(--primary); }
        .status-reserved { background-color: #d97706; color: #ffffff; }
        .status-sold { background-color: #dc2626; color: #ffffff; }

        .status-filter-pills {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }

        .pill-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            padding: 0.45rem 0.9rem;
            border-radius: 20px;
            font-size: 0.82rem;
            font-weight: 700;
            text-decoration: none;
            color: var(--text-dark);
            background: var(--white);
            border: 1px solid var(--border);
            transition: all 0.2s ease;
        }

        .pill-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
        }

        .pill-btn.active {
            background: var(--primary);
            color: #ffffff;
            border-color: var(--primary);
            box-shadow: 0 4px 10px rgba(11, 94, 40, 0.2);
        }

        .pill-btn.pill-avail.active {
            background: #0b5e28;
            border-color: #0b5e28;
        }

        .pill-btn.pill-res.active {
            background: #d97706;
            border-color: #d97706;
        }

        .pill-btn.pill-sold.active {
            background: #dc2626;
            border-color: #dc2626;
        }

        .property-details {
            padding: 2rem 1.75rem;
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
            flex: 1;
        }

        .property-location {
            font-size: 0.85rem;
            color: var(--text-muted);
            display: flex;
            align-items: center;
            gap: 0.35rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .property-location i {
            color: var(--secondary);
            font-size: 1.05rem;
        }

        .property-title {
            font-size: 1.38rem;
            font-weight: 800;
            color: var(--text-dark);
            line-height: 1.35;
        }

        .property-description {
            font-size: 0.9rem;
            color: var(--text-muted);
            line-height: 1.6;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 44px;
        }

        .property-meta {
            display: flex;
            gap: 1.25rem;
            border-top: 1px solid var(--border);
            padding-top: 1rem;
            margin-top: 0.25rem;
            font-size: 0.88rem;
            font-weight: 600;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 0.4rem;
            color: var(--text-dark);
        }

        .meta-item i {
            color: var(--primary);
            font-size: 1.1rem;
        }

        .property-price-box {
            margin-top: auto;
            padding-top: 1.25rem;
            display: flex;
            flex-direction: column;
            gap: 0.25rem;
        }

        .price-upward-label {
            font-size: 0.75rem;
            color: var(--text-muted);
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .property-price {
            font-size: 1.6rem;
            font-weight: 850;
            color: var(--primary);
            line-height: 1;
        }

        .arrow-action {
            margin-top: 1rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            font-weight: 700;
            color: var(--primary);
            transition: gap 0.25s ease;
        }

        .property-card:hover .arrow-action {
            gap: 0.75rem;
            color: var(--primary-hover);
        }

        /* FAQ Section (Home Lands Style) */
        .faq-section {
            background-color: var(--white);
            border-top: 1px solid var(--border);
            border-bottom: 1px solid var(--border);
            padding: 5rem 5%;
            width: 100%;
        }

        .faq-grid {
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            gap: 4rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .faq-left {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .faq-left span.subtitle {
            font-size: 0.85rem;
            color: var(--text-muted);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 1rem;
        }

        .faq-left h2 {
            font-size: 2.8rem;
            font-weight: 800;
            color: var(--text-dark);
            line-height: 1.15;
            margin-bottom: 2rem;
            text-transform: uppercase;
        }

        .faq-left .btn-view-all {
            background-color: var(--faq-btn-bg);
            color: var(--white);
            border: none;
            padding: 0.95rem 2.5rem;
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 4px 10px rgba(26, 43, 92, 0.25);
        }

        .faq-left .btn-view-all:hover {
            opacity: 0.9;
            transform: translateY(-1px);
        }

        .faq-right {
            display: flex;
            flex-direction: column;
        }

        .accordion-item {
            border-bottom: 1px solid var(--border);
            padding: 1.5rem 0;
            cursor: pointer;
        }

        .accordion-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1.5rem;
        }

        .accordion-header h5 {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-dark);
            line-height: 1.4;
            transition: color 0.25s ease;
        }

        .accordion-item:hover .accordion-header h5 {
            color: var(--primary);
        }

        .accordion-icon {
            font-size: 1.25rem;
            color: var(--text-dark);
            transition: transform 0.3s ease;
        }

        .accordion-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.35s cubic-bezier(0.165, 0.84, 0.44, 1), padding 0.35s ease;
        }

        .accordion-content p {
            font-size: 0.95rem;
            color: var(--text-muted);
            line-height: 1.65;
            padding-top: 1rem;
        }

        /* Accordion Open State */
        .accordion-item.active .accordion-icon {
            transform: rotate(180deg);
            color: var(--primary);
        }

        .accordion-item.active .accordion-header h5 {
            color: var(--primary);
        }

        .accordion-item.active .accordion-content {
            max-height: 200px; /* arbitrary height to slide open */
        }

        /* Footer */
        footer {
            background-color: var(--dark-header);
            color: #94a3b8;
            padding: 4rem 5% 2rem 5%;
            border-top: 3px solid var(--secondary);
            margin-top: 0;
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
            .catalog-container {
                grid-template-columns: 1fr;
            }
            .sidebar-filters {
                position: static;
            }
            .faq-grid {
                grid-template-columns: 1fr;
                gap: 2.5rem;
            }
            .inner-banner h1 {
                font-size: 2.2rem;
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
            <li><a href="${pageContext.request.contextPath}/properties" class="active">Lands & Projects</a></li>
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

    <!-- Inner Banner -->
    <div class="inner-banner">
        <h1>Lands in Sri Lanka</h1>
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/home"><i class="bi bi-house-door-fill"></i> Home</a></li>
            <li class="breadcrumb-separator"><i class="bi bi-chevron-right"></i></li>
            <li>Lands Catalog</li>
        </ul>
    </div>

    <!-- Catalog container -->
    <div class="catalog-container">
        
        <!-- Filter sidebar -->
        <div class="sidebar-filters">
            <h3><i class="bi bi-funnel-fill"></i> Filter Lands</h3>
            <form action="${pageContext.request.contextPath}/properties" method="get">
                <div class="form-group">
                    <label for="search">Keyword Search</label>
                    <input type="text" id="search" name="search" value="${param.search}" placeholder="Search plots or title...">
                </div>
                <div class="form-group">
                    <label for="location">District / Location</label>
                    <select id="location" name="location">
                        <option value="">All Locations</option>
                        <option value="Colombo 07" ${param.location == 'Colombo 07' ? 'selected' : ''}>Colombo</option>
                        <option value="Kandy" ${param.location == 'Kandy' ? 'selected' : ''}>Kandy</option>
                        <option value="Galle" ${param.location == 'Galle' ? 'selected' : ''}>Galle</option>
                        <option value="Nuwara Eliya" ${param.location == 'Nuwara Eliya' ? 'selected' : ''}>Nuwara Eliya</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="type">Land Category</label>
                    <select id="type" name="type">
                        <option value="">All Land Types</option>
                        <option value="Residential" ${param.type == 'Residential' ? 'selected' : ''}>Residential Lands</option>
                        <option value="Commercial" ${param.type == 'Commercial' ? 'selected' : ''}>Commercial Lands</option>
                        <option value="Agricultural" ${param.type == 'Agricultural' ? 'selected' : ''}>Agricultural Lands</option>
                        <option value="Industrial" ${param.type == 'Industrial' ? 'selected' : ''}>Industrial Lands</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="status">Plot Availability</label>
                    <select id="status" name="status">
                        <option value="">All Lands (Available, Reserved, Sold)</option>
                        <option value="AVAILABLE" ${param.status == 'AVAILABLE' ? 'selected' : ''}>Available Plots Only</option>
                        <option value="RESERVED" ${param.status == 'RESERVED' ? 'selected' : ''}>Reserved / On Hold Plots</option>
                        <option value="SOLD" ${param.status == 'SOLD' ? 'selected' : ''}>Sold Lands (Ownership Transferred)</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="maxPrice">Maximum Budget (LKR)</label>
                    <input type="number" id="maxPrice" name="maxPrice" value="${param.maxPrice}" placeholder="No Budget Limit">
                </div>
                <button type="submit" class="btn-filter">Apply Filter Engine</button>
            </form>
        </div>

        <!-- Catalog Results -->
        <div class="results-section">
            <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem; margin-bottom: 1.5rem;">
                <h2 style="margin: 0;">
                    <c:choose>
                        <c:when test="${param.status == 'AVAILABLE'}">Available <span>Land Projects</span></c:when>
                        <c:when test="${param.status == 'RESERVED'}">Reserved <span>Land Projects</span></c:when>
                        <c:when test="${param.status == 'SOLD'}">Sold <span>Land Projects</span></c:when>
                        <c:otherwise>Lands & <span>Projects Catalog</span></c:otherwise>
                    </c:choose>
                    (${properties.size()})
                </h2>

                <div class="status-filter-pills">
                    <a href="${pageContext.request.contextPath}/properties" class="pill-btn ${empty param.status or param.status == 'ALL' ? 'active' : ''}">All (${totalPublicCount != null ? totalPublicCount : properties.size()})</a>
                    <a href="${pageContext.request.contextPath}/properties?status=AVAILABLE" class="pill-btn pill-avail ${param.status == 'AVAILABLE' ? 'active' : ''}"><i class="bi bi-check-circle-fill"></i> Available (${availableCount != null ? availableCount : 0})</a>
                    <a href="${pageContext.request.contextPath}/properties?status=RESERVED" class="pill-btn pill-res ${param.status == 'RESERVED' ? 'active' : ''}"><i class="bi bi-bookmark-fill"></i> Reserved (${reservedCount != null ? reservedCount : 0})</a>
                    <a href="${pageContext.request.contextPath}/properties?status=SOLD" class="pill-btn pill-sold ${param.status == 'SOLD' ? 'active' : ''}"><i class="bi bi-patch-check-fill"></i> Sold (${soldCount != null ? soldCount : 0})</a>
                </div>
            </div>
            
            <div class="catalog-grid">
                <c:forEach var="prop" items="${properties}">
                    <a href="${pageContext.request.contextPath}/properties/detail/${prop.id}" class="property-card">
                        <div class="property-img">
                            <img src="${prop.imageUrl != null && !prop.imageUrl.isEmpty() ? prop.imageUrl : 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=600'}" alt="${prop.title}">
                            
                            <c:choose>
                                <c:when test="${prop.status != null and prop.status.equalsIgnoreCase('AVAILABLE')}">
                                    <span class="status-badge status-available"><i class="bi bi-check-circle-fill"></i> Available</span>
                                </c:when>
                                <c:when test="${prop.status != null and prop.status.equalsIgnoreCase('RESERVED')}">
                                    <span class="status-badge status-reserved"><i class="bi bi-bookmark-fill"></i> Reserved</span>
                                </c:when>
                                <c:when test="${prop.status != null and prop.status.equalsIgnoreCase('SOLD')}">
                                    <span class="status-badge status-sold"><i class="bi bi-patch-check-fill"></i> Sold</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-available">${prop.status}</span>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${prop.imageCount > 1}">
                                <span style="position: absolute; bottom: 0.85rem; left: 0.85rem; background: rgba(15, 23, 42, 0.75); backdrop-filter: blur(6px); color: #ffffff; padding: 0.25rem 0.6rem; border-radius: 20px; font-size: 0.72rem; font-weight: 700; display: inline-flex; align-items: center; gap: 0.35rem; z-index: 4; box-shadow: 0 2px 6px rgba(0,0,0,0.2);">
                                    <i class="bi bi-camera-fill"></i> ${prop.imageCount} Photos
                                </span>
                            </c:if>
                        </div>
                        <div class="property-details">
                            <span class="property-location"><i class="bi bi-geo-alt-fill"></i> ${prop.location}</span>
                            <h3 class="property-title">${prop.title}</h3>
                            <p class="property-description">${prop.description}</p>
                            
                            <div class="property-meta">
                                <div class="meta-item">
                                    <i class="bi bi-rulers"></i>
                                    <span>${prop.size} Perches</span>
                                </div>
                                <div class="meta-item">
                                    <i class="bi bi-patch-check-fill"></i>
                                    <span>Clear Deeds</span>
                                </div>
                            </div>
                            
                            <div class="property-price-box">
                                <span class="price-upward-label">Total Land Price</span>
                                <div class="property-price">Rs. <fmt:formatNumber value="${prop.price}" type="number" maxFractionDigits="2"/></div>
                            </div>

                            <div class="arrow-action">
                                <span>${prop.status != null and prop.status.equalsIgnoreCase('SOLD') ? 'View Land Record' : (prop.status != null and prop.status.equalsIgnoreCase('RESERVED') ? 'View Reserved Plot' : 'Explore Land')}</span>
                                <i class="bi bi-arrow-right"></i>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>
            
            <c:if test="${empty properties}">
                <div style="text-align: center; padding: 5rem 2rem; color: var(--text-muted); background: var(--white); border-radius: 16px; border: 1px solid var(--border); margin-top: 1rem;">
                    <i class="bi bi-exclamation-circle-fill" style="font-size: 3.5rem; margin-bottom: 1.25rem; display: block; color: var(--secondary);"></i>
                    <h3 style="font-size: 1.4rem; color: var(--text-dark); margin-bottom: 0.5rem;">No Land Blocks Found</h3>
                    <p>No land listings match your current filters. Try selecting a different location or adjusting your budget limit.</p>
                </div>
            </c:if>
        </div>
    </div>

    <!-- FAQ Section (Home Lands Style Accordion) -->
    <div class="faq-section">
        <div class="faq-grid">
            <div class="faq-left">
                <span class="subtitle">Questions</span>
                <h2>Frequently Asked Questions</h2>
                <button class="btn-view-all" onclick="location.href='${pageContext.request.contextPath}/how-it-works'">View All</button>
            </div>
            <div class="faq-right">
                <div class="accordion-item">
                    <div class="accordion-header">
                        <h5>How do I ensure legal ownership of land before purchasing in Sri Lanka?</h5>
                        <i class="bi bi-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <p>All plots of land we sell at Ceylon Lands come with clear title deeds, which are legally verified by professional lawyers. Our in-house legal professionals verify documents as genuine, free from any encumbrances, and properly registered with local authorities. We ensure full transparency in the transaction to protect your investment.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        <h5>Why is it a good idea to buy land in fast-developing areas like Malabe or Homagama?</h5>
                        <i class="bi bi-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <p>Locations like Malabe, Homagama, and Meepe experience rapid urbanization and, therefore, are the best locations for investment. With new expressways, IT parks, and improved infrastructures, land in these locations is going to grow in value exponentially with time. Our experienced real estate consultants help you choose plots with better growth opportunities.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        <h5>Can I get a loan from the bank if I buy land through Ceylon Lands?</h5>
                        <i class="bi bi-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <p>Yes, Ceylon Lands has an understanding with Sri Lanka's leading banks for offering land loans on low interest and easy repayment. We facilitate you in getting the loan by making it easy for the buyer to acquire finance without any hassles.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        <h5>Can you provide information on financing options?</h5>
                        <i class="bi bi-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <p>Yes, we offer various financing options through our partnerships with leading local banks and financial institutions, providing flexible payment timelines and installments.</p>
                    </div>
                </div>

                <div class="accordion-item">
                    <div class="accordion-header">
                        <h5>Why should I trust Ceylon Lands in buying land in Sri Lanka?</h5>
                        <i class="bi bi-chevron-down accordion-icon"></i>
                    </div>
                    <div class="accordion-content">
                        <p>With over two decades of combined corporate history and a name to reckon with when it comes to legally sound land projects, Ceylon Lands is a brand that Sri Lankans trust. Our experts include certified property consultants, lawyers, and finance professionals who ensure that every transaction is transparent, secure, and compliant with Sri Lankan law.</p>
                    </div>
                </div>
            </div>
        </div>
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

    <!-- Vanilla Javascript for Accordion Interactions -->
    <script>
        document.querySelectorAll('.accordion-header').forEach(header => {
            header.addEventListener('click', () => {
                const item = header.parentElement;
                
                // Toggle active state
                item.classList.toggle('active');
                
                // Set dynamic max-height
                const content = item.querySelector('.accordion-content');
                if (item.classList.contains('active')) {
                    content.style.maxHeight = content.scrollHeight + "px";
                } else {
                    content.style.maxHeight = "0px";
                }

                // Optional: Collapse other accordion items
                document.querySelectorAll('.accordion-item').forEach(otherItem => {
                    if (otherItem !== item && otherItem.classList.contains('active')) {
                        otherItem.classList.remove('active');
                        otherItem.querySelector('.accordion-content').style.maxHeight = "0px";
                    }
                });
            });
        });
    </script>

</body>
</html>

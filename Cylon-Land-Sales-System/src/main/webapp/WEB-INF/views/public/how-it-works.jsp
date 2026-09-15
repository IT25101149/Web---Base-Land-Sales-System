<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>How It Works - Buying Land with Ceylon Lands</title>
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
            --faq-btn-bg: #1a2b5c;
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

        .nav-links a:hover::after,
        .nav-links a.active::after {
            width: 100%;
        }

        .nav-links a:hover,
        .nav-links a.active {
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

        /* 2. Top Inner Banner */
        .inner-banner {
            height: 280px;
            background-image: linear-gradient(rgba(7, 18, 10, 0.55), rgba(7, 18, 10, 0.55)), url('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1600&q=80');
            background-size: cover;
            background-position: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 5%;
            color: var(--white);
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
        }

        .breadcrumb a:hover {
            color: var(--white);
        }

        .breadcrumb-separator {
            color: rgba(255, 255, 255, 0.3);
        }

        /* 3. Page Container */
        .page-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 5rem 5%;
            display: flex;
            flex-direction: column;
            gap: 5rem;
        }

        .section-header {
            text-align: center;
            margin-bottom: 3.5rem;
        }

        .section-header h2 {
            font-size: 2.4rem;
            font-weight: 800;
            color: var(--text-dark);
        }

        .section-header h2 span {
            color: var(--primary);
        }

        .section-header p {
            color: var(--text-muted);
            margin-top: 0.5rem;
            font-size: 1.05rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        /* 6-Step Timeline Process */
        .process-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
        }

        .process-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 2.5rem 2rem;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
            position: relative;
            transition: all 0.3s ease;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .process-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 35px rgba(7, 18, 10, 0.08);
            border-color: var(--primary);
        }

        .step-tag {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 46px;
            height: 46px;
            border-radius: 12px;
            background-color: var(--primary);
            color: var(--white);
            font-size: 1.1rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            box-shadow: 0 4px 10px rgba(11, 94, 40, 0.25);
        }

        .process-card h3 {
            font-size: 1.35rem;
            font-weight: 800;
            color: var(--text-dark);
            line-height: 1.3;
        }

        .process-card p {
            font-size: 0.95rem;
            color: var(--text-muted);
            line-height: 1.65;
        }

        .process-card .checklist {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            margin-top: 0.5rem;
            padding-top: 1rem;
            border-top: 1px solid var(--border);
        }

        .process-card .checklist li {
            font-size: 0.85rem;
            color: var(--text-dark);
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .process-card .checklist li i {
            color: var(--primary);
            font-size: 1rem;
        }

        /* Document Checklist Section */
        .docs-section {
            background: linear-gradient(135deg, var(--dark-header), #0f2b1d);
            color: var(--white);
            border-radius: 20px;
            padding: 4rem 3.5rem;
            border: 1px solid rgba(212, 175, 55, 0.2);
            box-shadow: 0 15px 35px rgba(7, 18, 10, 0.1);
        }

        .docs-grid {
            display: grid;
            grid-template-columns: 1fr 1.2fr;
            gap: 3.5rem;
            align-items: center;
        }

        .docs-left h2 {
            font-size: 2.3rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 1rem;
        }

        .docs-left h2 span {
            color: var(--secondary);
        }

        .docs-left p {
            color: #cbd5e1;
            line-height: 1.7;
            font-size: 1rem;
        }

        .docs-list {
            list-style: none;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .doc-item {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 1.25rem 1.5rem;
            border-radius: 12px;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            transition: all 0.25s ease;
        }

        .doc-item:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: var(--secondary);
        }

        .doc-item i {
            font-size: 1.5rem;
            color: var(--secondary);
        }

        .doc-item span {
            font-size: 0.92rem;
            font-weight: 600;
            color: var(--white);
        }

        /* FAQ Accordion Section */
        .faq-section {
            background-color: var(--white);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 4rem;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
        }

        .faq-grid {
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            gap: 3.5rem;
        }

        .faq-left span.subtitle {
            font-size: 0.85rem;
            color: var(--text-muted);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 0.75rem;
            display: block;
        }

        .faq-left h2 {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-dark);
            line-height: 1.2;
            margin-bottom: 1.5rem;
            text-transform: uppercase;
        }

        .btn-view-all {
            background-color: var(--faq-btn-bg);
            color: var(--white);
            border: none;
            padding: 0.9rem 2.2rem;
            font-size: 0.85rem;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.25s ease;
        }

        .accordion-item {
            border-bottom: 1px solid var(--border);
            padding: 1.25rem 0;
            cursor: pointer;
        }

        .accordion-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 1.5rem;
        }

        .accordion-header h5 {
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--text-dark);
            line-height: 1.4;
            transition: color 0.25s ease;
        }

        .accordion-item:hover .accordion-header h5 {
            color: var(--primary);
        }

        .accordion-icon {
            font-size: 1.2rem;
            color: var(--text-dark);
            transition: transform 0.3s ease;
        }

        .accordion-content {
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.35s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .accordion-content p {
            font-size: 0.95rem;
            color: var(--text-muted);
            line-height: 1.65;
            padding-top: 0.75rem;
        }

        .accordion-item.active .accordion-icon {
            transform: rotate(180deg);
            color: var(--primary);
        }

        .accordion-item.active .accordion-header h5 {
            color: var(--primary);
        }

        .accordion-item.active .accordion-content {
            max-height: 200px;
        }

        /* Footer */
        footer {
            background-color: var(--dark-header);
            color: #94a3b8;
            padding: 5rem 5% 2.5rem 5%;
            border-top: 3px solid var(--secondary);
            margin-top: auto;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 3.5rem;
            max-width: 1200px;
            margin: 0 auto 3.5rem auto;
        }

        .footer-col h3 {
            color: var(--white);
            font-size: 1.2rem;
            margin-bottom: 1.25rem;
            font-weight: 700;
        }

        .footer-col ul {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.85rem;
        }

        .footer-col a {
            color: #94a3b8;
            text-decoration: none;
            transition: color 0.2s ease;
            font-size: 0.95rem;
        }

        .footer-col a:hover {
            color: var(--secondary);
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
            gap: 1rem;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .docs-grid, .faq-grid {
                grid-template-columns: 1fr;
            }
            .docs-list {
                grid-template-columns: 1fr;
            }
            .faq-section {
                padding: 2.5rem 1.5rem;
            }
        }
        @media (max-width: 600px) {
            nav {
                flex-direction: column;
                gap: 1rem;
            }
            .nav-links {
                gap: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }
            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
        }
    </style>
</head>
<body>

    <!-- 1. Header Navigation -->
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
            <li><a href="${pageContext.request.contextPath}/how-it-works" class="active">How It Works</a></li>
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

    <!-- 2. Inner Banner -->
    <div class="inner-banner">
        <h1>How It Works</h1>
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/home"><i class="bi bi-house-door-fill"></i> Home</a></li>
            <li class="breadcrumb-separator"><i class="bi bi-chevron-right"></i></li>
            <li>How It Works</li>
        </ul>
    </div>

    <!-- 3. Page Content -->
    <div class="page-container">

        <!-- 6-Step Process -->
        <div>
            <div class="section-header">
                <h2>The 6-Step Path to <span>Land Ownership</span></h2>
                <p>A transparent, legally verified roadmap designed to protect your investment at every phase.</p>
            </div>

            <div class="process-grid">
                <!-- Step 1 -->
                <div class="process-card">
                    <div class="step-tag">01</div>
                    <h3>Explore & Filter Plots</h3>
                    <p>Search through verified lands across Sri Lanka based on your desired location, perch area, and budget.</p>
                    <ul class="checklist">
                        <li><i class="bi bi-check-circle-fill"></i> Real-time plot availability</li>
                        <li><i class="bi bi-check-circle-fill"></i> Accurate per-perch pricing</li>
                    </ul>
                </div>

                <!-- Step 2 -->
                <div class="process-card">
                    <div class="step-tag">02</div>
                    <h3>Schedule On-Site Inspection</h3>
                    <p>Meet our dedicated field property officers on site to inspect plot boundaries, access roads, and soil suitability.</p>
                    <ul class="checklist">
                        <li><i class="bi bi-check-circle-fill"></i> Accompanied site visits</li>
                        <li><i class="bi bi-check-circle-fill"></i> Physical survey inspection</li>
                    </ul>
                </div>

                <!-- Step 3 -->
                <div class="process-card">
                    <div class="step-tag">03</div>
                    <h3>Review Survey & Legal Deeds</h3>
                    <p>Audit licensed survey plans, local authority approvals, street lines, and complete 30-year deed extractions.</p>
                    <ul class="checklist">
                        <li><i class="bi bi-check-circle-fill"></i> 100% Unencumbered titles</li>
                        <li><i class="bi bi-check-circle-fill"></i> Approved subdivision plans</li>
                    </ul>
                </div>

                <!-- Step 4 -->
                <div class="process-card">
                    <div class="step-tag">04</div>
                    <h3>Block Booking & Reservation</h3>
                    <p>Place an initial reservation deposit (Rs. 100,000 upwards) to take your preferred plot off the open market.</p>
                    <ul class="checklist">
                        <li><i class="bi bi-check-circle-fill"></i> Official reservation agreement</li>
                        <li><i class="bi bi-check-circle-fill"></i> Price freeze protection</li>
                    </ul>
                </div>

                <!-- Step 5 -->
                <div class="process-card">
                    <div class="step-tag">05</div>
                    <h3>Flexible Payment or Bank Loan</h3>
                    <p>Pay in cash with special discounts, opt for our interest-free installment schemes, or utilize partner bank mortgage loans.</p>
                    <ul class="checklist">
                        <li><i class="bi bi-check-circle-fill"></i> Up to 5-year installment plans</li>
                        <li><i class="bi bi-check-circle-fill"></i> Expedited bank loan support</li>
                    </ul>
                </div>

                <!-- Step 6 -->
                <div class="process-card">
                    <div class="step-tag">06</div>
                    <h3>Deed of Transfer & Absolute Title</h3>
                    <p>Sign the final Deed of Transfer before our certified legal notaries and receive registered title ownership deeds.</p>
                    <ul class="checklist">
                        <li><i class="bi bi-check-circle-fill"></i> Land registry registration</li>
                        <li><i class="bi bi-check-circle-fill"></i> Full title handover</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Documentation Verification Checklist -->
        <div class="docs-section">
            <div class="docs-grid">
                <div class="docs-left">
                    <h2>Complete <span>Legal Verification</span> Included</h2>
                    <p>We take pride in guaranteeing absolute legal safety. Every plot purchased through Ceylon Lands comes backed by complete legal clearances from relevant municipal councils and land registries.</p>
                </div>
                <div class="docs-list">
                    <div class="doc-item">
                        <i class="bi bi-file-earmark-check-fill"></i>
                        <span>30-Year Title Search</span>
                    </div>
                    <div class="doc-item">
                        <i class="bi bi-compass-fill"></i>
                        <span>Licensed Cadastral Plan</span>
                    </div>
                    <div class="doc-item">
                        <i class="bi bi-building-check"></i>
                        <span>Local Authority Approval</span>
                    </div>
                    <div class="doc-item">
                        <i class="bi bi-signpost-split-fill"></i>
                        <span>Street Line Certificate</span>
                    </div>
                    <div class="doc-item">
                        <i class="bi bi-water"></i>
                        <span>Non-Vesting Certificate</span>
                    </div>
                    <div class="doc-item">
                        <i class="bi bi-patch-check-fill"></i>
                        <span>Clear Deed of Transfer</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- FAQ Section -->
        <div class="faq-section">
            <div class="faq-grid">
                <div class="faq-left">
                    <span class="subtitle">Questions</span>
                    <h2>Frequently Asked Questions</h2>
                    <button class="btn-view-all" onclick="location.href='${pageContext.request.contextPath}/contact'">Contact Us</button>
                </div>
                <div class="faq-right">
                    <div class="accordion-item">
                        <div class="accordion-header">
                            <h5>How do I ensure legal ownership of land before purchasing in Sri Lanka?</h5>
                            <i class="bi bi-chevron-down accordion-icon"></i>
                        </div>
                        <div class="accordion-content">
                            <p>All plots of land we sell at Ceylon Lands come with clear title deeds, which are legally verified by professional lawyers. Our in-house legal professionals verify documents as genuine, free from any encumbrances, and properly registered with local authorities.</p>
                        </div>
                    </div>

                    <div class="accordion-item">
                        <div class="accordion-header">
                            <h5>Why is it a good idea to buy land in fast-developing areas like Malabe or Homagama?</h5>
                            <i class="bi bi-chevron-down accordion-icon"></i>
                        </div>
                        <div class="accordion-content">
                            <p>Locations like Malabe, Homagama, and Meepe experience rapid urbanization and infrastructure expansion. With new expressways and technology parks, land in these locations consistently appreciates in value.</p>
                        </div>
                    </div>

                    <div class="accordion-item">
                        <div class="accordion-header">
                            <h5>Can I get a loan from the bank if I buy land through Ceylon Lands?</h5>
                            <i class="bi bi-chevron-down accordion-icon"></i>
                        </div>
                        <div class="accordion-content">
                            <p>Yes, Ceylon Lands has agreements with Sri Lanka's leading commercial banks for offering land loans on competitive interest rates with expedited document processing.</p>
                        </div>
                    </div>

                    <div class="accordion-item">
                        <div class="accordion-header">
                            <h5>Can you provide information on financing options?</h5>
                            <i class="bi bi-chevron-down accordion-icon"></i>
                        </div>
                        <div class="accordion-content">
                            <p>We offer customized payment timelines, including 0% interest monthly installment schemes and structured down-payment plans to match your cash flow.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- 4. Footer -->
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

    <!-- Accordion Script -->
    <script>
        document.querySelectorAll('.accordion-header').forEach(header => {
            header.addEventListener('click', () => {
                const item = header.parentElement;
                item.classList.toggle('active');
                const content = item.querySelector('.accordion-content');
                if (item.classList.contains('active')) {
                    content.style.maxHeight = content.scrollHeight + "px";
                } else {
                    content.style.maxHeight = "0px";
                }
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

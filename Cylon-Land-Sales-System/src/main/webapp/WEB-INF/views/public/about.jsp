<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Ceylon Lands Real Estate Sri Lanka</title>
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
            background-image: linear-gradient(rgba(7, 18, 10, 0.55), rgba(7, 18, 10, 0.55)), url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=1600&q=80');
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

        /* 3. Main Container */
        .page-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 5rem 5%;
            display: flex;
            flex-direction: column;
            gap: 5rem;
        }

        /* Story Section */
        .story-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .story-img {
            position: relative;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(7, 18, 10, 0.12);
        }

        .story-img img {
            width: 100%;
            height: 420px;
            object-fit: cover;
            display: block;
        }

        .story-badge {
            position: absolute;
            bottom: 2rem;
            right: 2rem;
            background: rgba(7, 18, 10, 0.92);
            color: var(--white);
            padding: 1.25rem 1.75rem;
            border-radius: 12px;
            border-left: 4px solid var(--secondary);
            backdrop-filter: blur(10px);
        }

        .story-badge h3 {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--secondary);
        }

        .story-badge p {
            font-size: 0.85rem;
            color: #cbd5e1;
            margin-top: 0.25rem;
        }

        .story-content span.sub-title {
            color: var(--secondary);
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 700;
            display: block;
            margin-bottom: 0.75rem;
        }

        .story-content h2 {
            font-size: 2.4rem;
            font-weight: 800;
            color: var(--text-dark);
            line-height: 1.25;
            margin-bottom: 1.5rem;
        }

        .story-content p {
            font-size: 1rem;
            color: var(--text-muted);
            line-height: 1.75;
            margin-bottom: 1.25rem;
        }

        /* Stats Grid */
        .stats-section {
            background: linear-gradient(135deg, var(--dark-header), #0f2b1d);
            color: var(--white);
            border-radius: 20px;
            padding: 3.5rem 3rem;
            box-shadow: 0 15px 35px rgba(7, 18, 10, 0.1);
            border: 1px solid rgba(212, 175, 55, 0.2);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2.5rem;
            text-align: center;
        }

        .stat-item h3 {
            font-size: 3rem;
            font-weight: 850;
            color: var(--secondary);
            margin-bottom: 0.25rem;
        }

        .stat-item p {
            font-size: 0.95rem;
            color: #cbd5e1;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Vision & Mission */
        .vm-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2.5rem;
        }

        .vm-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 3rem 2.5rem;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
            display: flex;
            flex-direction: column;
            gap: 1rem;
            position: relative;
            transition: all 0.3s ease;
        }

        .vm-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(7, 18, 10, 0.08);
            border-color: var(--primary);
        }

        .vm-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background-color: rgba(11, 94, 40, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
        }

        .vm-card h3 {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--text-dark);
        }

        .vm-card p {
            font-size: 0.98rem;
            color: var(--text-muted);
            line-height: 1.7;
        }

        /* Pillars of Trust */
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

        .pillars-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 2rem;
        }

        .pillar-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 2.2rem 1.8rem;
            box-shadow: 0 8px 25px rgba(7, 18, 10, 0.02);
            transition: all 0.3s ease;
        }

        .pillar-card:hover {
            transform: translateY(-5px);
            border-color: var(--secondary);
            box-shadow: 0 12px 30px rgba(212, 175, 55, 0.15);
        }

        .pillar-icon {
            font-size: 2.2rem;
            color: var(--secondary);
            margin-bottom: 1rem;
        }

        .pillar-card h4 {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .pillar-card p {
            font-size: 0.92rem;
            color: var(--text-muted);
            line-height: 1.6;
        }

        /* CTA */
        .cta-banner {
            background: linear-gradient(135deg, var(--primary), var(--primary-hover));
            color: var(--white);
            border-radius: 20px;
            padding: 4rem 3rem;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1.5rem;
            box-shadow: 0 15px 35px rgba(11, 94, 40, 0.2);
        }

        .cta-banner h2 {
            font-size: 2.4rem;
            font-weight: 800;
        }

        .cta-banner p {
            font-size: 1.1rem;
            color: #d1fae5;
            max-width: 600px;
            line-height: 1.6;
        }

        .btn-cta {
            background-color: var(--white);
            color: var(--primary);
            padding: 0.9rem 2.5rem;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            font-size: 1rem;
            transition: all 0.25s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .btn-cta:hover {
            background-color: #f3f4f6;
            transform: translateY(-2px);
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
            .story-grid, .vm-grid {
                grid-template-columns: 1fr;
            }
            .story-img img {
                height: 320px;
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
            <li><a href="${pageContext.request.contextPath}/about" class="active">About Us</a></li>
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

    <!-- 2. Inner Banner -->
    <div class="inner-banner">
        <h1>About Ceylon Lands</h1>
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/home"><i class="bi bi-house-door-fill"></i> Home</a></li>
            <li class="breadcrumb-separator"><i class="bi bi-chevron-right"></i></li>
            <li>About Us</li>
        </ul>
    </div>

    <!-- 3. Main Page Content -->
    <div class="page-container">

        <!-- Story Section -->
        <div class="story-grid">
            <div class="story-img">
                <img src="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800&q=80" alt="About Ceylon Lands">
                <div class="story-badge">
                    <h3>15+</h3>
                    <p>Years of Trust in Real Estate</p>
                </div>
            </div>
            <div class="story-content">
                <span class="sub-title">Who We Are</span>
                <h2>Pioneering Sri Lanka's Most Transparent Land Sales</h2>
                <p>Ceylon Lands was founded with a singular ambition: to eliminate ambiguity and risk from land purchases across Sri Lanka. Every plot in our portfolio is selected for prime livability, rapid capital growth, and verified legal purity.</p>
                <p>From residential plots in bustling suburban corridors like Homagama and Malabe, to scenic agricultural and commercial properties island-wide, we connect forward-looking buyers with unencumbered title deeds and state-of-the-art infrastructure.</p>
            </div>
        </div>

        <!-- Trust Numbers -->
        <div class="stats-section">
            <div class="stats-grid">
                <div class="stat-item">
                    <h3>5,000+</h3>
                    <p>Plots Delivered</p>
                </div>
                <div class="stat-item">
                    <h3>100%</h3>
                    <p>Clear Title Deeds</p>
                </div>
                <div class="stat-item">
                    <h3>18</h3>
                    <p>Districts Covered</p>
                </div>
                <div class="stat-item">
                    <h3>4.9★</h3>
                    <p>Client Satisfaction</p>
                </div>
            </div>
        </div>

        <!-- Vision & Mission -->
        <div class="vm-grid">
            <div class="vm-card">
                <div class="vm-icon"><i class="bi bi-eye-fill"></i></div>
                <h3>Our Vision</h3>
                <p>To be the premier, most reliable real estate ecosystem in Sri Lanka, creating lasting legacy value for generations of homeowners and investors.</p>
            </div>
            <div class="vm-card">
                <div class="vm-icon"><i class="bi bi-compass-fill"></i></div>
                <h3>Our Mission</h3>
                <p>Delivering high-value, legally audited land properties with direct infrastructure, flexible financing options, and transparent customer service at every step.</p>
            </div>
        </div>

        <!-- Pillars of Trust -->
        <div>
            <div class="section-header">
                <h2>Our Core <span>Pillars of Trust</span></h2>
                <p>Why thousands of local and overseas Sri Lankans choose TerraSales as their land partner.</p>
            </div>

            <div class="pillars-grid">
                <div class="pillar-card">
                    <div class="pillar-icon"><i class="bi bi-shield-check"></i></div>
                    <h4>100% Legal Clearance</h4>
                    <p>Every plot undergoes rigorous 30-year deed history audits and land registry verification by certified legal practitioners.</p>
                </div>
                <div class="pillar-card">
                    <div class="pillar-icon"><i class="bi bi-lightning-charge-fill"></i></div>
                    <h4>Infrastructure Ready</h4>
                    <p>All projects come developed with three-phase electricity, pipe-borne water supply, wide carpeted access roads, and stormwater drainage.</p>
                </div>
                <div class="pillar-card">
                    <div class="pillar-icon"><i class="bi bi-bank"></i></div>
                    <h4>Bank Loan Support</h4>
                    <p>Tie-ups with leading private and state commercial banks for swift mortgage approvals and customized installment schedules.</p>
                </div>
                <div class="pillar-card">
                    <div class="pillar-icon"><i class="bi bi-person-check-fill"></i></div>
                    <h4>Dedicated Property Officers</h4>
                    <p>Personalized property tours, on-site survey inspections, and deed registration coordination handled for you from start to finish.</p>
                </div>
            </div>
        </div>

        <!-- Call to Action Banner -->
        <div class="cta-banner">
            <h2>Ready to Invest in Your Future?</h2>
            <p>Explore our latest residential and commercial land plots available for booking across Sri Lanka today.</p>
            <a href="${pageContext.request.contextPath}/properties" class="btn-cta">Explore Available Lands</a>
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

</body>
</html>

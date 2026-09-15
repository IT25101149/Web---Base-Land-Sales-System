<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Ceylon Lands Real Estate Sri Lanka</title>
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

        /* 3. Page Layout */
        .page-container {
            max-width: 1250px;
            margin: 0 auto;
            padding: 5rem 5%;
            display: flex;
            flex-direction: column;
            gap: 5rem;
        }

        /* Contact Quick Cards */
        .quick-contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 2rem;
            margin-top: -7.5rem;
            position: relative;
            z-index: 10;
        }

        .contact-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 2.2rem 1.8rem;
            box-shadow: 0 15px 35px rgba(7, 18, 10, 0.08);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            gap: 0.75rem;
            transition: all 0.3s ease;
        }

        .contact-card:hover {
            transform: translateY(-6px);
            border-color: var(--primary);
            box-shadow: 0 20px 40px rgba(7, 18, 10, 0.12);
        }

        .card-icon {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: rgba(11, 94, 40, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            margin-bottom: 0.5rem;
        }

        .contact-card h3 {
            font-size: 1.2rem;
            font-weight: 700;
            color: var(--text-dark);
        }

        .contact-card p {
            font-size: 0.95rem;
            color: var(--text-muted);
            line-height: 1.5;
        }

        .contact-card a.link-action {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
            font-size: 0.95rem;
            margin-top: auto;
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            transition: gap 0.2s ease;
        }

        .contact-card a.link-action:hover {
            gap: 0.6rem;
            color: var(--primary-hover);
        }

        /* Form + Branches 2-Column Section */
        .form-section-grid {
            display: grid;
            grid-template-columns: 1.3fr 1fr;
            gap: 3.5rem;
        }

        /* Contact Form */
        .form-box {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 3rem 2.5rem;
            box-shadow: 0 10px 30px rgba(7, 18, 10, 0.03);
        }

        .form-box h2 {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
        }

        .form-box p.desc {
            color: var(--text-muted);
            font-size: 0.95rem;
            margin-bottom: 2rem;
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

        .form-group input, .form-group textarea, .form-group select {
            padding: 0.85rem 1rem;
            border: 1px solid #ccd9d0;
            border-radius: 8px;
            font-size: 0.95rem;
            outline: none;
            background-color: var(--white);
            color: var(--text-dark);
            transition: all 0.25s ease;
        }

        .form-group input:focus, .form-group textarea:focus, .form-group select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(11, 94, 40, 0.15);
        }

        .btn-submit {
            background-color: var(--primary);
            color: var(--white);
            border: none;
            padding: 0.95rem 2rem;
            border-radius: 8px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            transition: all 0.25s ease;
            text-transform: uppercase;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(11, 94, 40, 0.2);
            margin-top: 0.5rem;
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        .alert-success {
            background-color: rgba(16, 185, 129, 0.1);
            border: 1px solid var(--success);
            color: #065f46;
            padding: 1.1rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 600;
            font-size: 0.95rem;
        }

        /* Branch Network */
        .branches-box {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .branches-box h2 {
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-dark);
        }

        .branch-item {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            padding: 1.5rem;
            display: flex;
            gap: 1rem;
            transition: all 0.25s ease;
        }

        .branch-item:hover {
            border-color: var(--secondary);
            box-shadow: 0 8px 25px rgba(212, 175, 55, 0.12);
        }

        .branch-icon {
            font-size: 1.5rem;
            color: var(--secondary);
            margin-top: 0.2rem;
        }

        .branch-details h4 {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--text-dark);
            margin-bottom: 0.25rem;
        }

        .branch-details p {
            font-size: 0.88rem;
            color: var(--text-muted);
            line-height: 1.5;
        }

        .branch-details .phone {
            font-size: 0.88rem;
            font-weight: 600;
            color: var(--primary);
            margin-top: 0.4rem;
            display: block;
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
            .form-section-grid {
                grid-template-columns: 1fr;
            }
            .quick-contact-grid {
                margin-top: 0;
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
            <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
            <li><a href="${pageContext.request.contextPath}/how-it-works">How It Works</a></li>
            <li><a href="${pageContext.request.contextPath}/contact" class="active">Contact</a></li>
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
        <h1>Contact Us</h1>
        <ul class="breadcrumb">
            <li><a href="${pageContext.request.contextPath}/home"><i class="bi bi-house-door-fill"></i> Home</a></li>
            <li class="breadcrumb-separator"><i class="bi bi-chevron-right"></i></li>
            <li>Contact Us</li>
        </ul>
    </div>

    <!-- 3. Main Content Container -->
    <div class="page-container">

        <!-- 3 Quick Contact Cards -->
        <div class="quick-contact-grid">
            <div class="contact-card">
                <div class="card-icon"><i class="bi bi-telephone-inbound-fill"></i></div>
                <h3>Hotline Inquiries</h3>
                <p>Speak directly with our property consultants.</p>
                <a href="tel:+94115557890" class="link-action">+94 11 555 7890 <i class="bi bi-arrow-right"></i></a>
            </div>

            <div class="contact-card">
                <div class="card-icon" style="color: #25d366; background-color: rgba(37, 211, 102, 0.1);"><i class="bi bi-whatsapp"></i></div>
                <h3>WhatsApp Support</h3>
                <p>Fast responses, layout maps & reservation info.</p>
                <a href="https://wa.me/+94771234567" target="_blank" class="link-action" style="color: #128c7e;">Chat on WhatsApp <i class="bi bi-arrow-right"></i></a>
            </div>

            <div class="contact-card">
                <div class="card-icon"><i class="bi bi-envelope-open-fill"></i></div>
                <h3>Email Us</h3>
                <p>Send documentation and inquiry requests.</p>
                <a href="mailto:info@ceylonlands.lk" class="link-action">info@ceylonlands.lk <i class="bi bi-arrow-right"></i></a>
            </div>
        </div>

        <!-- Form + Branches -->
        <div class="form-section-grid">
            
            <!-- Contact Form Box -->
            <div class="form-box">
                <c:if test="${param.success == 'true'}">
                    <div class="alert-success">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>Thank you! Your message has been received. Our land sales team will get back to you promptly.</span>
                    </div>
                </c:if>

                <h2>Send Us a Message</h2>
                <p class="desc">Interested in a plot or looking for custom land investment guidance? Fill out the form below.</p>

                <form action="${pageContext.request.contextPath}/contact/submit" method="post">
                    <div class="form-group">
                        <label for="name">Your Name</label>
                        <input type="text" id="name" name="name" required placeholder="e.g. John Doe">
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" required placeholder="e.g. john@example.com">
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="text" id="phone" name="phone" required placeholder="e.g. +94 77 123 4567">
                    </div>

                    <div class="form-group">
                        <label for="message">Your Message</label>
                        <textarea id="message" name="message" rows="5" required placeholder="Tell us which location or perch size you are interested in..."></textarea>
                    </div>

                    <button type="submit" class="btn-submit">Submit Message</button>
                </form>
            </div>

            <!-- Branch Network -->
            <div class="branches-box">
                <h2>Our Locations</h2>

                <div class="branch-item">
                    <i class="bi bi-geo-alt-fill branch-icon"></i>
                    <div class="branch-details">
                        <h4>Colombo Head Office</h4>
                        <p>No. 104, Union Place, Colombo 02, Sri Lanka</p>
                        <span class="phone"><i class="bi bi-telephone-fill"></i> +94 11 555 7890</span>
                    </div>
                </div>

                <div class="branch-item">
                    <i class="bi bi-geo-alt-fill branch-icon"></i>
                    <div class="branch-details">
                        <h4>Kandy Regional Hub</h4>
                        <p>No. 45, Peradeniya Road, Kandy</p>
                        <span class="phone"><i class="bi bi-telephone-fill"></i> +94 81 222 3456</span>
                    </div>
                </div>

                <div class="branch-item">
                    <i class="bi bi-geo-alt-fill branch-icon"></i>
                    <div class="branch-details">
                        <h4>Galle Coastal Branch</h4>
                        <p>No. 12, Matara Road, Galle Fort</p>
                        <span class="phone"><i class="bi bi-telephone-fill"></i> +94 91 333 4567</span>
                    </div>
                </div>

                <div class="branch-item">
                    <i class="bi bi-geo-alt-fill branch-icon"></i>
                    <div class="branch-details">
                        <h4>Gampaha Branch</h4>
                        <p>No. 88, Yakkala Road, Gampaha</p>
                        <span class="phone"><i class="bi bi-telephone-fill"></i> +94 33 444 5678</span>
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

</body>
</html>

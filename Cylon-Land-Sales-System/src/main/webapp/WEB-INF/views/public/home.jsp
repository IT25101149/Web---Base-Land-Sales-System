<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ceylon Lands | Prime Land Sales & Real Estate Sri Lanka</title>
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

        html {
            scroll-behavior: smooth;
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
            overflow-x: hidden;
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
            transition: all 0.3s ease;
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

        .btn-portal {
            background-color: var(--primary);
            color: var(--white) !important;
            padding: 0.55rem 1.3rem;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.9rem;
            transition: all 0.25s ease;
            text-decoration: none;
            border: 1px solid var(--primary);
        }

        .btn-portal:hover {
            background-color: var(--primary-hover);
            border-color: var(--primary-hover);
            box-shadow: 0 4px 15px rgba(11, 94, 40, 0.3);
        }

        /* 2. Hero Section Slider */
        .hero-container {
            position: relative;
            height: 80vh;
            min-height: 550px;
            width: 100%;
            overflow: hidden;
        }

        .hero-slide {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-size: cover;
            background-position: center;
            opacity: 0;
            animation: slideShow 18s infinite;
        }

        .hero-slide:nth-child(1) {
            background-image: linear-gradient(rgba(7, 18, 10, 0.65), rgba(7, 18, 10, 0.65)), url('https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=1600&q=80');
            animation-delay: 0s;
        }

        .hero-slide:nth-child(2) {
            background-image: linear-gradient(rgba(7, 18, 10, 0.65), rgba(7, 18, 10, 0.65)), url('https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=1600&q=80');
            animation-delay: 6s;
        }

        .hero-slide:nth-child(3) {
            background-image: linear-gradient(rgba(7, 18, 10, 0.65), rgba(7, 18, 10, 0.65)), url('https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=1600&q=80');
            animation-delay: 12s;
        }

        @keyframes slideShow {
            0% { opacity: 0; transform: scale(1); }
            6% { opacity: 1; }
            33% { opacity: 1; }
            39% { opacity: 0; transform: scale(1.05); }
            100% { opacity: 0; }
        }

        .hero-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -55%);
            text-align: center;
            color: var(--white);
            z-index: 10;
            width: 90%;
            max-width: 900px;
        }

        .hero-tagline {
            color: var(--secondary);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 4px;
            font-weight: 700;
            margin-bottom: 1rem;
            display: inline-block;
            border-bottom: 2px solid var(--secondary);
            padding-bottom: 0.5rem;
        }

        .hero-content h1 {
            font-size: 3.8rem;
            font-weight: 800;
            line-height: 1.15;
            margin-bottom: 1.5rem;
            text-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .hero-content h1 span {
            color: var(--secondary);
        }

        .hero-content p {
            font-size: 1.15rem;
            color: #e2e8f0;
            max-width: 700px;
            margin: 0 auto 2rem auto;
            line-height: 1.6;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        }

        .hero-buttons {
            display: flex;
            gap: 1.25rem;
            justify-content: center;
        }

        .btn-hero-primary {
            background-color: var(--secondary);
            color: var(--dark-header);
            padding: 0.9rem 2.2rem;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.25s ease;
            box-shadow: 0 4px 15px rgba(212, 175, 55, 0.4);
            font-size: 1rem;
        }

        .btn-hero-primary:hover {
            background-color: var(--secondary-hover);
            transform: translateY(-2px);
        }

        .btn-hero-secondary {
            background-color: rgba(255, 255, 255, 0.1);
            color: var(--white);
            padding: 0.9rem 2.2rem;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            border: 1px solid rgba(255, 255, 255, 0.3);
            transition: all 0.25s ease;
            font-size: 1rem;
            backdrop-filter: blur(5px);
        }

        .btn-hero-secondary:hover {
            background-color: rgba(255, 255, 255, 0.25);
            transform: translateY(-2px);
        }

        /* 3. Search Land Floating Panel */
        .search-section {
            margin-top: -4.5rem;
            margin-bottom: 3.5rem;
            padding: 0 5%;
            z-index: 100;
            position: relative;
        }

        .search-wrapper {
            background: rgba(255, 255, 255, 0.95);
            border: 1px solid var(--border);
            padding: 2.2rem 2.5rem;
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(7, 18, 10, 0.12);
            max-width: 1100px;
            margin: 0 auto;
            backdrop-filter: blur(10px);
        }

        .search-wrapper h3 {
            font-size: 1.15rem;
            color: var(--primary);
            font-weight: 700;
            margin-bottom: 1.2rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .search-wrapper h3::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .search-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)) 160px;
            gap: 1.25rem;
            align-items: end;
        }

        .input-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .input-group label {
            font-size: 0.78rem;
            color: var(--text-muted);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .input-group select, .input-group input {
            padding: 0.85rem 1rem;
            border: 1px solid #ccd9d0;
            border-radius: 8px;
            font-size: 0.95rem;
            outline: none;
            background-color: var(--white);
            color: var(--text-dark);
            transition: all 0.25s ease;
        }

        .input-group select:focus, .input-group input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(11, 94, 40, 0.15);
        }

        .btn-search-submit {
            background-color: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 8px;
            padding: 0.9rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.25s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 1rem;
            box-shadow: 0 4px 12px rgba(11, 94, 40, 0.2);
        }

        .btn-search-submit:hover {
            background-color: var(--primary-hover);
            transform: translateY(-1px);
        }

        /* 4. Featured Lands Section */
        .section-container {
            padding: 6rem 5% 4rem 5%;
            max-width: 1250px;
            margin: 0 auto;
        }

        .section-header {
            text-align: center;
            margin-bottom: 4rem;
            position: relative;
        }

        .section-header h2 {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-dark);
        }

        .section-header h2 span {
            color: var(--primary);
        }

        .section-header p {
            color: var(--text-muted);
            margin-top: 0.75rem;
            font-size: 1.1rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .section-header::after {
            content: '';
            display: block;
            width: 70px;
            height: 3px;
            background-color: var(--secondary);
            margin: 1.25rem auto 0 auto;
            border-radius: 2px;
        }

        /* ============================================================
           4. PRIME LANDS STYLE: EXPLORE OUR LATEST LISTINGS SECTION
           ============================================================ */
        .explore-listings-section {
            background: linear-gradient(135deg, #1b3f2c 0%, #28543b 50%, #163625 100%);
            background-image: radial-gradient(circle at 85% 20%, rgba(212, 175, 55, 0.15) 0%, transparent 45%),
                              radial-gradient(circle at 15% 85%, rgba(0, 0, 0, 0.25) 0%, transparent 50%),
                              linear-gradient(135deg, #1b3f2c 0%, #28543b 50%, #163625 100%);
            padding: 5.5rem 5% 10.5rem 5%;
            position: relative;
            color: var(--white);
            border-top: 1px solid rgba(212, 175, 55, 0.2);
        }

        .explore-header {
            max-width: 1350px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 2.5rem;
            flex-wrap: wrap;
        }

        .explore-title-box {
            max-width: 700px;
        }

        .title-with-bar {
            display: flex;
            align-items: center;
            gap: 0.85rem;
            margin-bottom: 0.75rem;
        }

        .title-with-bar .accent-bar {
            width: 4px;
            height: 38px;
            background-color: var(--secondary);
            border-radius: 2px;
            display: inline-block;
        }

        .title-with-bar h2 {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--white);
            letter-spacing: -0.5px;
            line-height: 1.15;
        }

        .explore-subtitle {
            font-size: 0.98rem;
            color: rgba(255, 255, 255, 0.85);
            line-height: 1.65;
            font-weight: 400;
            padding-left: 1.1rem;
        }

        .explore-tabs {
            display: flex;
            background: rgba(255, 255, 255, 0.95);
            padding: 0.35rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            gap: 0.35rem;
            flex-wrap: wrap;
        }

        .tab-btn {
            background: transparent;
            border: none;
            outline: none;
            padding: 0.75rem 1.4rem;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.9rem;
            color: #374151;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.25s ease;
        }

        .tab-btn i {
            font-size: 1.05rem;
        }

        .tab-btn.active {
            background-color: var(--primary);
            color: var(--white);
            box-shadow: 0 4px 12px rgba(11, 94, 40, 0.35);
        }

        .tab-btn:hover:not(.active) {
            background-color: #f3f4f6;
            color: #111827;
        }

        /* Overlapping Prime Cards Grid */
        .explore-cards-wrapper {
            max-width: 1350px;
            width: 100%;
            margin: -7rem auto 5rem auto;
            padding: 0 5%;
            position: relative;
            z-index: 20;
        }

        .prime-listings-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 2rem;
            width: 100%;
        }

        @media (max-width: 1080px) {
            .prime-listings-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .explore-cards-wrapper {
                margin-top: -4.5rem;
            }
            .explore-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1.5rem;
            }
            .title-with-bar h2 {
                font-size: 2rem;
            }
            .explore-tabs {
                width: 100%;
            }
            .tab-btn {
                flex: 1;
                justify-content: center;
                padding: 0.65rem 0.9rem;
                font-size: 0.82rem;
            }
        }

        @media (max-width: 680px) {
            .prime-listings-grid {
                grid-template-columns: 1fr;
                gap: 1.25rem;
            }
        }

        /* Prime Card Styling */
        .prime-card {
            background: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.07);
            display: flex;
            flex-direction: column;
            text-decoration: none;
            transition: all 0.35s cubic-bezier(0.165, 0.84, 0.44, 1);
            position: relative;
            border: 1px solid rgba(0, 0, 0, 0.06);
        }

        .prime-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.14);
            border-color: rgba(11, 94, 40, 0.3);
        }

        .prime-poster-wrap {
            height: 230px;
            position: relative;
            overflow: hidden;
            background-color: #0f172a;
        }

        .prime-poster-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.65s cubic-bezier(0.165, 0.84, 0.44, 1);
        }

        .prime-card:hover .prime-poster-wrap img {
            transform: scale(1.08);
        }

        .prime-tag-badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: rgba(7, 18, 10, 0.85);
            color: var(--secondary);
            font-size: 0.72rem;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0.35rem 0.85rem;
            border-radius: 30px;
            backdrop-filter: blur(8px);
            border: 1px solid rgba(212, 175, 55, 0.4);
            z-index: 5;
        }

        .prime-verified-badge {
            position: absolute;
            bottom: 0.85rem;
            left: 0.85rem;
            background: rgba(11, 94, 40, 0.9);
            color: #d1fae5;
            font-size: 0.72rem;
            font-weight: 700;
            padding: 0.28rem 0.7rem;
            border-radius: 20px;
            backdrop-filter: blur(6px);
            display: flex;
            align-items: center;
            gap: 0.35rem;
            z-index: 5;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .prime-card-body {
            padding: 1.35rem 1.25rem 1.4rem 1.25rem;
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
            background: var(--white);
            flex: 1;
        }

        .prime-card-title {
            font-size: 1.12rem;
            font-weight: 800;
            color: #111827;
            line-height: 1.35;
            transition: color 0.2s ease;
        }

        .prime-card:hover .prime-card-title {
            color: var(--primary);
        }

        .prime-card-meta {
            display: flex;
            align-items: center;
            gap: 1.1rem;
            font-size: 0.84rem;
            color: #64748b;
            font-weight: 600;
        }

        .prime-card-location, .prime-card-extent {
            display: flex;
            align-items: center;
            gap: 0.35rem;
        }

        .prime-card-location i {
            color: #ef4444;
            font-size: 0.92rem;
        }

        .prime-card-extent i {
            color: var(--primary);
            font-size: 0.92rem;
        }

        .prime-card-price-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: auto;
            padding-top: 0.85rem;
            border-top: 1px dashed #e5e7eb;
        }

        .prime-price-group {
            display: flex;
            align-items: baseline;
            gap: 0.35rem;
        }

        .prime-price-value {
            font-size: 1.25rem;
            font-weight: 850;
            color: #0f172a;
        }

        .prime-price-unit {
            font-size: 0.78rem;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
        }

        .btn-view-plot {
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.3rem;
            transition: all 0.2s ease;
        }

        .prime-card:hover .btn-view-plot {
            color: var(--secondary-hover);
            transform: translateX(3px);
        }

        /* 5. Why Choose Us Section */
        .why-choose-us {
            background-color: #0c1912;
            color: var(--white);
            padding: 6rem 5%;
            position: relative;
        }

        .why-choose-us::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--secondary));
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2.5rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            padding: 2.5rem 2rem;
            border-radius: 16px;
            transition: all 0.3s ease;
            position: relative;
        }

        .feature-card:hover {
            background: rgba(255, 255, 255, 0.06);
            transform: translateY(-5px);
            border-color: rgba(212, 175, 55, 0.4);
        }

        .feature-icon {
            width: 65px;
            height: 65px;
            border-radius: 12px;
            background-color: rgba(212, 175, 55, 0.15);
            color: var(--secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .feature-card h3 {
            font-size: 1.35rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            color: var(--white);
        }

        .feature-card p {
            font-size: 0.95rem;
            color: #94a3b8;
            line-height: 1.6;
        }

        /* 6. How It Works */
        .how-it-works {
            padding: 6rem 5%;
            background-color: var(--bg-color);
        }

        .steps-container {
            display: flex;
            justify-content: space-between;
            max-width: 1100px;
            margin: 0 auto;
            flex-wrap: wrap;
            gap: 2.5rem;
            position: relative;
        }

        .step-item {
            flex: 1;
            min-width: 220px;
            text-align: center;
            background: var(--white);
            padding: 2.5rem 2rem;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(7, 18, 10, 0.02);
            border: 1px solid var(--border);
            transition: all 0.3s ease;
        }

        .step-item:hover {
            transform: translateY(-4px);
            box-shadow: 0 15px 30px rgba(7, 18, 10, 0.06);
            border-color: var(--primary);
        }

        .step-number {
            font-size: 3rem;
            font-weight: 900;
            color: rgba(11, 94, 40, 0.12);
            margin-bottom: 0.5rem;
            font-family: 'Outfit', sans-serif;
            line-height: 1;
        }

        .step-item h3 {
            font-size: 1.25rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            color: var(--text-dark);
        }

        .step-item p {
            font-size: 0.9rem;
            color: var(--text-muted);
            line-height: 1.6;
        }

        /* 7. Land Categories */
        .categories-section {
            background-color: var(--white);
            padding: 6rem 5%;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.5rem;
            max-width: 1100px;
            margin: 0 auto;
        }

        .category-card {
            background: var(--bg-color);
            border: 1px solid var(--border);
            padding: 2rem;
            border-radius: 16px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
            text-decoration: none;
            color: inherit;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .category-card:hover {
            border-color: var(--secondary);
            background-color: var(--white);
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(212, 175, 55, 0.15);
        }

        .category-icon {
            font-size: 2.8rem;
        }

        .category-card h3 {
            font-size: 1.15rem;
            font-weight: 700;
            color: var(--text-dark);
        }

        /* 8. Customer Reviews */
        .reviews-section {
            padding: 6rem 5%;
            background-color: var(--bg-color);
        }

        .reviews-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
            max-width: 1100px;
            margin: 0 auto;
        }

        .review-card {
            border: 1px solid var(--border);
            padding: 2.5rem 2.2rem;
            border-radius: 16px;
            background-color: var(--white);
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
            box-shadow: 0 8px 25px rgba(7, 18, 10, 0.02);
            position: relative;
        }

        .review-card::before {
            content: "\201C";
            position: absolute;
            top: 1rem;
            right: 2rem;
            font-size: 4rem;
            color: rgba(11, 94, 40, 0.08);
            font-family: serif;
            line-height: 1;
        }

        .stars {
            color: var(--secondary);
            font-size: 1.1rem;
            letter-spacing: 2px;
        }

        .review-text {
            font-size: 1rem;
            line-height: 1.6;
            font-style: italic;
            color: var(--text-dark);
        }

        .reviewer-name {
            font-weight: 700;
            font-size: 0.95rem;
            color: var(--primary);
            margin-top: auto;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        /* 9. Newly Added Lands */
        .latest-section {
            padding: 6rem 5%;
            background-color: var(--white);
        }

        .latest-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .latest-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 14px;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            text-decoration: none;
            color: inherit;
            transition: all 0.3s cubic-bezier(0.165, 0.84, 0.44, 1);
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
        }

        .latest-card:hover {
            transform: translateY(-6px);
            border-color: var(--primary);
            box-shadow: 0 15px 30px rgba(11, 94, 40, 0.1);
        }

        .latest-img-wrap {
            height: 190px;
            position: relative;
            overflow: hidden;
            background-color: #0f172a;
        }

        .latest-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .latest-card:hover .latest-img-wrap img {
            transform: scale(1.05);
        }

        .latest-type-tag {
            position: absolute;
            top: 0.75rem;
            right: 0.75rem;
            background: rgba(7, 18, 10, 0.8);
            color: var(--secondary);
            font-size: 0.7rem;
            font-weight: 800;
            padding: 0.25rem 0.65rem;
            border-radius: 20px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .latest-info {
            padding: 1.25rem 1.35rem;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            flex: 1;
        }

        .latest-info h4 {
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--text-dark);
            line-height: 1.35;
        }

        .latest-meta {
            display: flex;
            align-items: center;
            gap: 1rem;
            font-size: 0.82rem;
            color: var(--text-muted);
        }

        .latest-meta span {
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        .latest-price-row {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-top: auto;
            padding-top: 0.75rem;
            border-top: 1px dashed #e2e8f0;
        }

        .latest-price {
            font-weight: 800;
            font-size: 1.1rem;
            color: var(--text-dark);
        }

        .latest-price small {
            font-size: 0.75rem;
            color: #64748b;
            font-weight: 600;
        }

        .latest-link {
            font-size: 0.85rem;
            font-weight: 700;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        /* 10. Call-to-Action */
        .cta-section {
            background: linear-gradient(135deg, var(--primary), var(--primary-hover));
            color: var(--white);
            text-align: center;
            padding: 6.5rem 5%;
            position: relative;
            overflow: hidden;
        }

        .cta-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -30%;
            width: 80%;
            height: 200%;
            background: rgba(255, 255, 255, 0.03);
            transform: rotate(30deg);
            pointer-events: none;
        }

        .cta-section h2 {
            font-size: 2.6rem;
            font-weight: 800;
            margin-bottom: 1rem;
            position: relative;
            z-index: 5;
        }

        .cta-section p {
            color: #d1fae5;
            margin-bottom: 2.2rem;
            font-size: 1.2rem;
            max-width: 650px;
            margin-left: auto;
            margin-right: auto;
            position: relative;
            z-index: 5;
            line-height: 1.6;
        }

        .cta-btns {
            display: flex;
            gap: 1.25rem;
            justify-content: center;
            position: relative;
            z-index: 5;
        }

        .btn-cta-white {
            background-color: var(--white);
            color: var(--primary);
            padding: 0.9rem 2.2rem;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.25s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .btn-cta-white:hover {
            background-color: #f3f4f6;
            transform: translateY(-2px);
        }

        .btn-cta-outline {
            border: 2px solid rgba(255,255,255,0.7);
            color: var(--white);
            padding: 0.9rem 2.2rem;
            border-radius: 6px;
            font-weight: 700;
            text-decoration: none;
            background: transparent;
            transition: all 0.25s ease;
        }

        .btn-cta-outline:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        /* 11. Footer */
        footer {
            background-color: var(--dark-header);
            color: #94a3b8;
            padding: 6rem 5% 3rem 5%;
            border-top: 3px solid var(--secondary);
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
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 2.5rem;
            }
            .hero-buttons, .cta-btns {
                flex-direction: column;
                align-items: stretch;
            }
            .search-section {
                margin-top: -2.5rem;
            }
            .search-grid {
                grid-template-columns: 1fr;
            }
            nav {
                flex-direction: column;
                gap: 1rem;
                padding: 1.25rem 5%;
            }
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }
        }
    </style>
</head>
<body>

    <!-- 1. Navigation Bar -->
    <nav>
        <a href="${pageContext.request.contextPath}/home" class="logo" style="text-decoration: none;">
            <img src="${pageContext.request.contextPath}/uploads/ceylon-lands-logo.jpg" alt="Ceylon Lands" style="height: 46px; width: 46px; border-radius: 10px; object-fit: cover; border: 2px solid #d4af37; box-shadow: 0 4px 10px rgba(0,0,0,0.35);">
            <div style="display: flex; flex-direction: column; line-height: 1.15;">
                <span style="font-family: 'Outfit', sans-serif; font-weight: 800; font-size: 1.45rem; letter-spacing: 0.5px; color: #ffffff;">Ceylon<span class="highlight" style="color: var(--secondary);">Lands</span></span>
                <span style="font-size: 0.62rem; text-transform: uppercase; letter-spacing: 1.5px; color: #94a3b8; font-weight: 600;">Prime Land Sales &amp; Development</span>
            </div>
        </a>
        <ul class="nav-links">
            <li><a href="${pageContext.request.contextPath}/home" class="active">Home</a></li>
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

    <!-- 2. Hero Slider Section -->
    <div class="hero-container">
        <div class="hero-slide"></div>
        <div class="hero-slide"></div>
        <div class="hero-slide"></div>
        
        <div class="hero-content">
            <span class="hero-tagline">Premium Land Deals</span>
            <h1>Find Your Dream Land with <span>Absolute Trust</span></h1>
            <p>Discover verified properties, audit real-time survey details, and book your plot instantly through our simplified portal.</p>
            <div class="hero-buttons">
                <a href="${pageContext.request.contextPath}/properties" class="btn-hero-primary">Explore Catalog</a>
                <a href="#search-land" class="btn-hero-secondary">Quick Search</a>
            </div>
        </div>
    </div>

    <!-- 3. Land Search Floating Panel -->
    <div class="search-section" id="search-land">
        <form action="${pageContext.request.contextPath}/properties" method="get" class="search-wrapper">
            <h3><i class="bi bi-funnel"></i> Land Search Engine</h3>
            <div class="search-grid">
                <div class="input-group">
                    <label for="location">Location / District</label>
                    <select id="location" name="location">
                        <option value="">All Locations</option>
                        <c:forEach var="loc" items="${locations}">
                            <option value="${loc}">${loc}</option>
                        </c:forEach>
                        <c:if test="${empty locations}">
                            <option value="Colombo">Colombo</option>
                            <option value="Kandy">Kandy</option>
                            <option value="Galle">Galle</option>
                            <option value="Rathmalana">Rathmalana</option>
                        </c:if>
                    </select>
                </div>
                <div class="input-group">
                    <label for="type">Land Type</label>
                    <select id="type" name="type">
                        <option value="">All Land Types</option>
                        <option value="Residential">Residential Lands</option>
                        <option value="Commercial">Commercial Lands</option>
                        <option value="Agricultural">Agricultural Lands</option>
                        <option value="Industrial">Industrial Lands</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="maxPrice">Budget (Max LKR)</label>
                    <input type="number" id="maxPrice" name="maxPrice" placeholder="Max Price LKR">
                </div>
                <div class="input-group">
                    <label for="size">Perches (Min)</label>
                    <input type="number" id="size" name="size" placeholder="Min Size" step="0.5">
                </div>
                <button type="submit" class="btn-search-submit">
                    <i class="bi bi-search"></i> Search
                </button>
            </div>
        </form>
    </div>

    <!-- 6. Explore Latest Listings (Overlapping Banner Section) -->
    <div class="explore-listings-section">
        <div class="explore-header">
            <div class="explore-title-box">
                <div class="title-with-bar">
                    <span class="accent-bar"></span>
                    <h2>Explore Our Latest Land Listings</h2>
                </div>
                <p class="explore-subtitle">Browse through our prime land plots, legally verified with unencumbered clear title deeds and direct access routes. Click on any plot to explore detailed layout plans and specs.</p>
            </div>
            
            <div class="explore-tabs">
                <button class="tab-btn active" onclick="filterHomeLands('ALL', this)"><i class="bi bi-geo-alt-fill"></i> All Lands</button>
                <button class="tab-btn" onclick="filterHomeLands('RESIDENTIAL', this)"><i class="bi bi-tree-fill"></i> Residential Lands</button>
                <button class="tab-btn" onclick="filterHomeLands('COMMERCIAL', this)"><i class="bi bi-briefcase-fill"></i> Commercial Lands</button>
                <button class="tab-btn" onclick="filterHomeLands('AGRICULTURAL', this)"><i class="bi bi-flower1"></i> Agricultural Lands</button>
            </div>
        </div>
    </div>

    <!-- Overlapping Prime Cards Grid -->
    <div class="explore-cards-wrapper">
        <div class="prime-listings-grid" id="primeListingsGrid">
            <c:forEach var="prop" items="${featured}">
                <a href="${pageContext.request.contextPath}/properties/detail/${prop.id}" class="prime-card" data-category="${prop.type}">
                    <div class="prime-poster-wrap">
                        <img src="${prop.imageUrl != null && !prop.imageUrl.isEmpty() ? prop.imageUrl : 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=600'}" alt="${prop.title}">
                        <span class="prime-tag-badge">${prop.type != null ? prop.type : 'LAND'}</span>
                        <span class="prime-verified-badge"><i class="bi bi-patch-check-fill"></i> Clear Deeds</span>
                    </div>
                    <div class="prime-card-body">
                        <div class="prime-card-title">${prop.title}</div>
                        <div class="prime-card-meta">
                            <span class="prime-card-location"><i class="bi bi-geo-alt-fill"></i> ${prop.location}</span>
                            <c:if test="${prop.size != null}">
                                <span class="prime-card-extent"><i class="bi bi-bounding-box"></i> ${prop.size} Perches</span>
                            </c:if>
                        </div>
                        <div class="prime-card-price-row">
                            <div class="prime-price-group">
                                <span class="prime-price-value"><fmt:formatNumber value="${prop.price}" type="number" maxFractionDigits="0"/> LKR</span>
                                <span class="prime-price-unit">/ Perch</span>
                            </div>
                            <span class="btn-view-plot">View Plot <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </div>
                </a>
            </c:forEach>
            <div id="noLandsNotice" style="display: none; grid-column: 1 / -1; text-align: center; padding: 4rem 2rem; background: #fff; border-radius: 16px; border: 1px dashed #cbd5e1; box-shadow: 0 4px 20px rgba(0,0,0,0.04);">
                <i class="bi bi-geo-alt" style="font-size: 2.5rem; color: #94a3b8; margin-bottom: 0.5rem; display: block;"></i>
                <h4 style="font-weight: 700; color: #1e293b;">No lands found in this category right now</h4>
                <p style="color: #64748b; margin-top: 0.25rem;">Browse all available verified lands in our complete property catalog.</p>
                <a href="${pageContext.request.contextPath}/properties" class="btn-portal" style="display: inline-block; margin-top: 1.25rem;">Explore Full Catalog</a>
            </div>
        </div>
    </div>

    <!-- 5. Why Choose Us -->
    <div class="why-choose-us" id="why-us">
        <div class="section-header">
            <h2 style="color: var(--white);">Why Select <span style="color: var(--secondary);">Ceylon Lands?</span></h2>
            <p style="color: #cbd5e1;">Our core commitments define standard-setting legal checks and reservation operations.</p>
        </div>

        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-shield-fill-check"></i></div>
                <h3>100% Clear Deeds</h3>
                <p>We process every land plot through thorough corporate ownership background checks and clear deeds history audits.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-award-fill"></i></div>
                <h3>Best In-Class Locations</h3>
                <p>Curated lands in high-demand zones with electricity, pipe-borne water, and wide access highways.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="bi bi-wallet2"></i></div>
                <h3>Hassle-Free Reservations</h3>
                <p>Lock your ideal plot with a tiny online payment and pay in custom monthly installments.</p>
            </div>
        </div>
    </div>

    <!-- 6. How It Works -->
    <div class="how-it-works" id="how-it-works">
        <div class="section-header">
            <h2>The Purchase <span>Timeline</span></h2>
            <p>Get started with a direct path from scanning list blocks to signing ownership deeds.</p>
        </div>

        <div class="steps-container">
            <div class="step-item">
                <div class="step-number">01</div>
                <h3>Select Plot</h3>
                <p>Browse list blocks by location, perch sizes, and price boundaries.</p>
            </div>
            <div class="step-item">
                <div class="step-number">02</div>
                <h3>Review Documents</h3>
                <p>Request layouts, survey map scans, and verification logs instantly.</p>
            </div>
            <div class="step-item">
                <div class="step-number">03</div>
                <h3>Reserve</h3>
                <p>Submit your inquiry form and secure reservation priorities immediately.</p>
            </div>
            <div class="step-item">
                <div class="step-number">04</div>
                <h3>Complete Purchase</h3>
                <p>Finalize legal transactions and acquire absolute land title rights.</p>
            </div>
        </div>
    </div>

    <!-- 7. Land Categories -->
    <div class="categories-section">
        <div class="section-header">
            <h2>Explore <span>Land Classes</span></h2>
            <p>Filter lands dynamically relative to specific layout purposes.</p>
        </div>

        <div class="categories-grid">
            <a href="${pageContext.request.contextPath}/properties?type=Residential" class="category-card">
                <div class="category-icon">🌿</div>
                <h3>Residential Lands</h3>
            </a>
            <a href="${pageContext.request.contextPath}/properties?type=Commercial" class="category-card">
                <div class="category-icon">🏢</div>
                <h3>Commercial Lands</h3>
            </a>
            <a href="${pageContext.request.contextPath}/properties?type=Agricultural" class="category-card">
                <div class="category-icon">🌾</div>
                <h3>Agricultural Lands</h3>
            </a>
            <a href="${pageContext.request.contextPath}/properties?type=Industrial" class="category-card">
                <div class="category-icon">🏭</div>
                <h3>Industrial Lands</h3>
            </a>
        </div>
    </div>

    <!-- 8. Customer Reviews -->
    <div class="reviews-section">
        <div class="section-header">
            <h2>Client <span>Testimonials</span></h2>
            <p>Here is what buyers say about their direct land acquisition experiences.</p>
        </div>

        <div class="reviews-grid">
            <div class="review-card">
                <div class="stars">★★★★★</div>
                <p class="review-text">"Reserving our residential land in Colombo was fully transparent. No hidden charges and excellent customer service!"</p>
                <div class="reviewer-name">- Dilhan Mendis</div>
            </div>
            <div class="review-card">
                <div class="stars">★★★★★</div>
                <p class="review-text">"Survey certificates and plot deeds were provided for check instantly. Highly recommended real estate agency."</p>
                <div class="reviewer-name">- Nadeeka Perera</div>
            </div>
        </div>
    </div>

    <!-- 9. Newly Added Lands (High-Valuation & Recent Plots) -->
    <div class="latest-section">
        <div class="section-header">
            <h2>Newly Added <span>Investment Lands</span></h2>
            <p>Browse our most recently listed high-potential property plots with verified cadastral boundaries.</p>
        </div>

        <div class="latest-grid">
            <c:forEach var="prop" items="${not empty latest ? latest : featured}">
                <a href="${pageContext.request.contextPath}/properties/detail/${prop.id}" class="latest-card">
                    <div class="latest-img-wrap">
                        <img src="${prop.imageUrl != null && !prop.imageUrl.isEmpty() ? prop.imageUrl : 'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=600'}" alt="${prop.title}">
                        <span class="latest-type-tag">${prop.type != null ? prop.type : 'LAND'}</span>
                    </div>
                    <div class="latest-info">
                        <h4>${prop.title}</h4>
                        <div class="latest-meta">
                            <span><i class="bi bi-geo-alt-fill"></i> ${prop.location}</span>
                            <c:if test="${prop.size != null}">
                                <span><i class="bi bi-bounding-box"></i> ${prop.size} Perches</span>
                            </c:if>
                        </div>
                        <div class="latest-price-row">
                            <span class="latest-price"><fmt:formatNumber value="${prop.price}" type="number" maxFractionDigits="0"/> LKR <small>/ Perch</small></span>
                            <span class="latest-link">Details <i class="bi bi-arrow-right"></i></span>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>

    <!-- 10. Call-to-Action -->
    <div class="cta-section">
        <h2>Acquire Your Landmark Piece of Land Today</h2>
        <p>Connect with our expert sales team to schedule on-site viewings and request detailed survey maps.</p>
        <div class="cta-btns">
            <a href="${pageContext.request.contextPath}/properties" class="btn-cta-white">Explore Land Listings</a>
            <a href="${pageContext.request.contextPath}/contact" class="btn-cta-outline">Contact Sales Team</a>
        </div>
    </div>

    <!-- 11. Footer -->
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
                <p>The premier real estate authority designed for secure, legally verified, and prestigious land block reservation and conveyancing across Sri Lanka.</p>
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
                <h3>Our Services</h3>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/properties?type=Residential">Residential Blocks</a></li>
                    <li><a href="${pageContext.request.contextPath}/properties?type=Commercial">Commercial Plots</a></li>
                    <li><a href="${pageContext.request.contextPath}/properties?type=Agricultural">Agricultural Lands</a></li>
                    <li><a href="${pageContext.request.contextPath}/how-it-works">Instant Reservations</a></li>
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
    <!-- Interactive Tab Filter Script -->
    <script>
        function filterHomeLands(category, btn) {
            document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            
            const cards = document.querySelectorAll('.prime-card');
            let visibleCount = 0;
            cards.forEach(card => {
                const cardCat = card.getAttribute('data-category');
                if (category === 'ALL' || (cardCat && cardCat.toUpperCase() === category.toUpperCase())) {
                    card.style.display = 'flex';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            const notice = document.getElementById('noLandsNotice');
            if (notice) {
                notice.style.display = visibleCount === 0 ? 'block' : 'none';
            }
        }
    </script>

</body>
</html>

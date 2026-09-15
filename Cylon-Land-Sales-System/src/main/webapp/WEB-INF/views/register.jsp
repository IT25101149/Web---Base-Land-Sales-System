<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration - Ceylon Lands</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --primary: #6366f1;
            --primary-hover: #4f46e5;
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e1b4b 50%, #311042 100%);
            --glass-bg: rgba(255, 255, 255, 0.03);
            --glass-border: rgba(255, 255, 255, 0.08);
            --text-light: #f8fafc;
            --text-muted: #94a3b8;
            --success: #10b981;
            --error: #f43f5e;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            background: var(--bg-gradient);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
            position: relative;
            padding: 2rem 0;
        }

        /* Decorative background blobs */
        .blob {
            position: absolute;
            border-radius: 50%;
            filter: blur(100px);
            z-index: 0;
            opacity: 0.4;
        }

        .blob-1 {
            width: 400px;
            height: 400px;
            background: #4f46e5;
            top: -100px;
            left: -100px;
            animation: float 15s infinite alternate;
        }

        .blob-2 {
            width: 500px;
            height: 500px;
            background: #701a75;
            bottom: -150px;
            right: -100px;
            animation: float 18s infinite alternate-reverse;
        }

        @keyframes float {
            0% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(30px, -50px) scale(1.1); }
            100% { transform: translate(-20px, 20px) scale(0.9); }
        }

        .register-wrapper {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 950px;
            padding: 1.5rem;
            display: grid;
            grid-template-columns: 0.9fr 1.1fr;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(25px);
            -webkit-backdrop-filter: blur(25px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        @media (max-width: 768px) {
            .register-wrapper {
                grid-template-columns: 1fr;
            }
            .info-panel {
                display: none;
            }
        }

        /* Left Side: Info & Brand Panel */
        .info-panel {
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            background: linear-gradient(135deg, rgba(99, 102, 241, 0.15) 0%, rgba(168, 85, 247, 0.05) 100%);
            border-right: 1px solid var(--glass-border);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-size: 1.6rem;
            font-weight: 700;
            color: #fff;
            text-decoration: none;
        }

        .brand i {
            color: var(--primary);
            font-size: 1.8rem;
        }

        .info-content h2 {
            font-size: 2.2rem;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .info-content p {
            color: var(--text-muted);
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        .features {
            display: flex;
            flex-direction: column;
            gap: 1.25rem;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(99, 102, 241, 0.15);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 1.2rem;
        }

        .feature-text {
            font-weight: 500;
            font-size: 0.95rem;
        }

        /* Right Side: Form Panel */
        .form-panel {
            padding: 3rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-header {
            margin-bottom: 2rem;
        }

        .form-header h3 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .form-header p {
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        /* Input Styles */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        @media (max-width: 576px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            margin-bottom: 1.25rem;
            position: relative;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        @media (max-width: 576px) {
            .form-group.full-width {
                grid-column: span 1;
            }
        }

        .form-group label {
            display: block;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--text-muted);
            margin-bottom: 0.5rem;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 0.85rem 1rem 0.85rem 2.75rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            color: #fff;
            font-size: 1rem;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.08);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.15);
        }

        /* Error/Info Alerts */
        .alert {
            padding: 1rem;
            border-radius: 12px;
            font-size: 0.9rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            border: 1px solid transparent;
        }

        .alert-danger {
            background: rgba(244, 63, 94, 0.1);
            border-color: rgba(244, 63, 94, 0.2);
            color: var(--error);
        }

        .btn-submit {
            width: 100%;
            padding: 0.9rem;
            background: var(--primary);
            color: #fff;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
            margin-top: 1rem;
        }

        .btn-submit:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
        }

        .btn-submit:active {
            transform: translateY(0);
        }
        
        .footer-note {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .footer-note a {
            color: var(--primary);
            text-decoration: none;
        }
    </style>
</head>
<body>

    <!-- Blobs -->
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>

    <div class="register-wrapper">
        <!-- Left panel -->
        <div class="info-panel">
            <a href="${pageContext.request.contextPath}/home" class="brand" style="text-decoration: none; display: flex; align-items: center; gap: 0.75rem;">
                <img src="${pageContext.request.contextPath}/uploads/ceylon-lands-logo.jpg" alt="Ceylon Lands" style="height: 48px; width: 48px; border-radius: 10px; object-fit: cover; border: 2px solid #d4af37; box-shadow: 0 4px 12px rgba(0,0,0,0.3);">
                <div style="display: flex; flex-direction: column; line-height: 1.15;">
                    <span style="font-family: 'Outfit', sans-serif; font-weight: 800; font-size: 1.5rem; letter-spacing: 0.5px; color: #ffffff;">Ceylon<span class="highlight" style="color: var(--secondary);">Lands</span></span>
                    <span style="font-size: 0.62rem; text-transform: uppercase; letter-spacing: 1.5px; color: #94a3b8; font-weight: 600;">Prime Land Sales &amp; Development</span>
                </div>
            </a>
            <div class="info-content">
                <h2>Join Ceylon Lands Today</h2>
                <p>Register as a customer to browse premium lands, place direct reservations, and secure your property transaction online.</p>
                
                <div class="features">
                    <div class="feature-item">
                        <div class="feature-icon"><i class="bi bi-map-fill"></i></div>
                        <span class="feature-text">Browse & Inquire Lands</span>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon"><i class="bi bi-bookmark-check-fill"></i></div>
                        <span class="feature-text">Instant Block Booking</span>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon"><i class="bi bi-shield-check"></i></div>
                        <span class="feature-text">Fully Verified Deeds</span>
                    </div>
                </div>
            </div>
            <div style="font-size: 0.8rem; color: var(--text-muted);">
                &copy; 2026 Ceylon Lands (Pvt) Ltd. All rights reserved.
            </div>
        </div>

        <!-- Right panel -->
        <div class="form-panel">
            <div class="form-header">
                <h3>Customer Registration</h3>
                <p>Create your personal account to get started</p>
            </div>

            <!-- Error Alerts -->
            <c:if test="${error != null}">
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    <span>${error}</span>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/register/save" method="POST" onsubmit="return validatePasswords()">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <div class="input-wrapper">
                            <i class="bi bi-person-fill"></i>
                            <input type="text" id="username" name="username" class="form-control" required placeholder="Choose a username">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="name">Full Name</label>
                        <div class="input-wrapper">
                            <i class="bi bi-card-text"></i>
                            <input type="text" id="name" name="name" class="form-control" required placeholder="e.g. John Doe">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email">Email Address</label>
                        <div class="input-wrapper">
                            <i class="bi bi-envelope-fill"></i>
                            <input type="email" id="email" name="email" class="form-control" required placeholder="john@example.com">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <div class="input-wrapper">
                            <i class="bi bi-telephone-fill"></i>
                            <input type="text" id="phone" name="phone" class="form-control" required placeholder="e.g. +94771234567">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <div class="input-wrapper">
                            <i class="bi bi-lock-fill"></i>
                            <input type="password" id="password" name="password" class="form-control" required placeholder="••••••••">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password</label>
                        <div class="input-wrapper">
                            <i class="bi bi-lock-fill"></i>
                            <input type="password" id="confirmPassword" class="form-control" required placeholder="••••••••">
                        </div>
                    </div>

                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <div class="input-wrapper">
                            <i class="bi bi-geo-alt-fill"></i>
                            <input type="text" id="address" name="address" class="form-control" required placeholder="Enter your full home address">
                        </div>
                    </div>
                </div>

                <div id="passwordMismatchAlert" class="alert alert-danger" style="display: none; margin-top: 1rem;">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    <span>Passwords do not match.</span>
                </div>

                <button type="submit" class="btn-submit">
                    <span>Create Account</span>
                    <i class="bi bi-arrow-right"></i>
                </button>
            </form>
            
            <p class="footer-note">Already have an account? <a href="${pageContext.request.contextPath}/login">Sign In</a></p>
        </div>
    </div>

    <script>
        function validatePasswords() {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;
            var alertBox = document.getElementById('passwordMismatchAlert');
            
            if (password !== confirmPassword) {
                alertBox.style.display = 'flex';
                return false;
            }
            alertBox.style.display = 'none';
            return true;
        }
    </script>
</body>
</html>

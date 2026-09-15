<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Ceylon Lands</title>
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

        .login-wrapper {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 950px;
            padding: 1.5rem;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            background: rgba(15, 23, 42, 0.45);
            backdrop-filter: blur(25px);
            -webkit-backdrop-filter: blur(25px);
            border: 1px solid var(--glass-border);
            border-radius: 24px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            overflow: hidden;
        }

        @media (max-width: 768px) {
            .login-wrapper {
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
        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
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

        .alert-success {
            background: rgba(16, 185, 129, 0.1);
            border-color: rgba(16, 185, 129, 0.2);
            color: var(--success);
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
        }

        .btn-submit:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
        }

        .btn-submit:active {
            transform: translateY(0);
        }

        /* Quick Switcher */
        .quick-switch-section {
            margin-top: 2rem;
            border-top: 1px solid var(--glass-border);
            padding-top: 1.5rem;
        }

        .quick-switch-section h4 {
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.05em;
            margin-bottom: 1rem;
            text-align: center;
        }

        .role-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 0.5rem;
        }

        .role-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--glass-border);
            border-radius: 8px;
            padding: 0.5rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-align: center;
            cursor: pointer;
            transition: all 0.2s ease;
            color: var(--text-muted);
        }

        .role-card:hover {
            background: rgba(99, 102, 241, 0.1);
            border-color: rgba(99, 102, 241, 0.3);
            color: #fff;
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

    <div class="login-wrapper">
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
                <h2>Manage Lands with Precision</h2>
                <p>Welcome back to the unified administrative interface of Ceylon Lands, serving legal, sales, survey, and property management pipelines.</p>
                
                <div class="features">
                    <div class="feature-item">
                        <div class="feature-icon"><i class="bi bi-shield-lock-fill"></i></div>
                        <span class="feature-text">Secure Access Control</span>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon"><i class="bi bi-people-fill"></i></div>
                        <span class="feature-text">Team Collaboration</span>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon"><i class="bi bi-graph-up-arrow"></i></div>
                        <span class="feature-text">Real-time Analytics</span>
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
                <h3>Sign In</h3>
                <p>Enter your credentials to access your dashboard</p>
            </div>

            <!-- Login Fail / Logout Success / Registration Success Alerts -->
            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    <span>Invalid username or password.</span>
                </div>
            </c:if>
            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    <i class="bi bi-check-circle-fill"></i>
                    <span>Logged out successfully.</span>
                </div>
            </c:if>
            <c:if test="${param.registered != null}">
                <div class="alert alert-success">
                    <i class="bi bi-check-circle-fill"></i>
                    <span>Registration successful! Please sign in.</span>
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-wrapper">
                        <i class="bi bi-person-fill"></i>
                        <input type="text" id="username" name="username" class="form-control" placeholder="Enter username" required autocomplete="username">
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <i class="bi bi-lock-fill"></i>
                        <input type="password" id="password" name="password" class="form-control" placeholder="••••••••" required autocomplete="current-password">
                    </div>
                </div>

                <button type="submit" class="btn-submit">
                    <span>Sign In</span>
                    <i class="bi bi-arrow-right"></i>
                </button>
            </form>

            <!-- Role Quick Switcher -->
            <div class="quick-switch-section">
                <h4>Quick Demo Login</h4>
                <div class="role-cards">
                    <div class="role-card" onclick="selectRole('admin', 'admin123')"><i class="bi bi-shield-lock"></i> Admin</div>
                    <div class="role-card" onclick="selectRole('property', 'property123')"><i class="bi bi-buildings"></i> Property Mgr</div>
                    <div class="role-card" onclick="selectRole('sales', 'sales123')"><i class="bi bi-currency-dollar"></i> Sales</div>
                    <div class="role-card" onclick="selectRole('legal', 'legal123')"><i class="bi bi-file-earmark-text"></i> Legal</div>
                    <div class="role-card" onclick="selectRole('survey', 'survey123')"><i class="bi bi-geo-alt"></i> Survey</div>
                    <div class="role-card" onclick="selectRole('lahiru', '123456')"><i class="bi bi-person-circle"></i> Customer (Lahiru)</div>
                </div>
            </div>
            
            <p class="footer-note">Don't have an account? <a href="${pageContext.request.contextPath}/register">Sign Up</a></p>
        </div>
    </div>

    <script>
        function selectRole(username, password) {
            document.getElementById('username').value = username;
            document.getElementById('password').value = password;
            // Instantly submit for seamless UX
            document.querySelector('form').submit();
        }
    </script>
</body>
</html>

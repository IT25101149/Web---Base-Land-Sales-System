<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Land Sales System</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
        :root {
            --bg-color: #f8fafc;
            --card-bg: rgba(255, 255, 255, 0.9);
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', sans-serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-dark);
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background-color: #0f172a;
            color: #fff;
            padding: 2rem 1.5rem;
            display: flex;
            flex-direction: column;
            gap: 2rem;
            position: fixed;
            height: 100vh;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #fff;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logo i {
            color: var(--primary);
        }

        .nav-links {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .nav-links a {
            color: #94a3b8;
            text-decoration: none;
            padding: 0.75rem 1rem;
            border-radius: 8px;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-weight: 500;
            transition: all 0.2s ease;
        }

        .nav-links a:hover, .nav-links .active a {
            background-color: rgba(255, 255, 255, 0.1);
            color: #fff;
        }

        .nav-links .active a {
            background-color: var(--primary);
        }

        /* Main Content */
        .main-container {
            margin-left: 260px;
            flex: 1;
            padding: 2rem;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        header h1 {
            font-size: 1.75rem;
            font-weight: 700;
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .user-profile img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
        }

        .stat-info h3 {
            font-size: 0.875rem;
            color: var(--text-muted);
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .stat-info p {
            font-size: 1.75rem;
            font-weight: 700;
        }

        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .stat-icon.blue { background-color: rgba(79, 70, 229, 0.1); color: var(--primary); }
        .stat-icon.green { background-color: rgba(16, 185, 129, 0.1); color: var(--success); }
        .stat-icon.orange { background-color: rgba(245, 158, 11, 0.1); color: var(--warning); }
        .stat-icon.red { background-color: rgba(239, 68, 68, 0.1); color: var(--danger); }

        /* Content Sections */
        .content-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 1.5rem;
        }

        .section-card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 1.5rem;
            box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.05);
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .section-header h2 {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .btn-view {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.875rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
        }

        /* Tables & Lists */
        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th {
            padding: 0.75rem 1rem;
            color: var(--text-muted);
            font-weight: 600;
            font-size: 0.875rem;
            border-bottom: 1px solid var(--border);
        }

        td {
            padding: 1rem;
            border-bottom: 1px solid var(--border);
            font-size: 0.95rem;
        }

        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            font-size: 0.75rem;
            font-weight: 600;
            display: inline-block;
        }

        .status-badge.available { background: rgba(16, 185, 129, 0.1); color: var(--success); }
        .status-badge.reserved { background: rgba(245, 158, 11, 0.1); color: var(--warning); }
        .status-badge.sold { background: rgba(239, 68, 68, 0.1); color: var(--danger); }

        .sales-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .sale-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.75rem;
            border-radius: 8px;
            border: 1px solid var(--border);
        }

        .sale-item-info h4 {
            font-size: 0.95rem;
            font-weight: 600;
        }

        .sale-item-info p {
            font-size: 0.85rem;
            color: var(--text-muted);
        }

        .sale-amount {
            font-weight: 700;
            color: var(--primary);
        }
    </style>
</head>
<body>

    <!-- Determine User Role Name -->
    <c:set var="userRole" value="User" />
    <c:choose>
        <c:when test="${pageContext.request.isUserInRole('ROLE_ADMIN')}"><c:set var="userRole" value="System Administrator" /></c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_PROPERTY') or pageContext.request.isUserInRole('ROLE_PROPERTY_MANAGER')}"><c:set var="userRole" value="Property Manager" /></c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_SALES')}"><c:set var="userRole" value="Sales Executive" /></c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_SURVEY')}"><c:set var="userRole" value="Surveyor" /></c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_LEGAL')}"><c:set var="userRole" value="Legal Advisor" /></c:when>
        <c:when test="${pageContext.request.isUserInRole('ROLE_CUSTOMER')}"><c:set var="userRole" value="Valued Customer" /></c:when>
    </c:choose>

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <div class="logo" style="display: flex; align-items: center; gap: 0.65rem;">
            <img src="${pageContext.request.contextPath}/uploads/ceylon-lands-logo.jpg" alt="Ceylon Lands" style="height: 38px; width: 38px; border-radius: 8px; object-fit: cover; border: 1.5px solid #d4af37;">
            <span>Ceylon<span style="color: #d4af37;">Lands</span></span>
        </div>
        <ul class="nav-links">
            <li class="active"><a href="${pageContext.request.contextPath}/"><i class="bi bi-grid-1x2-fill"></i> Dashboard</a></li>
            
            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN') or pageContext.request.isUserInRole('ROLE_PROPERTY') or pageContext.request.isUserInRole('ROLE_PROPERTY_MANAGER') or pageContext.request.isUserInRole('ROLE_SALES') or pageContext.request.isUserInRole('ROLE_SURVEY')}">
                <li><a href="${pageContext.request.contextPath}/property"><i class="bi bi-map-fill"></i> Properties</a></li>
            </c:if>
            
            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                <li><a href="${pageContext.request.contextPath}/crm"><i class="bi bi-people-fill"></i> Customers</a></li>
            </c:if>
            
            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN') or pageContext.request.isUserInRole('ROLE_SALES')}">
                <li>
                    <a href="${pageContext.request.contextPath}/sales" style="display: flex; align-items: center; justify-content: space-between;">
                        <span><i class="bi bi-currency-dollar"></i> Sales & Reserves</span>
                        <c:if test="${not empty pendingInquiriesCount and pendingInquiriesCount > 0}">
                            <span style="background: #ef4444; color: #fff; font-size: 0.72rem; font-weight: 800; padding: 0.15rem 0.5rem; border-radius: 20px;">${pendingInquiriesCount} New</span>
                        </c:if>
                    </a>
                </li>
            </c:if>

            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN') or pageContext.request.isUserInRole('ROLE_SURVEY')}">
                <li><a href="${pageContext.request.contextPath}/survey"><i class="bi bi-geo-alt-fill"></i> Surveys</a></li>
            </c:if>

            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN') or pageContext.request.isUserInRole('ROLE_LEGAL')}">
                <li><a href="${pageContext.request.contextPath}/legal"><i class="bi bi-file-earmark-text-fill"></i> Legal Docs</a></li>
            </c:if>

            <c:if test="${pageContext.request.isUserInRole('ROLE_ADMIN')}">
                <li><a href="${pageContext.request.contextPath}/admin/users"><i class="bi bi-person-gear"></i> System Users</a></li>
            </c:if>

            <!-- Quick Public Links -->
            <li><a href="${pageContext.request.contextPath}/properties"><i class="bi bi-compass-fill"></i> Browse Lands</a></li>
            <li><a href="${pageContext.request.contextPath}/home"><i class="bi bi-globe"></i> Public Site</a></li>
        </ul>
    </div>

    <!-- Main Content Area -->
    <div class="main-container">
        <header>
            <div>
                <h1>Welcome Back, <c:out value="${pageContext.request.userPrincipal.name}" /></h1>
                <p style="color: var(--text-muted); font-size: 0.9rem;">Here's what's happening with your land sales portfolio today.</p>
            </div>
            <div class="user-profile">
                <div style="text-align: right;">
                    <h4 style="font-size: 0.95rem; font-weight: 600;"><c:out value="${userRole}" /></h4>
                    <form action="${pageContext.request.contextPath}/logout" method="POST" style="margin-top: 0.25rem;">
                        <button type="submit" style="background: none; border: none; color: #ef4444; font-size: 0.8rem; font-weight: 600; cursor: pointer; padding: 0; display: flex; align-items: center; gap: 0.25rem; margin-left: auto;">
                            <i class="bi bi-box-arrow-right"></i> Log Out
                        </button>
                    </form>
                </div>
                <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=100&auto=format&fit=crop&q=60" alt="User avatar">
            </div>
        </header>

        <!-- Notification Alert for Customer Inquiries -->
        <c:if test="${not empty pendingInquiriesCount and pendingInquiriesCount > 0}">
            <div style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); border: 1px solid #f59e0b; border-radius: 12px; padding: 1.2rem 1.5rem; margin-bottom: 2rem; display: flex; align-items: center; justify-content: space-between; gap: 1rem; box-shadow: 0 4px 12px rgba(245, 158, 11, 0.15);">
                <div style="display: flex; align-items: center; gap: 1rem;">
                    <div style="width: 44px; height: 44px; border-radius: 50%; background: #f59e0b; color: #fff; display: flex; align-items: center; justify-content: center; font-size: 1.3rem; flex-shrink: 0;">
                        <i class="bi bi-bell-fill"></i>
                    </div>
                    <div>
                        <h4 style="margin: 0; color: #92400e; font-size: 1.05rem; font-weight: 800;">
                            ${pendingInquiriesCount} Online Land Reservation Request(s) Pending Review!
                        </h4>
                        <p style="margin: 0.2rem 0 0 0; color: #78350f; font-size: 0.88rem;">
                            Customers have submitted plot reservation requests. Check the Sales & Reservations page to approve reservations.
                        </p>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/sales" style="background: #92400e; color: #fff; padding: 0.6rem 1.2rem; border-radius: 8px; font-weight: 700; text-decoration: none; font-size: 0.88rem; white-space: nowrap;">
                    <i class="bi bi-arrow-right-circle"></i> Review Inquiries
                </a>
            </div>
        </c:if>


        <!-- Stats Grid -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Total Properties</h3>
                    <p>${totalProperties}</p>
                </div>
                <div class="stat-icon blue">
                    <i class="bi bi-building"></i>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Available Plots</h3>
                    <p>${availableProperties}</p>
                </div>
                <div class="stat-icon green">
                    <i class="bi bi-check-circle"></i>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Total Customers</h3>
                    <p>${totalCustomers}</p>
                </div>
                <div class="stat-icon orange">
                    <i class="bi bi-people"></i>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-info">
                    <h3>Total Revenue</h3>
                    <p>LKR <fmt:formatNumber value="${totalRevenue}" type="number" maxFractionDigits="2"/></p>
                </div>
                <div class="stat-icon red">
                    <i class="bi bi-cash-stack"></i>
                </div>
            </div>
        </div>

        <!-- Content Grid -->
        <div class="content-grid">
            <!-- Properties Overview -->
            <div class="section-card">
                <div class="section-header">
                    <h2>Properties Portfolio</h2>
                    <a href="${pageContext.request.contextPath}/property" class="btn-view">View All <i class="bi bi-arrow-right"></i></a>
                </div>
                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>Land Project</th>
                                <th>Location</th>
                                <th>Size (Perches)</th>
                                <th>Price (LKR)</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="prop" items="${properties}">
                                <tr>
                                    <td style="font-weight: 600;">${prop.title}</td>
                                    <td>${prop.location}</td>
                                    <td>${prop.size}</td>
                                    <td><fmt:formatNumber value="${prop.price}" type="number" maxFractionDigits="2"/></td>
                                    <td>
                                        <span class="status-badge ${prop.status.toLowerCase()}">${prop.status}</span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Recent Reservations -->
            <div class="section-card">
                <div class="section-header">
                    <h2>Recent Sales</h2>
                    <a href="${pageContext.request.contextPath}/sales" class="btn-view">View All <i class="bi bi-arrow-right"></i></a>
                </div>
                <div class="sales-list">
                    <c:forEach var="sale" items="${sales}">
                        <div class="sale-item">
                            <div class="sale-item-info">
                                <h4>${sale.property.title}</h4>
                                <p>Reserved by: ${sale.customer.name}</p>
                            </div>
                            <div style="text-align: right;">
                                <div class="sale-amount">LKR <fmt:formatNumber value="${sale.salePrice}" type="number" maxFractionDigits="2"/></div>
                                <p style="font-size: 0.85rem; color: var(--text-muted);">${sale.status}</p>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty sales}">
                        <p style="color: var(--text-muted); text-align: center; padding: 2rem 0;">No sales recorded yet.</p>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
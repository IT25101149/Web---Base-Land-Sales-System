<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .notif-wrapper {
        position: relative;
        display: inline-block;
    }

    .notif-bell-btn {
        background: rgba(255, 255, 255, 0.12);
        border: 1px solid rgba(255, 255, 255, 0.2);
        color: inherit;
        width: 40px;
        height: 40px;
        border-radius: 10px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        cursor: pointer;
        position: relative;
        transition: all 0.2s ease;
        font-size: 1.15rem;
    }

    .notif-bell-btn:hover {
        background: rgba(255, 255, 255, 0.22);
        transform: translateY(-1px);
    }

    .notif-badge {
        position: absolute;
        top: -4px;
        right: -4px;
        background: #ef4444;
        color: #ffffff;
        font-size: 0.68rem;
        font-weight: 800;
        min-width: 18px;
        height: 18px;
        line-height: 18px;
        padding: 0 4px;
        border-radius: 10px;
        text-align: center;
        border: 2px solid #ffffff;
        display: none;
        box-shadow: 0 2px 5px rgba(239, 68, 68, 0.4);
        animation: pulseNotif 2s infinite;
    }

    @keyframes pulseNotif {
        0% { transform: scale(1); }
        50% { transform: scale(1.15); }
        100% { transform: scale(1); }
    }

    .notif-dropdown {
        position: absolute;
        top: calc(100% + 10px);
        right: 0;
        width: 360px;
        max-width: 90vw;
        background: #ffffff;
        border: 1px solid #e2e8f0;
        border-radius: 16px;
        box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.15), 0 5px 15px rgba(0, 0, 0, 0.05);
        display: none;
        flex-direction: column;
        z-index: 10000;
        overflow: hidden;
        animation: slideDownNotif 0.2s cubic-bezier(0.16, 1, 0.3, 1);
    }

    @keyframes slideDownNotif {
        from { opacity: 0; transform: translateY(-8px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .notif-dropdown.show {
        display: flex;
    }

    .notif-header {
        padding: 1rem 1.25rem;
        background: #f8fafc;
        border-bottom: 1px solid #e2e8f0;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .notif-header h4 {
        margin: 0;
        font-size: 0.95rem;
        font-weight: 700;
        color: #0f172a;
        display: flex;
        align-items: center;
        gap: 0.5rem;
    }

    .notif-mark-read-btn {
        background: none;
        border: none;
        color: #0b5e28;
        font-size: 0.78rem;
        font-weight: 700;
        cursor: pointer;
        padding: 0.2rem 0.4rem;
        border-radius: 6px;
        transition: background 0.2s;
    }

    .notif-mark-read-btn:hover {
        background: #e2e8f0;
    }

    .notif-list {
        max-height: 380px;
        overflow-y: auto;
        padding: 0.5rem 0;
        margin: 0;
        list-style: none;
    }

    .notif-item {
        padding: 0.85rem 1.25rem;
        border-bottom: 1px solid #f1f5f9;
        display: flex;
        gap: 0.85rem;
        align-items: flex-start;
        cursor: pointer;
        transition: background 0.15s ease;
        text-decoration: none;
        color: inherit;
    }

    .notif-item:hover {
        background: #f8fafc;
    }

    .notif-item.unread {
        background: #f0fdf4;
    }

    .notif-item.unread:hover {
        background: #e2fbe8;
    }

    .notif-icon {
        width: 36px;
        height: 36px;
        border-radius: 10px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-shrink: 0;
        font-size: 1rem;
    }

    .notif-icon.PAYMENT { background: #ecfdf5; color: #059669; }
    .notif-icon.RESERVATION { background: #eff6ff; color: #2563eb; }
    .notif-icon.LEGAL_DEED { background: #fef3c7; color: #d97706; }
    .notif-icon.SURVEY { background: #f3e8ff; color: #9333ea; }
    .notif-icon.GENERAL { background: #f1f5f9; color: #475569; }

    .notif-content {
        flex: 1;
        min-width: 0;
    }

    .notif-title {
        font-size: 0.86rem;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 0.2rem;
        line-height: 1.3;
    }

    .notif-desc {
        font-size: 0.78rem;
        color: #64748b;
        line-height: 1.4;
        margin-bottom: 0.35rem;
        word-break: break-word;
    }

    .notif-meta {
        display: flex;
        align-items: center;
        gap: 0.5rem;
        font-size: 0.72rem;
        color: #94a3b8;
    }

    .notif-dot {
        width: 7px;
        height: 7px;
        border-radius: 50%;
        background: #059669;
        margin-left: auto;
        flex-shrink: 0;
    }

    .notif-empty {
        padding: 2.5rem 1.5rem;
        text-align: center;
        color: #94a3b8;
        font-size: 0.88rem;
    }

    .notif-empty i {
        font-size: 2.2rem;
        margin-bottom: 0.5rem;
        color: #cbd5e1;
        display: block;
    }
</style>

<div class="notif-wrapper" id="terrasalesNotifWrapper">
    <button type="button" class="notif-bell-btn" id="notifBellBtn" title="Notifications" onclick="toggleNotifDropdown(event)">
        <i class="bi bi-bell-fill"></i>
        <span class="notif-badge" id="notifBadgeCount">0</span>
    </button>

    <div class="notif-dropdown" id="notifDropdownMenu">
        <div class="notif-header">
            <h4><i class="bi bi-bell-fill" style="color: #d4af37;"></i> Ceylon Lands Alerts</h4>
            <button type="button" class="notif-mark-read-btn" onclick="markAllNotificationsRead(event)">
                <i class="bi bi-check2-all"></i> Mark all read
            </button>
        </div>
        <ul class="notif-list" id="notifListContainer">
            <li class="notif-empty">
                <i class="bi bi-bell-slash"></i>
                Loading notifications...
            </li>
        </ul>
    </div>
</div>

<script>
    let notifDropdownOpen = false;

    function toggleNotifDropdown(event) {
        if (event) event.stopPropagation();
        const menu = document.getElementById('notifDropdownMenu');
        notifDropdownOpen = !notifDropdownOpen;
        if (notifDropdownOpen) {
            menu.classList.add('show');
            loadNotificationsList();
        } else {
            menu.classList.remove('show');
        }
    }

    // Close on outside click
    document.addEventListener('click', function(e) {
        const wrapper = document.getElementById('terrasalesNotifWrapper');
        if (wrapper && !wrapper.contains(e.target)) {
            const menu = document.getElementById('notifDropdownMenu');
            if (menu) menu.classList.remove('show');
            notifDropdownOpen = false;
        }
    });

    function getNotifIconClass(type) {
        if (type === 'PAYMENT') return 'bi-credit-card-fill';
        if (type === 'RESERVATION') return 'bi-journal-check';
        if (type === 'LEGAL_DEED') return 'bi-file-earmark-check-fill';
        if (type === 'SURVEY') return 'bi-compass-fill';
        return 'bi-info-circle-fill';
    }

    function checkUnreadCount() {
        const ctx = "${pageContext.request.contextPath}";
        fetch(ctx + '/api/notifications/unread-count')
            .then(res => res.json())
            .then(data => {
                const badge = document.getElementById('notifBadgeCount');
                if (!badge) return;
                const count = data.unreadCount || 0;
                if (count > 0) {
                    badge.textContent = count > 99 ? '99+' : count;
                    badge.style.display = 'inline-block';
                } else {
                    badge.style.display = 'none';
                }
            })
            .catch(() => {});
    }

    function loadNotificationsList() {
        const ctx = "${pageContext.request.contextPath}";
        const container = document.getElementById('notifListContainer');
        fetch(ctx + '/api/notifications')
            .then(res => res.json())
            .then(items => {
                if (!items || items.length === 0) {
                    container.innerHTML = `
                        <li class="notif-empty">
                            <i class="bi bi-bell-slash"></i>
                            All caught up! No notifications.
                        </li>
                    `;
                    return;
                }

                container.innerHTML = items.map(n => {
                    const unreadClass = n.isRead ? '' : 'unread';
                    const iconType = n.type || 'GENERAL';
                    const iconBi = getNotifIconClass(iconType);
                    const link = n.linkUrl ? (n.linkUrl.startsWith('http') ? n.linkUrl : (ctx + n.linkUrl)) : '#';
                    return `
                        <li class="notif-item ` + unreadClass + `" onclick="handleNotifClick(` + n.id + `, '` + link + `')">
                            <div class="notif-icon ` + iconType + `">
                                <i class="bi ` + iconBi + `"></i>
                            </div>
                            <div class="notif-content">
                                <div class="notif-title">` + escapeHtml(n.title) + `</div>
                                <div class="notif-desc">` + escapeHtml(n.message) + `</div>
                                <div class="notif-meta">
                                    <span><i class="bi bi-clock"></i> ` + n.timeAgo + `</span>
                                </div>
                            </div>
                            ` + (!n.isRead ? '<span class="notif-dot"></span>' : '') + `
                        </li>
                    `;
                }).join('');
            })
            .catch(() => {
                container.innerHTML = `
                    <li class="notif-empty">
                        <i class="bi bi-exclamation-circle"></i>
                        Could not load notifications.
                    </li>
                `;
            });
    }

    function handleNotifClick(id, link) {
        const ctx = "${pageContext.request.contextPath}";
        fetch(ctx + '/api/notifications/mark-read/' + id, { method: 'POST' })
            .finally(() => {
                checkUnreadCount();
                if (link && link !== '#') {
                    window.location.href = link;
                }
            });
    }

    function markAllNotificationsRead(event) {
        if (event) event.stopPropagation();
        const ctx = "${pageContext.request.contextPath}";
        fetch(ctx + '/api/notifications/mark-all-read', { method: 'POST' })
            .then(() => {
                checkUnreadCount();
                loadNotificationsList();
            });
    }

    function escapeHtml(text) {
        if (!text) return '';
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }

    // Initial check and periodic background poll every 25 seconds
    document.addEventListener('DOMContentLoaded', function() {
        checkUnreadCount();
        setInterval(checkUnreadCount, 25000);
    });
</script>

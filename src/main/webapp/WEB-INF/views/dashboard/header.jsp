<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String activePage = request.getParameter("activePage");
%>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">

        <!-- Menu -->
        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
            <div class="app-brand demo">
                <a href="dashboard" class="app-brand-link">
                    <img src="<c:url value="/assets/homeAssets/images/GatherGrid.png"/>" alt class="img-fluid"/>
                </a>

                <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto">
                    <i class="ti menu-toggle-icon d-none d-xl-block ti-sm align-middle"></i>
                    <i class="ti ti-x d-block d-xl-none ti-sm align-middle"></i>
                </a>
            </div>

            <div class="menu-inner-shadow"></div>

            <ul class="menu-inner py-1">
                <!-- Page -->
                <li class="menu-item <%= "dashboard".equals(activePage) ? "active" : "" %>">
                    <a href="<c:url value="/dashboard"/>" class="menu-link">
                        <i class="menu-icon tf-icons ti ti-smart-home"></i>
                        <div data-i18n="dashboard">dashboard</div>
                    </a>
                </li>
                <li class="menu-item open">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons ti ti-smart-home"></i>
                        <div data-i18n="Users">Users</div>
                    </a>
                    <ul class="menu-sub">
                        <li class="menu-item <%= "listUsers".equals(activePage) ? "active" : "" %>">
                            <a href="users" class="menu-link">
                                <div data-i18n="List Users">List Users</div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item open">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons ti ti-smart-home"></i>
                        <div data-i18n="Categories">Categories</div>
                    </a>
                    <ul class="menu-sub">
                        <li class="menu-item <%= "listCategories".equals(activePage) ? "active" : "" %>">
                            <a href="categories" class="menu-link">
                                <div data-i18n="List Categories">List Categories</div>
                            </a>
                        </li>
                        <li class="menu-item <%= "addCategory".equals(activePage) ? "active" : "" %>">
                            <a href="categories?action=add" class="menu-link">
                                <div data-i18n="Add Category">Add Category</div>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-item open">
                    <a href="javascript:void(0);" class="menu-link menu-toggle">
                        <i class="menu-icon tf-icons ti ti-smart-home"></i>
                        <div data-i18n="Events">Events</div>
                    </a>
                    <ul class="menu-sub">
                        <li class="menu-item <%= "listEvents".equals(activePage) ? "active" : "" %>">
                            <a href="events" class="menu-link">
                                <div data-i18n="List Events">List Events</div>
                            </a>
                        </li>
                        <li class="menu-item <%= "addEvent".equals(activePage) ? "active" : "" %>">
                            <a href="events?action=add" class="menu-link">
                                <div data-i18n="Add Event">Add Event</div>
                            </a>
                        </li>
                    </ul>
                </li>

                </li>
            </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->

            <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar">
                <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                    <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                        <i class="ti ti-menu-2 ti-sm"></i>
                    </a>
                </div>

                <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                    <!-- Search -->
                    <div class="navbar-nav align-items-center">
                        <div class="nav-item navbar-search-wrapper mb-0">
                            <a class="nav-item nav-link search-toggler d-flex align-items-center px-0"
                               href="javascript:void(0);">
                                <i class="ti ti-search ti-md me-2"></i>
                                <span class="d-none d-md-inline-block text-muted">Search (Ctrl+/)</span>
                            </a>
                        </div>
                    </div>
                    <!-- /Search -->

                    <ul class="navbar-nav flex-row align-items-center ms-auto">
                        <!-- User -->
                        <li class="nav-item navbar-dropdown dropdown-user dropdown">
                            <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                               data-bs-toggle="dropdown">
                                <div class="avatar avatar-online">
                                    <img src="assets2/img/avatars/1.png" alt class="h-auto rounded-circle"/>
                                </div>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <a class="dropdown-item" href="account-settings">
                                        <div class="d-flex">
                                            <div class="flex-shrink-0 me-3">
                                                <div class="avatar avatar-online">
                                                    <img src="assets2/img/avatars/1.png" alt
                                                         class="h-auto rounded-circle"/>
                                                </div>
                                            </div>
                                            <div class="flex-grow-1">
                                                <span class="fw-medium d-block">John Doe</span>
                                                <small class="text-muted">Admin</small>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="account-settings">
                                        <i class="ti ti-user-check me-2 ti-sm"></i>
                                        <span class="align-middle">My Profile</span>
                                    </a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="account-settings">
                                        <i class="ti ti-settings me-2 ti-sm"></i>
                                        <span class="align-middle">Settings</span>
                                    </a>
                                </li>
                                <li>
                                    <div class="dropdown-divider"></div>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="<c:url value='/auth/logout.php'/>">
                                        <i class="ti ti-logout me-2 ti-sm"></i>
                                        <span class="align-middle">Log Out</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <!--/ User -->
                    </ul>
                </div>

                <!-- Search Small Screens -->
                <div class="navbar-search-wrapper search-input-wrapper d-none">
                    <input
                            type="text"
                            class="form-control search-input container-xxl border-0"
                            placeholder="Search..."
                            aria-label="Search..."/>
                    <i class="ti ti-x ti-sm search-toggler cursor-pointer"></i>
                </div>
            </nav>
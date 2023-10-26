<header class="header">
    <div class="header-inner">
        <nav class="navbar navbar-expand-lg bg-barren barren-head navbar fixed-top justify-content-sm-start pt-0 pb-0">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
						<span class="navbar-toggler-icon">
							<i class="fa-solid fa-bars"></i>
						</span>
                </button>
                <a class="navbar-brand order-1 order-lg-0 ml-lg-0 ml-2 me-auto" href="index.html">
                    <div class="res-main-logo">
                        <img src="<c:url value="/assets/homeAssets/images/GatherGrid.png"/>" alt="">
                    </div>
                    <div class="main-logo" id="logo">
                        <img src="<c:url value="/assets/homeAssets/images/GatherGrid.png"/>" alt="">
                        <img class="logo-inverse" src="<c:url value="/assets/homeAssets/images/GatherGrid.png"/>"
                             alt="">
                    </div>
                </a>
                <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar"
                     aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <div class="offcanvas-logo" id="offcanvasNavbarLabel">
                            <img src="<c:url value="/assets/homeAssets/images/GatherGrid.png"/>" alt="">
                        </div>
                        <button type="button" class="close-btn" data-bs-dismiss="offcanvas" aria-label="Close">
                            <i class="fa-solid fa-xmark"></i>
                        </button>
                    </div>
                    <div class="offcanvas-body">
                        <div class="offcanvas-top-area">
                            <div class="create-bg">
                                <a href="<c:url value="/auth/login.css"/>" class="offcanvas-create-btn">
                                    <%--                                    <i class="fa-solid fa-calendar-days"></i>--%>
                                    <span>Register</span>
                                </a>
                            </div>
                        </div>
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe_5">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="<c:url value="/auth/login.css"/>">Login</a>
                            </li>

                        </ul>
                    </div>
                    <div class="offcanvas-footer">
                        <div class="offcanvas-social">
                            <h5>Follow Us</h5>
                            <ul class="social-links">
                                <li><a href="#" class="social-link"><i class="fab fa-facebook-square"></i></a>
                                <li><a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                                <li><a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                                <li><a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                                <li><a href="#" class="social-link"><i class="fab fa-youtube"></i></a>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="right-header order-2">
                    <ul class="align-self-stretch">
                        <li>
                            <a href="create.html" class="create-btn btn-hover">
                                <%--                                <i class="fa-solid fa-calendar-days"></i>--%>
                                <span>Register</span>
                            </a>
                        </li>
                        <li class="dropdown account-dropdown">
                            <a href="#" class="account-link" role="button" id="accountClick"
                               data-bs-auto-close="outside" data-bs-toggle="dropdown" aria-expanded="false">
                                <img src="<c:url value="/assets/homeAssets/images/profile-imgs/img-13.jpg" />" alt="">
                                <i class="fas fa-caret-down arrow-icon"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-account dropdown-menu-end"
                                aria-labelledby="accountClick">
                                <li>
                                    <div class="dropdown-account-header">
                                        <div class="account-holder-avatar">
                                            <img src="<c:url value="/assets/homeAssets/images/profile-imgs/img-13.jpg" />"
                                                 alt="">
                                        </div>
                                        <h5>John Doe</h5>
                                        <p>johndoe@example.com</p>
                                    </div>
                                </li>
                                <li class="profile-link">
                                    <a href="organiser_profile_view.html" class="link-item">My Profile</a>
                                    <a href="sign_in.html" class="link-item">Sign Out</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="overlay"></div>
    </div>
</header>
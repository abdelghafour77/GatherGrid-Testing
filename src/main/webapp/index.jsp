<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="h-100">
<%@include file="WEB-INF/views/includes/_head.jsp" %>

<body class="d-flex flex-column h-100">
<!-- Header Start-->
<%@include file="WEB-INF/views/includes/_header.jsp" %>

<!-- Header End-->
<!-- Body Start-->
<div class="wrapper">
    <div class="hero-banner">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-7 col-lg-9 col-md-10">
                    <div class="hero-banner-content">
                        <h2>The Easiest and Most Powerful Online Event Booking and Ticketing System</h2>
                        <p>GatherGrid is an all-in-one event ticketing platform for event organisers, promoters, and
                            managers. Easily create, promote and manage your events of any type and size.</p>
                        <%--                        <a href="<c:url value="/events?action=add"/>" class="main-btn btn-hover">--%>
                        <%--                            Create Event--%>
                        <%--                            <i class="fa-solid fa-arrow-right ms-3"></i>--%>
                        <%--                        </a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="explore-events p-80">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <div class="main-title">
                        <h3>Explore Events</h3>
                    </div>
                </div>
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <div class="event-filter-items">
                        <div class="featured-controls">
                            <%--                            <div class="filter-tag">--%>
                            <%--                                <a href="explore_events_by_date.html" class="active">All</a>--%>
                            <%--                                <a href="explore_events_by_date.html">Today</a>--%>
                            <%--                                <a href="explore_events_by_date.html">Tomorrow</a>--%>
                            <%--                                <a href="explore_events_by_date.html">This Week</a>--%>
                            <%--                                <a href="explore_events_by_date.html">This Weekend</a>--%>
                            <%--                                <a href="explore_events_by_date.html">Next Week</a>--%>
                            <%--                                <a href="explore_events_by_date.html">Next Weekend</a>--%>
                            <%--                                <a href="explore_events_by_date.html">This Month</a>--%>
                            <%--                                <a href="explore_events_by_date.html">Next Month</a>--%>
                            <%--                                <a href="explore_events_by_date.html">This Year</a>--%>
                            <%--                                <a href="explore_events_by_date.html">Next Year</a>--%>
                            <%--                            </div>--%>
                            <div class="controls">
                                <button type="button" class="control" data-filter="all">All</button>
                                <c:forEach items="${categories}" var="category">
                                    <button type="button" class="control"
                                            data-filter=".${category.name}">${category.name}</button>
                                </c:forEach>
                            </div>
                            <div class="row" data-ref="event-filter-content">
                                <c:forEach items="${events}" var="event">
                                    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-12 mix ${event.category.name}"
                                         data-ref="mixitup-target">
                                        <div class="main-card mt-4">
                                            <div class="event-thumbnail">
                                                <a href="<c:url value="/event_details?id=${event.id}" />"
                                                   class="thumbnail-img">
                                                    <img src="<c:url value="/assets/homeAssets/images/event-imgs/img-1.jpg" />"
                                                         alt="">
                                                </a>
                                                <span class="bookmark-icon" title="Bookmark"></span>
                                            </div>
                                            <div class="event-content">
                                                <a href="<c:url value="/event_details?id=${event.id}" />"
                                                   class="event-title">${event.name}</a>
                                                <div class="duration-price-remaining">
                                                    <span class="duration-price">AUD $150</span>
                                                    <span class="remaining"><i
                                                            class="fa-solid fa-ticket fa-rotate-90"></i>7 Remaining</span>
                                                </div>
                                            </div>
                                            <div class="event-footer">
                                                <div class="event-timing">
                                                    <div class="publish-date">
                                                        <span title="${event.date}"><i
                                                                class="fa-solid fa-calendar-day me-2"></i>${event.date}</span>
                                                        <span class="dot"><i class="fa-solid fa-circle"></i></span>
                                                        <span>${event.time}</span>
                                                    </div>
                                                    <span class="publish-time"><i class="fa-solid fa-clock me-2"></i>1h</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="browse-btn">
                                <a href="explore_events.html" class="main-btn btn-hover ">Browse All</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="testimonial-block p-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-10">
                    <div class="main-title">
                        <h3>Transforming Thousands of Event Hosts Just Like You</h3>
                        <p>Be part of a winning team. We are continuously thriving to bring the best to our customers.
                            Be that a new product feature, help in setting up your events or even supporting your
                            customers so that they can easily buy tickets and participate your in events. Here is what
                            some of the clients have to say,</p>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="testimonial-slider-area">
                        <div class="owl-carousel testimonial-slider owl-theme">
                            <div class="item">
                                <div class="main-card">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus
                                                arcu et ligula maximus vehicula. Phasellus at luctus lacus, quis
                                                eleifend nibh. Nam vitae convallis nisi, vitae tempus risus.</p>
                                        </div>
                                        <div class="testimonial-user-dt">
                                            <h5>Madeline S.</h5>
                                            <span>Events Co-ordinator</span>
                                            <ul>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <span class="quote-icon"><i class="fa-solid fa-quote-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="main-card">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus
                                                arcu et ligula maximus vehicula. Phasellus at luctus lacus, quis
                                                eleifend nibh. Nam vitae convallis nisi, vitae tempus risus.</p>
                                        </div>
                                        <div class="testimonial-user-dt">
                                            <h5>Gabrielle B.</h5>
                                            <span>Administration</span>
                                            <ul>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <span class="quote-icon"><i class="fa-solid fa-quote-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="main-card">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus
                                                arcu et ligula maximus vehicula. Phasellus at luctus lacus, quis
                                                eleifend nibh. Nam vitae convallis nisi, vitae tempus risus.</p>
                                        </div>
                                        <div class="testimonial-user-dt">
                                            <h5>Piyush G.</h5>
                                            <span>Application Developer</span>
                                            <ul>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <span class="quote-icon"><i class="fa-solid fa-quote-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="main-card">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus
                                                arcu et ligula maximus vehicula. Phasellus at luctus lacus, quis
                                                eleifend nibh. Nam vitae convallis nisi, vitae tempus risus.</p>
                                        </div>
                                        <div class="testimonial-user-dt">
                                            <h5>Joanna P.</h5>
                                            <span>Event manager</span>
                                            <ul>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <span class="quote-icon"><i class="fa-solid fa-quote-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="main-card">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus
                                                arcu et ligula maximus vehicula. Phasellus at luctus lacus, quis
                                                eleifend nibh. Nam vitae convallis nisi, vitae tempus risus.</p>
                                        </div>
                                        <div class="testimonial-user-dt">
                                            <h5>Romo S.</h5>
                                            <span>Admin</span>
                                            <ul>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <span class="quote-icon"><i class="fa-solid fa-quote-right"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="main-card">
                                    <div class="testimonial-content">
                                        <div class="testimonial-text">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus maximus
                                                arcu et ligula maximus vehicula. Phasellus at luctus lacus, quis
                                                eleifend nibh. Nam vitae convallis nisi, vitae tempus risus.</p>
                                        </div>
                                        <div class="testimonial-user-dt">
                                            <h5>Christopher F.</h5>
                                            <span>Online Marketing Executive</span>
                                            <ul>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                                <li><i class="fa-solid fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <span class="quote-icon"><i class="fa-solid fa-quote-right"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Body End-->

<%@include file="WEB-INF/views/includes/_footer.jsp" %>

<%@include file="WEB-INF/views/includes/_js_footer.jsp" %>

</body>
</html>
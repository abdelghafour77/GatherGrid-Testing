<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="eventDate" value="${event.date}"/>
<fmt:formatDate value="${eventDate}" pattern="dd MMM" var="formattedDate"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="h-100">
<%@include file="includes/_head.jsp" %>
<body class="d-flex flex-column h-100">
<%@include file="includes/_header.jsp" %>
<!-- Body Start-->
<div class="wrapper">
    <div class="breadcrumb-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-10">
                    <div class="barren-breadcrumb">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                <li class="breadcrumb-item"><a href="explore_events.html">Explore Events</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Online Event Detail View</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="event-dt-block p-80">
        <div class="container">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12">
                    <div class="event-top-dts">
                        <div class="event-top-date">
                            <span class="event-month">
<%--                                Todo:Month of the event--%>
                            </span>
                            <span class="event-date">
<%--                                Todo: day of the event--%>
                            </span>
                        </div>
                        <div class="event-top-dt">
                            <h3 class="event-main-title">${event.name}</h3>
                            <div class="event-top-info-status">
                                <span class="event-type-name"><i class="fa-solid fa-video"></i>Online Event</span>
                                <span class="event-type-name details-hr">
                                    Starts on
                                    <span class="ev-event-date"><c:out value="${formattedDate}"/>
                                </span>
                                </span>
                                <span class="event-type-name details-hr">1h</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-7 col-md-12">
                    <div class="main-event-dt">
                        <div class="event-img">
                            <img src="images/event-imgs/big-1.jpg" alt="">
                        </div>
                        <div class="main-event-content">
                            <h4>About This Event</h4>
                            <p>${event.description}</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-5 col-md-12">
                    <div class="main-card event-right-dt">
                        <div class="bp-title">
                            <h4>Event Details</h4>
                        </div>
                        <div class="time-left">
                        </div>
                        <div class="event-dt-right-group mt-5">
                            <div class="event-dt-right-icon">
                                <i class="fa-solid fa-circle-user"></i>
                            </div>
                            <div class="event-dt-right-content">
                                <h4>Organised by</h4>
                                <h5>Story Tellers</h5>
                            </div>
                        </div>
                        <div class="event-dt-right-group">
                            <div class="event-dt-right-icon">
                                <i class="fa-solid fa-calendar-day"></i>
                            </div>
                            <div class="event-dt-right-content">
                                <h4>Date and Time</h4>
                                <h5>
                                    <%--                                    todo: date & time --%>
                                </h5>
                            </div>
                        </div>
                        <div class="event-dt-right-group">
                            <div class="event-dt-right-icon">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>
                            <div class="event-dt-right-content">
                                <h4>Location</h4>
                                <h5 class="mb-0">${event.location}</h5>
                            </div>
                        </div>
                        <div class="event-dt-right-group">
                            <div class="event-dt-right-icon">
                                <i class="fa-solid fa-money-check-dollar"></i>
                            </div>
                            <div class="event-dt-right-content">
                                <h4>AUD</h4>
                                <h5 class="mb-0">
                                    <%-- TODO: Price --%>
                                </h5>
                            </div>
                        </div>
                        <div class="booking-btn">
                            <a href="<c:url value="checkout?id=${event.id}" />" class="main-btn btn-hover w-100">
                                Book Now
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- Body End-->

<%@include file="includes/_footer.jsp" %>

<%@include file="includes/_js_footer.jsp" %>
</body>
</html>
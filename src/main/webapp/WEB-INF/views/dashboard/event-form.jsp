<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 17/10/2023
  Time: 07:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html
        lang="en"
        class="light-style layout-navbar-fixed layout-menu-fixed layout-compact"
        dir="ltr"
        data-theme="theme-default"
        data-assets-path="assets2/"
        data-template="vertical-menu-template-no-customizer">
<jsp:include page="/WEB-INF/views/includes/_head-dashboard.jsp"/>

<body>
            <jsp:include page="header.jsp">
                <jsp:param name="activePage" value="addEvent" />
            </jsp:include>
            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="py-3 mb-4"><span class="text-muted fw-light">Forms /</span> Validation</h4>
                    <div class="row mb-4">
                    </div>
                    <div class="row">
                        <!-- FormValidation -->
                        <div class="col-12">
                            <div class="card">
                                <h5 class="card-header">${(not empty event) ? 'Update' : 'Create'} Event</h5>
                                <div class="card-body">
                                    <form id="formValidationExamples" class="row g-3" action="events" method="post">
                                        <div class="col-md-6">
                                            <label class="form-label" for="eventName">Name</label>
                                            <input
                                                    type="text"
                                                    id="eventName"
                                                    class="form-control"
                                                    placeholder="Enter event name"
                                                    name="eventName"
                                                    value="${(not empty event) ? event.name : ''}"/>
                                        </div>
                                        <!-- Date Picker-->
                                        <div class="col-md-6 col-12 mb-4">
                                            <label for="flatpickr-date" class="form-label">Date Event</label>
                                            <input type="text" class="form-control" name="eventDate" placeholder="YYYY-MM-DD" id="flatpickr-date"  value="${(not empty event) ? event.date : ''}" />
                                        </div>
                                        <!-- /Date Picker -->

                                        <!-- Time Picker-->
                                        <div class="col-md-6 col-12 mb-4">
                                            <label for="flatpickr-time" class="form-label">Time Event</label>
                                            <input type="text" class="form-control" name="eventTime" placeholder="HH:MM" id="flatpickr-time" value="${(not empty event) ? event.time : ''}"/>
                                        </div>
                                        <!-- /Time Picker -->
                                        <div class="col-md-6">
                                            <label class="form-label" for="eventDescription">Description</label>
                                            <input
                                                    type="text"
                                                    id="eventDescription"
                                                    class="form-control"
                                                    placeholder="Enter event Description"
                                                    name="eventDescription"
                                                    value="${(not empty event) ? event.description : ''}" />
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label" for="eventLocation">Location</label>
                                            <input
                                                    type="text"
                                                    id="eventLocation"
                                                    class="form-control"
                                                    placeholder="Enter event Location"
                                                    name="eventLocation"
                                                    value="${(not empty event) ? event.location : ''}"/>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <label for="selectpickerBasic" class="form-label">Category</label>
                                            <select id="selectpickerBasic" class="selectpicker w-100" data-style="btn-default" name="categoryId">
                                                <c:forEach items="${categories}" var="category">
                                                    <option value="${category.id}" ${((not empty event) && (event.category.id == category.id)) ? 'selected' : ''}>${category.name}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <!-- Form Repeater -->
                                        <div>
                                            <h5>Ticket</h5>
                                            <div data-repeater-list="group-a">
                                                <c:choose>
                                                    <c:when test="${not empty tickets}">
                                                        <c:forEach var="ticket" items="${tickets}">
                                                            <div data-repeater-item>
                                                                <div class="row">
                                                                    <div class="mb-4 col-lg-6 col-xl-4 col-12 mb-0">
                                                                        <label class="form-label" for="ticketprice">Ticket Price</label>
                                                                        <input type="number" id="ticketprice" name="ticketPrice" class="form-control" placeholder="Enter the price" value="${(not empty ticket) ? ticket.price : ''}"/>
                                                                    </div>
                                                                    <div class="mb-4 col-lg-6 col-xl-4 col-12 mb-0">
                                                                        <label class="form-label" for="ticketquantity">Ticket Quantity</label>
                                                                        <input type="number" id="ticketquantity" name="ticketQuantity" class="form-control" placeholder="Enter the quantity" value="${(not empty ticket) ? ticket.quantityAvailable : ''}"/>
                                                                    </div>
                                                                    <div class="mb-4 col-lg-6 col-xl-4 col-12 mb-0">
                                                                        <label class="form-label" for="ticketType">Ticket Type</label>
                                                                        <select id="ticketType" class="form-select" name="ticketType">
                                                                            <c:forEach var="ticketType" items="${ticketTypes}">
                                                                                <option value="${ticketType}" ${((not empty ticketType) && (ticket.ticketType == ticketType)) ? 'selected' : ''}>${ticketType}</option>
                                                                            </c:forEach>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                            </div>
                                                        </c:forEach>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div data-repeater-item>
                                                            <div class="row">
                                                                <div class="mb-4 col-lg-6 col-xl-4 col-12 mb-0">
                                                                    <label class="form-label" for="ticketprice2">Ticket Price</label>
                                                                    <input type="number" id="ticketprice2" name="ticketPrice" class="form-control" placeholder="Enter the price"/>
                                                                </div>
                                                                <div class="mb-4 col-lg-6 col-xl-4 col-12 mb-0">
                                                                    <label class="form-label" for="ticketquantity2">Ticket Quantity</label>
                                                                    <input type="number" id="ticketquantity2" name="ticketQuantity" class="form-control" placeholder="Enter the quantity"/>
                                                                </div>
                                                                <div class="mb-4 col-lg-6 col-xl-4 col-12 mb-0">
                                                                    <label class="form-label" for="ticketType2">Ticket Type</label>
                                                                    <select id="ticketType2" class="form-select" name="ticketType">
                                                                        <c:forEach var="ticketType" items="${ticketTypes}">
                                                                            <option value="${ticketType}">${ticketType}</option>
                                                                        </c:forEach>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                            <hr />
                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <!-- /Form Repeater -->
                                        <div class="col-12">
                                            <input type="hidden" name="eventId" value="${(not empty event) ? event.id : ''}">
                                            <button type="submit" name="action" value="${(not empty event) ? 'update' : 'create'}" class="btn btn-primary">
                                                ${(not empty event) ? 'Update' : 'Create'}
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /FormValidation -->
                    </div>
                </div>
                <!-- / Content -->

                <%@include file="footer.jsp"%>

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>

    <!-- Drag Target Area To SlideIn Menu On Small Screens -->
    <div class="drag-target"></div>
</div>
<!-- / Layout wrapper -->

<!-- Core JS -->
<!-- build:js assets2/vendor/js/core.js -->

<script src="assets2/vendor/libs/jquery/jquery.js"></script>
<script src="assets2/vendor/libs/popper/popper.js"></script>
<script src="assets2/vendor/js/bootstrap.js"></script>
<script src="assets2/vendor/libs/node-waves/node-waves.js"></script>
<script src="assets2/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="assets2/vendor/libs/hammer/hammer.js"></script>
<script src="assets2/vendor/libs/i18n/i18n.js"></script>
<script src="assets2/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="assets2/vendor/js/menu.js"></script>

<!-- endbuild -->

<!-- Vendors JS -->
<script src="assets2/vendor/libs/select2/select2.js"></script>
<script src="assets2/vendor/libs/bootstrap-select/bootstrap-select.js"></script>
<script src="assets2/vendor/libs/moment/moment.js"></script>
<script src="assets2/vendor/libs/flatpickr/flatpickr.js"></script>
<script src="assets2/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="assets2/vendor/libs/tagify/tagify.js"></script>
<script src="assets2/vendor/libs/@form-validation/umd/bundle/popular.min.js"></script>
<script src="assets2/vendor/libs/@form-validation/umd/plugin-bootstrap5/index.min.js"></script>
<script src="assets2/vendor/libs/@form-validation/umd/plugin-auto-focus/index.min.js"></script>

<!-- Main JS -->
<script src="assets2/js/main.js"></script>

<!-- Page JS -->
<script src="assets2/js/form-validation.js"></script>

<!-- Page JS -->
<script src="assets2/js/forms-pickers.js"></script>
</body>
</html>

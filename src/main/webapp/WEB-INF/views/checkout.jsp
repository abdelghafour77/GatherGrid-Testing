<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="h-100">

<%@include file="includes/_head.jsp" %>

<body class="d-flex flex-column h-100">
<!-- Header Start-->
<%@include file="includes/_header.jsp" %>
<!-- Header End-->
<!-- Body Start-->
<div class="wrapper">
    <div class="breadcrumb-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-10">
                    <div class="barren-breadcrumb">
                        <nav aria-label="breadcrumb">
<%--                            <ol class="breadcrumb">--%>
<%--                                <li class="breadcrumb-item"><a href="index.html">Home</a></li>--%>
<%--                                <li class="breadcrumb-item"><a href="explore_events.html">Explore Events</a></li>--%>
<%--                                <li class="breadcrumb-item"><a href="online_event_detail_view.html">Online Event Detail View</a></li>--%>
<%--                                <li class="breadcrumb-item active" aria-current="page">Checkout</li>--%>
<%--                            </ol>--%>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="event-dt-block p-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="main-title checkout-title">
                        <h3>Order Confirmation</h3>
                    </div>
                </div>
                <div class="col-xl-8 col-lg-12 col-md-12">
                    <div class="checkout-block">
                        <div class="main-card">
                            <div class="bp-title">
                                <h4>Billing information</h4>
                            </div>
                            <div class="bp-content bp-form">
                                <div class="row">
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">First Name*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="John">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">Last Name*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="Doe">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">Email*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="johndoe@example.com" disabled>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">Address*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group main-form mt-4">
                                            <label class="form-label">Country*</label>
                                            <select class="selectpicker" data-size="5" title="Nothing selected" data-live-search="true">
                                                <option value="Algeria">Algeria</option>
                                                <option value="Argentina">Argentina</option>
                                                <option value="Australia">Australia</option>
                                                <option value="Austria">Austria (Österreich)</option>
                                                <option value="Belgium">Belgium (België)</option>
                                                <option value="Bolivia">Bolivia</option>
                                                <option value="Brazil">Brazil</option>
                                                <option value="Canada">Canada</option>
                                                <option value="Chile">Chile</option>
                                                <option value="Colombia">Colombia</option>
                                                <option value="Costa Rica">Costa Rica</option>
                                                <option value="Cyprus">Cyprus</option>
                                                <option value="Czech Republic">Czech Republic</option>
                                                <option value="Denmark">Denmark</option>
                                                <option value="Dominican Republic">Dominican Republic</option>
                                                <option value="Estonia">Estonia</option>
                                                <option value="Finland">Finland</option>
                                                <option value="France">France</option>
                                                <option value="Germany">Germany</option>
                                                <option value="Greece">Greece</option>
                                                <option value="Hong Kong">Hong Kong</option>
                                                <option value="Iceland">Iceland</option>
                                                <option value="India">India</option>
                                                <option value="Indonesia">Indonesia</option>
                                                <option value="Ireland">Ireland</option>
                                                <option value="Israel">Israel</option>
                                                <option value="Italy">Italy</option>
                                                <option value="Japan">Japan</option>
                                                <option value="Latvia">Latvia</option>
                                                <option value="Lithuania">Lithuania</option>
                                                <option value="Luxembourg">Luxembourg</option>
                                                <option value="Malaysia">Malaysia</option>
                                                <option value="Mexico">Mexico</option>
                                                <option value="Nepal">Nepal</option>
                                                <option value="Netherlands">Netherlands</option>
                                                <option value="New Zealand">New Zealand</option>
                                                <option value="Norway">Norway</option>
                                                <option value="Paraguay">Paraguay</option>
                                                <option value="Peru">Peru</option>
                                                <option value="Philippines">Philippines</option>
                                                <option value="Poland">Poland</option>
                                                <option value="Portugal">Portugal</option>
                                                <option value="Singapore">Singapore</option>
                                                <option value="Slovakia">Slovakia</option>
                                                <option value="Slovenia">Slovenia</option>
                                                <option value="South Africa">South Africa</option>
                                                <option value="South Korea">South Korea</option>
                                                <option value="Spain">Spain</option>
                                                <option value="Sweden">Sweden</option>
                                                <option value="Switzerland">Switzerland</option>
                                                <option value="Tanzania">Tanzania</option>
                                                <option value="Thailand">Thailand</option>
                                                <option value="Turkey">Turkey</option>
                                                <option value="United Kingdom">United Kingdom</option>
                                                <option value="United States">United States</option>
                                                <option value="Vietnam">Vietnam</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">State*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">City/Suburb*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-12">
                                        <div class="form-group mt-4">
                                            <label class="form-label">Zip/Post Code*</label>
                                            <input class="form-control h_50" type="text" placeholder="" value="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
<%--                        <div class="main-card mt-5">--%>
<%--                            <div class="bp-title">--%>
<%--                                <h4>Total Payable Amount : AUD $50.00</h4>--%>
<%--                            </div>--%>
<%--                            <div class="bp-content bp-form">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-lg-12 col-md-12">--%>
<%--                                        <div class="form-group mt-4">--%>
<%--                                            <label class="form-label">Card number*</label>--%>
<%--                                            <input class="form-control h_50" type="text" placeholder="" value="">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-lg-6 col-md-12">--%>
<%--                                        <div class="form-group mt-4">--%>
<%--                                            <label class="form-label">Expiry date*</label>--%>
<%--                                            <input class="form-control h_50" type="text" placeholder="MM/YY" value="">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-lg-6 col-md-12">--%>
<%--                                        <div class="form-group mt-4">--%>
<%--                                            <label class="form-label">CVV*</label>--%>
<%--                                            <input class="form-control h_50" type="text" placeholder="" value="">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-lg-12 col-md-12">--%>
<%--                                        <button class="main-btn btn-hover h_50 w-100 mt-5" type="button" onclick="window.location.href='booking_confirmed.html'">Confirm & Pay</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-12 col-md-12">
                    <div class="main-card order-summary">
                        <div class="bp-title">
                            <h4>Billing information</h4>
                        </div>
                        <div class="order-summary-content p_30">
                            <div class="event-order-dt">
                                <div class="event-thumbnail-img">
                                    <img src="<c:url value="/assets/homeAssets/images/event-imgs/img-7.jpg" />" alt="">
                                </div>
                                <div class="event-order-dt-content">
                                    <h5>${event.name}</h5>
                                    <span>${event.date}</span>
                                    <div class="category-type">Online Event</div>
                                </div>
                            </div>
                            <div class="order-total-block">
                                <div class="order-total-dt">
                                    <div class="order-text">Total Ticket</div>
                                    <div class="order-number">1</div>
                                </div>
                                <div class="order-total-dt">
                                    <div class="order-text">Sub Total</div>
                                    <div class="order-number">$50.00</div>
                                </div>
                                <div class="divider-line"></div>
                                <div class="order-total-dt">
                                    <div class="order-text">Total</div>
                                    <div class="order-number ttl-clr">AUD $50.00</div>
                                </div>
                            </div>
<%--                            <div class="coupon-code-block">--%>
<%--                                <div class="form-group mt-4">--%>
<%--                                    <label class="form-label">Coupon Code*</label>--%>
<%--                                    <div class="position-relative">--%>
<%--                                        <input class="form-control h_50" type="text" placeholder="Code" value="">--%>
<%--                                        <button class="apply-btn btn-hover" type="button">Apply</button>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="confirmation-btn">
                                <button class="main-btn btn-hover h_50 w-100 mt-5" type="button" onclick="window.location.href='booking_confirmed.html'">Confirm & Pay</button>
                                <span>Price is inclusive of all applicable GST</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Body End-->
<%@include file="includes/_footer.jsp"%>
<%@include file="includes/_js_footer.jsp" %>
</body>

</html>
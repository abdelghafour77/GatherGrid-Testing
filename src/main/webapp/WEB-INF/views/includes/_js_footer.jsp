<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="<c:url value="/assets/homeAssets/js/jquery-3.6.0.min.js"/>"></script>
<script src="<c:url value="/assets/homeAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="<c:url value="/assets/homeAssets/vendor/OwlCarousel/owl.carousel.js"/>"></script>
<script src="<c:url value="/assets/homeAssets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"/>"></script>
<script src="<c:url value="/assets/homeAssets/vendor/mixitup/dist/mixitup.min.js"/>"></script>
<script src="<c:url value="/assets/homeAssets/js/custom.js"/>"></script>
<script src="<c:url value="/assets/homeAssets/js/night-mode.js"/>"></script>
<script>
    var containerEl = document.querySelector('[data-ref~="event-filter-content"]');

    var mixer = mixitup(containerEl, {
        selectors: {
            target: '[data-ref~="mixitup-target"]'
        }
    });
</script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="shared/_header.jsp"%>

    <title>Login & Signup Form</title>
</head>
<body class="login-container">

<jsp:include page="shared/_handleAlerts.jsp"/>

<section class="wrapper active">
    <div class="form signup">
        <header>Signup</header>
        <form action="<c:url value='/auth/logup.php'/>" method="post">
            <div class="flex">
                <label>
                    <input type="text" name="firstname" placeholder="First name" required />
                </label>
                <label>
                    <input type="text" name="lastname" placeholder="Last name" required />
                </label>
            </div>
            <label>
                <input type="text" name="email" placeholder="Email address" class="w-full" required />
            </label>
            <label>
                <input type="password" name="password" placeholder="Password" class="w-full" required />
            </label>
            <div class="checkbox">
                <input type="checkbox" id="signupCheck" />
                <label for="signupCheck">I accept all terms & conditions</label>
            </div>
            <input type="submit" value="Signup" />
        </form>
    </div>

    <div class="form login">
        <header>Login</header>
        <form action="<c:url value='/auth/login.php'/>" method="post">
            <label>
                <input type="text" name="email" placeholder="Email address" class="w-full" required />
            </label>
            <label>
                <input type="password" name="password" placeholder="Password" class="w-full" required />
            </label>
            <a href="#">Forgot password?</a>
            <input type="submit" value="Login" />
        </form>
    </div>

    <script>
        const wrapper = document.querySelector(".wrapper"),
            signupHeader = document.querySelector(".signup header"),
            loginHeader = document.querySelector(".login header");

        loginHeader.addEventListener("click", () => {
            wrapper.classList.add("active");
        });
        signupHeader.addEventListener("click", () => {
            wrapper.classList.remove("active");
        });
    </script>
</section>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>Shouter</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
</head>
<body>
<%
    String uname = (String) session.getAttribute("username");
    if(uname != null) {
        request.getRequestDispatcher("/feed").forward(request, response);
    }
%>
<section class="vh-100">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div class="px-5 ms-xl-4">
                    <div id="Error">
                        ${loginError}
                        ${registerMsg}
                        ${registerError}
                        ${logoutMsg}
                    </div>
                </div>

                <div class="d-flex align-items-center justify-content-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">
                        <div class="card shadow-lg bg-light-subtle rounded-3" style="width: 100%">
                            <!-- Tabs start -->
                            <div class="card-header">
                                <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active fw-bold font-monospace" id="home-tab" data-bs-toggle="tab" data-bs-target="#login" type="button"
                                                role="tab" aria-controls="login" aria-selected="true">Login</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link fw-bold font-monospace" id="profile-tab" data-bs-toggle="tab" data-bs-target="#register" type="button"
                                                role="tab" aria-controls="register" aria-selected="false">Register</button>
                                    </li>
                                </ul>
                                <!-- Tab ends -->
                            </div>

                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                                    <h3 class="display-5 text-center mt-3 mb-3">Login</h3>
                                    <!-- Login form start -->
                                    <form action="${pageContext.request.contextPath}/login" method="post" class="container ps-5 pe-5 pb-5">
                                        <div class="mb-4">
                                            <label for="username" class="form-label">Username:</label>
                                            <div class="input-group">
                                                <span class="input-group-text">@</span>
                                                <input type="text" name="username" id="username" class="form-control" placeholder="Enter Username">
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <label for="password" class="form-label">Password:</label>
                                            <div class="input-group">
                                                <span class="input-group-text">#</span>
                                                <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password">
                                            </div>
                                        </div>
                                        <div class="mb-4 form-check">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" value="true"> Keep me logged in
                                            </label>
                                        </div>
                                        <div class="d-grid mb-3 mt-5">
                                            <button type="submit" class="btn btn-success fs-5 btn-block">Login</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- Login section ends -->
                                <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                    <h3 class="display-5 text-center mt-3 mb-3">Register</h3>
                                    <!-- Register form start -->
                                    <form action="${pageContext.request.contextPath}/register" method="post" class="container ps-5 pe-5 pb-5 was-validated">
                                        <div class="mb-4">
                                            <label for="reg-username" class="form-label">Username:</label>
                                            <div class="input-group">
                                                <span class="input-group-text">@</span>
                                                <input type="text" name="reg-username" id="reg-username" class="form-control" placeholder="Enter Username" required>
                                                <div class="invalid-feedback">Username is required!</div>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <label for="reg-password" class="form-label">Password:</label>
                                            <div class="input-group">
                                                <span class="input-group-text">#</span>
                                                <input type="password" name="reg-password" id="reg-password" class="form-control" placeholder="Enter Password" required>
                                                <div class="invalid-feedback">Password is required!</div>
                                            </div>
                                        </div>
                                        <div class="d-grid mb-3 mt-5">
                                            <button type="submit" class="btn btn-primary fs-5 btn-block">Register</button>
                                        </div>
                                    </form>
                                </div>
                                <!-- Register section ends -->
                            </div>
                        </div>
                </div>
            </div>
            <div class="col-md-6 px-0 d-none d-sm-block">
                <div class="card">
                    <img src="img/img-bar.jpg" alt="Shouter" class="card-img-top w-100 vh-100" style="object-fit: cover; object-position: left;">
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <div class="container text-center">
                            <h1 class="display-3 font-monospace fw-bolder mb-3">Shouter!</h1>
                            <p class="fw-light h3">Welcome! Share What's On Your Mind.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
<%@ page import="java.util.List" %>
<%@ page import="app.com.service.ShoutService" %>
<%@ page import="app.com.pojo.Shouts" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String uname = (String) session.getAttribute("username");
    Integer uID = (Integer) session.getAttribute("userID");
    if(uname == null) {
        request.getRequestDispatcher("/").forward(request, response);
    }
%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>My Feed</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
    <div class="container">
        <a href="${pageContext.request.contextPath}" class="navbar-brand">
            <span class="navbar-text font-monospace fw-light text-white h3">Shouter</span>
        </a>
        <div class="navbar-brand navbar-nav ms-auto">
            <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <button class="nav-link dropdown-toggle" id="dmenu" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://api.dicebear.com/6.x/bottts/png?seed=<%=uname%>" alt="<%=uname%>"
                                 style="width: 40px;" class="rounded-pill" />
                        </button>
                        <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dmenu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile?user=<%=uname%>">Profile</a></li>
                            <li class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/logout">Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!-- Navbar ends -->
<div class="container-fluid mt-3">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <!-- Shoutbox start -->
            <div class="card">
                <div class="row m-3">
                    <div class="col-md-1">
                        <img src="https://api.dicebear.com/6.x/bottts/png?seed=<%=uname%>" alt="<%=uname%>"
                             style="width: 60px;" class="rounded-pill" />
                    </div>
                    <div class="col-md-11">
                        <form action="${pageContext.request.contextPath}/shouts" method="post" id="shoutbox">
                            <div class="form-floating">
                                    <textarea form="shoutbox" name="shoutText" class="form-control"
                                              id="floatingInput" maxlength="255" placeholder="What's on your mind? (Limit: 255 characters)"
                                              style="resize: none; height: 120px"></textarea>
                                <label for="floatingInput">What's on your mind? (Limit: 255 characters)</label>
                            </div>
                            <div class="d-grid mt-3">
                                <button type="submit" class="btn btn-info fs-5 btn-block">Shout</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<%--Shoutbox ends--%>

<div class="container-fluid mt-3">
    <div class="row bir">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <!-- Listing all shouts -->
            <%
                ShoutService shoutService = new ShoutService();
                List<Shouts> allShouts = shoutService.selectAllShouts();
                Integer totalShouts = allShouts.size();
            %>
            <div class="bg-dark text-bg-dark text-center p-3 rounded fw-bolder fs-6 mt-3">My Feed (<%=totalShouts%>)</div>

            <c:forEach items="<%=allShouts%>" var="shout">
                <div class="card mt-3">
                    <div class="card-header">
                        <img src="https://api.dicebear.com/6.x/bottts/png?seed=${shout.getUsername()}"
                             alt="${shout.getUsername()}"
                             style="width: 40px;" class="rounded-pill" />
                        <a class="card-link text-decoration-none"
                           href="${pageContext.request.contextPath}/profile?user=${shout.getUsername()}">
                            <strong class="font-monospace fw-lighter">${shout.getUsername()}</strong>
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="card-text">${shout.getText()}</div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<div class="bg-dark text-center fw-semibold mt-3 fs-5 p-3 text-white-50">
    © Shouter 2023, Group project by
    <a href="https://github.com/alfa-echo-niner-ait" class="text-decoration-none">Ayub Ali Emon</a>
    &
    <a href="https://github.com/pn-pluto" class="text-decoration-none">Phonesamay Phoutthavong</a>
</div>
</body>
</html>

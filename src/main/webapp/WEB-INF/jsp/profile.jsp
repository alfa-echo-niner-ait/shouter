<%@ page import="app.com.pojo.Shouts" %>
<%@ page import="app.com.service.ShoutService" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String uname = (String) session.getAttribute("username");
    Integer uID = (Integer) session.getAttribute("userID");
    if(uname == null) {
        request.getRequestDispatcher("/").forward(request, response);
    }
    String user = request.getParameter("user");
%>

<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title><%=user%>'s Profile</title>

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
            <div class="col-md-8 text-center font-monospace mt-3 mb-3">
                <img src="https://api.dicebear.com/6.x/bottts/png?seed=<%=user%>" alt="<%=user%>"
                     style="width: 120px;" class="img-thumbnail rounded-pill shadow-lg" />
                <div class="display-6"><%=user%></div>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
<%--    Profile info ends--%>

    <div class="container-fluid mt-3">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <!-- Listing all shouts of user -->
                <%
                    ShoutService shoutService = new ShoutService();
                    List<Shouts> userShouts = shoutService.selectShoutsByUser(user);
                    Integer totalShouts = userShouts.size();
                %>
                <%
                    if(userShouts.isEmpty()) {
                        String error = "<div class='alert alert-danger alert-dismissible ms-3 me-3 mt-lg-5' fade show>" +
                                    "<button type='button' class='btn-close' data-bs-dismiss='alert'></button>" +
                                    "Sorry! No shouts found for <strong>" + user + "</strong>" +
                                "</div>";
                        out.println(error);
                    }
                %>
                <div class="bg-dark text-bg-dark text-center p-3 rounded fw-bolder fs-6">All Shouts (<%=totalShouts%>)</div>

                <c:forEach items="<%=userShouts%>" var="shout">
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
                        <c:if test="<%=uname.equals(user)%>">
                            <div class='card-footer mt-3'>
                                    <a href="${pageContext.request.contextPath}/edit?shouter=${shout.getUsername()}&sid=${shout.getShoutID()}"
                                       class='btn btn-primary btn-sm ps-3 pe-3 me-3'>Edit</a>
                                    <button class='btn btn-danger btn-sm' data-bs-toggle='modal' data-bs-target='#${shout.getShoutID()}'>
                                        Delete
                                    </button>
                            </div>
                            <!-- Delete Modal starts-->
                            <div class="modal" id="${shout.getShoutID()}">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <!-- Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">Confirm delete shout?</h4>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <!-- Body -->
                                        <div class="modal-body">${shout.getText()}</div>
                                        <!-- Footer -->
                                        <div class="modal-footer">
                                            <a href="${pageContext.request.contextPath}/deleteShout?shouter=${shout.getUsername()}&sid=${shout.getShoutID()}"
                                               class="btn btn-success">Yes</a>
                                            <button class="btn btn-danger" data-bs-dismiss="modal">No</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Delete Modal ends -->
                        </c:if>
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

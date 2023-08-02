<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html data-bs-theme="dark">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>
    <title>404 Not Found!</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container mt-lg-5 mx-auto text-center">
        <div class="alert alert-danger display-6 text-center m-5 p-5 font-monospace shadow-lg">
            404 Not Found!
        </div>
        <a class="btn btn-lg btn-warning h1 text-center shadow-lg ps-5 pe-5 font-monospace fw-bolder"
           href="${pageContext.request.contextPath}">Go Back Home</a>
    </div>
</body>
</html>

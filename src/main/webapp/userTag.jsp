<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
    <script>
        fetch("/food.jsp")
         .then((resp) => resp.text())
          .then((inner) => {
        	  document.body.innerHTML = inner;
          });

         function submitForm(){
        var form = document.getElementById("foodTotal")
        var formData = new FormData(form);
        var jsonObject = {};

        var foodCategory = document.getElementById("foodCategory").value;
        var preference = document.getElementById("preference").value;

        formData.forEach

    }
    </script>
</html>
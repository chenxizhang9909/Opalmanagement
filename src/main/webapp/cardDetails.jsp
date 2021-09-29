<%-- 
    Document   : cardDetails
    Created on : 2021-9-30, 1:20:50
    Author     : chengming
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="css/general_layout.css">
        <link rel="stylesheet" href="css/general_form.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>card details</title>
    </head>
    <body onload="startTime()">
         <div class="container-md bg-white" style="margin-top: 150px">
            <table class="table"> 
                <tr><th>#:</th><td></td></tr>
                <tr><th>Opal card number:</th><td></td></tr>
                <tr><th>Nickname:</th><td></td></tr>
                <tr><th>Security Code:</th><td></td></tr>
                <tr><th>Card type:</th><td></td></tr>
                <tr>
                    <td colspan="2">
                        <a href="" class="btn btn-sm btn-danger">Update</a>
                        <a href="" class="btn btn-sm btn-primary">Delete</a>
                    </td>
                </tr>
            </table>

        </div>
    </body>
</html>

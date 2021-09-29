<%-- 
    Document   : cardManage
    Created on : 2021-9-30, 1:20:19
    Author     : chengming
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="css/general_layout.css">
        <link rel="stylesheet" href="css/general_form.css">
        <script type="text/javascript" src="js/index.js"></script>
        <title>card list</title>
    </head>
    <body onload="startTime()">
        
        
        <div class="container-md bg-white p-4" style="margin-top: 150px">
            <h2 class="text-info mb-2">Opal cards</h2>
            <div align="center">
                <a href="addpayment.jsp">Add an Opal card</a>
            </div>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">User ID</th>
                        <th scope="col">Opal card number</th>
                        <th scope="col">Security code</th>
                        <th scope="col">Nickname</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="" class="btn btn-sm btn-secondary">View</a></td>
                    </tr>
            
                </tbody>
            </table>
        </div>
    </body>
</html>

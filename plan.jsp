<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" href="css/index.css">
    <style type="text/css">
        body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
        #allmap{width:400px;height:300px;border:3px solid #01DF74;left:40%;top:40%;position: absolute}
        p{margin-left:5px; font-size:14px;}
        #r-result{background: #000000;top:27%;position: absolute;left:65%;width:300px}
        #r-result table{background: #000000;top:40%;position: absolute;left:30%}
        input { font-family: "micrsoft yahei"; width: 320px; height: 2em; font-size: 1em; line-height: 2em; border: 0px; outline: 0px; padding: .2em 1em; margin: 0em 10%;top:50%;position: absolute;left:5%}
        button {width: 32%; text-align: center; border: 0; border-radius: 0; background-color: inherit; height: 44px; line-height: 44px; font-size: 15px;}
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=RD4YBqk83pBOs6hlspXn3v3X664CjmIE"></script> 
    <!--use baidu API key to access the map component-->
    <script type="text/javascript" src="http://libs.baidu.com/jquery/1.8.2/jquery.min.js"></script>
    <title>BookSiYi</title>
</head>
<body>
    <header class="masthead mb-auto">
                <div class="inner">
                    <h3 class="masthead-brand">IoTBay</h3>
                    <nav class="nav nav-masthead justify-content-center">
                        <a class="nav-link active" href="index.html">Home</a>
                        <a class="nav-link active" href="plan.jsp">Easy Travel</a>
                        <a class="nav-link" href="#"></a>
                    </nav>
                </div>
            </header>

<div id="search">
    <input type="text" id="start" placeholder="Locating youre position..." style="border-bottom: 1px solid #DDD; " />
    <input type="text" id="end" placeholder="Please select where you want to go"  οnchange="searchRoute()"/>
</div>
<div id="allmap"></div>
<div id="r-result"></div>
<script type="text/javascript">
 
        $("#bus-search").css("background-color", "#95B7EE");
        window.start_point = "";
        window.end_point = "";
        // locate
        var map;
        var geoc = new BMap.Geocoder();
        var geolocation = new BMap.Geolocation();
        geolocation.getCurrentPosition(function(r){
            if(this.getStatus() == BMAP_STATUS_SUCCESS){
                //var mk = new BMap.Marker(r.point);
                //map.addOverlay(mk);
                //map.panTo(r.point);
                window.start_point = r.point.lng+","+r.point.lat;

                map = new BMap.Map("allmap");   // create
                var ep = window.start_point.split(",");
                
                function addMapControl(){
                    //Add zoom controls to the map
                    var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_ZOOM});
                    map.addControl(ctrl_nav);
                    //Add a scale control to the map
                    var ctrl_sca = new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,offset: new BMap.Size(10, 5)});
                    map.addControl(ctrl_sca);
                }
                map.centerAndZoom(new BMap.Point(ep[0],ep[1]), 13);
                map.enableScrollWheelZoom(true);       //Enable scroll wheel to zoom in and out
                var local = new BMap.LocalSearch(map, {
                    renderOptions:{map: map}
                });
                local.search("图书馆");
 
                setLocation(r.point);
 
                addMapControl();
            }else {
                $("#start").attr("placeholder","Please enter your current location")
                alert('Sorry we can not locate your position, please enter manually'+this.getStatus());
            }
        },{enableHighAccuracy: true});
 
 
        function setLocation(point){
            geoc.getLocation(point, function(rs){
                var addComp = rs.addressComponents;
                var result = addComp.province + addComp.city + addComp.district;
                $("#start").val(result);
 
                //set icon
                var new_point = new BMap.Point(rs.point.lng,rs.point.lat);
                var myIcon = new BMap.Icon("http://www.zhouyfei.xin/mapImage/myload.gif", new BMap.Size(30,30),{
                    anchor:new BMap.Size(13,15),
                    imageOffset:new BMap.Size(0,0)
                });
                var marker = new BMap.Marker(new_point,{icon:myIcon,isOpen:true});
                map.addOverlay(marker);
                var opts = {
                    width : 40,     
                    height: 18,     
                    title : "Where Am I" , //information display
                    isOpen: 1,
                }
                var infoWindow = new BMap.InfoWindow("location : "+$("#start").val(), opts);  // create window
                marker.addEventListener("click", function(){
                    map.openInfoWindow(infoWindow,new_point); //open window
                });
                //Set up monitoring, click on the map to set the destination, plan the route
                map.addEventListener("click",
                    function(e) {
                        window.end_point = e.point.lng +","+ e.point.lat;
                        var local = new BMap.LocalSearch(map, {
                            renderOptions:{map: map}
                        });
                        searchRoute();
                    });
            });
        }
 
        var type="bus";
        $("#bus-search,#driver-search,#walk-search").click(function(){
            var id = $(this).attr("id");
            $(".button").css("background-color","#fff");
            $("#"+id).css("background-color","#95B7EE");
            type = "bus";
            if(id == "bus-search"){
                type = "bus";
            }else if(id == "driver-search"){
                type = "driver";
            }else if(id == "walk-search"){
                type = "walk";
            }
            searchRoute();
        });
 
        //Search route
        function searchRoute(){
            if($("#end").val().length!=0){
                var end = $("#end").val();
                $("#end").val("");
            }else{
                var pe = window.end_point.split(",");
                var end = new BMap.Point(pe[0],pe[1]);
            }
            var ps = window.start_point.split(",");
            var start = new BMap.Point(ps[0], ps[1]);
            var starIcon = new BMap.Icon("http://www.zhouyfei.xin/mapImage/start.png", new BMap.Size(22, 32));
            var endIcon = new BMap.Icon("http://www.zhouyfei.xin/mapImage/end.png", new BMap.Size(22,32));
            if(type == "bus"){
                var transit = new BMap.TransitRoute(map, {renderOptions: {map: map, panel: "r-result", autoViewport: false}});
                transit.search(start, end);
                transit.setMarkersSetCallback(function(result){
                    result[0].marker.setIcon(starIcon);
                    result[1].marker.setIcon(endIcon);
                });
            }
        }
</script>
</body>
</html>
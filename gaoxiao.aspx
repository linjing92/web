<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gaoxiao.aspx.cs" Inherits="网页开发模板._Default" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>


 <html>
<head id="Head1" runat="server">
    <title>GeoIP</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />

<script language="javascript" type="text/javascript" for="XQWLight" event="onclick">
// <!CDATA[
return XQWLight_onclick()
// ]]>
</script>
</head>
<body onload="initialize()">
<form id="form1" runat="server">  
<div id="container">
  <div id="header"></div>
   <div id="menu">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <A 
            href="gaoxiao.aspx"><img onmouseout="this.src='shouye.png'" onmouseover="this.src='shouye2.png'" 
          src="shouye.png" style="width: 64px; height: 34px;" /></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <A 
            href="Bus.aspx"><img onmouseout="this.src='gongjiao.png'" onmouseover="this.src='gongjiao2.png'" 
          src="gongjiao.png" style="width: 64px; height: 34px;" /></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <A 
            href="GeoIP.aspx"><img onmouseout="this.src='ip.png'" onmouseover="this.src='ip2.png'" 
          src="ip.png" style="width: 64px; height: 34px;" /></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <A 
            href="GeoWeather.aspx"><img onmouseout="this.src='tianqi.png'" onmouseover="this.src='tianqi2.png'" 
          src="tianqi.png" style="width: 64px; height: 34px;" /></A>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <A 
            href="gaoxiao.aspx"><img onmouseout="this.src='gaoxiao.png'" onmouseover="this.src='gaoxiao2.png'" 
          src="gaoxiao.png" style="width: 64px; height: 34px;" /></A></div>
  <div id="mainContent">
      &nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <br />
&nbsp;<br />
      <TD>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <OBJECT id=XQWLight border=0 
        codeBase="http://www.wsexpo.com/xiangqi/swflash.cab#version=9,0,0,0" 
        classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=520 
        align=middle height=576><PARAM NAME="allowScriptAccess" VALUE="always"><PARAM NAME="allowFullScreen" VALUE="false"><PARAM NAME="movie" VALUE="南京挤公交Flash.swf"><PARAM NAME="quality" VALUE="high"><PARAM NAME="menu" VALUE="false">
        <embed src="南京挤公交Flash.swf" align="middle" border="0" width="520" 
        height="576" name="XQWLight" quality="high" allowscriptaccess="always" 
        menu="false" allowfullscreen="false" 
        type="application/x-shockwave-flash" 
        pluginspage="http://www.macromedia.com/go/getflashplayer" /></OBJECT></TD></div>
        </div>  


      

  
      

  
</form>
</body>
</html>
<script type="text/javascript">
var map = new BMap.Map("map_canvas");
var start = "北京大学" ,end = "西单",routePolicy = [BMAP_TRANSIT_POLICY_LEAST_TIME,BMAP_TRANSIT_POLICY_LEAST_TRANSFER,BMAP_TRANSIT_POLICY_LEAST_WALKING];
map.centerAndZoom(new BMap.Point(116.404, 39.915), 15);
    var transit = new BMap.TransitRoute(map, {
            renderOptions: {map: map,panel: "results"},            
            onPolylinesSet: function(lines,routes){
                for(var i = 0 ; i < lines.length ; i ++){
                    if(lines[i].type == BMAP_LINE_TYPE_SUBWAY){
                        lines[i].getPolyline().setStrokeColor("red");
                       
                    }
                }
            }
    });
    

function keywordSearch(){
	cityname = document.getElementById("city").value;
	start_name = document.getElementById("keyword").value;
	end_name = document.getElementById("keyword1").value;
	var i = 1 ;var che="";
	if(cityname == ""){
		che += i + "．请您输入城市\n" ;
		i = i + 1 ;
	}
	if(start_name == ""){
		che += i + "．请您输入起点\n" ;
		i = i + 1 ;
	}
	if(end_name == ""){
		che += i + "．请您输入终点\n" ;
		i = i + 1 ;
	}
	if(i == 1){
		start=start_name;
		end=end_name;
		map.clearOverlays();
		transit.search(start_name,end_name);
	}else{
		alert(che);
	}
}


    var arrInput = document.getElementById("dvPolicy").getElementsByTagName("input");
    //search(start,end,routePolicy[0]);
    document.getElementById("dvPolicy").onclick = function(e){
        e = e || window.event;
        var elem = e.srcElement || e.target , policyIndex;
        if(elem.tagName.toLowerCase() == "input"){
            policyIndex = elem.getAttribute("id").replace("policy","");
            map.clearOverlays();
            search(start,end,routePolicy[policyIndex]);
        }
    }
    function search(start,end,route){ 
        var transit = new BMap.TransitRoute(map, {
            renderOptions: {map: map,panel:"results"}, 
            policy: route
        });
        transit.search(start,end);
    }
function XQWLight_onclick() {

}

</script>
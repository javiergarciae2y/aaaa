<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
 
<head>
 
	<jsp:include page="head.jsp"></jsp:include>	
	<title>Devices Conected</title>

</head>

<body>
	
	<%Integer permissions = (Integer)session.getAttribute("permissions");%>

	<c:if test="${permissions == 3}">
		<jsp:include page="menuA.jsp"/>
	</c:if>
	<c:if test="${permissions != 3}">
		<jsp:include page="menu.jsp"/>
	</c:if>
	
 
	<jsp:include page="menuF.jsp"/>
	

      <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar">
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="/statistics">Overview </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/statFiles">Storage/Files</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/statUser">Users </a>
            </li>
          </ul>

          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link" href="/userList">List of Users </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="/devicesList">List of Devices <span class="sr-only">(current)</span></a>
            </li>
             </ul>
          </nav>
          
    <main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">
          <h2 style="color:black;align-text:center; margin: 0 auto; margin-top: 5%"align="center">List Devices</h2> 
          
	<div style="color:red">${Msg}</div>
	
	<div class="table-responsive" align="center">
    <table class="table table-striped">
    <thead>
		<TR>
			<TH>IP</TH>
			<TH>MAC</TH>
			<TH>totalSize</TH>
			<TH>useSize </TH>
			<TH>conexionDate</TH>
		</TR>
		</thead>
		<tbody>
		<c:forEach items="${devices}" var="dev">
			<tr>
				<td> ${dev.ip} </td>
				<td> ${dev.mac} </td>
				<td> ${dev.totalSize}  </td>
				<td> ${dev.useSize}</td>
				<td> ${dev.conexionDate}  </td>

				<td>
					<a href = "/deleteDevice?deviceId=${dev.idRaspberry}" onclick="return confirma()"><img src="resources/img/iconDeletematerial.png"/></a>
				</td>
 			</tr>
 		</c:forEach>
 		</tbody>
 	</table>
 	</div>
 	<form align="center" action="addDevices" method="post">
 	The operation may take a few minutes to get results.
 		<input type="submit" value="Add Local Network Devices"/>
     </form>
     <br><br>
     
     <form action="addDeviceManually" method="post">
     	Write the Ip of the remote device:<br/>
     	<input type="text" name="ip" value="000.000.000.000"/><br/>
     	Write the port of the remote device:<br/>
     	<input type="text" name="port" value="8080"/><br/>
     	<input type="submit" value="Add Remote Device"/>
     </form> 	
     </main>
 	</div>
	</div>

</body>
 
</html>
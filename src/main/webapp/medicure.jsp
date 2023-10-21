<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Banking Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #BDEBF7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 600px;
            padding: 20px;
            background-color: #ccffcc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #cccccc;
            border-radius: 3px;
        }
        .search{
        width: 50%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
            background-color: #f2f2f2;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"], input[type="button"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin: 5px;
        }
    </style>
</head>
<body>
    <div style="margin: 5px 10px 5px 0;">
        <h3 class="form-header">MyMedicure Registration Form</h3>
        <form action="addAccounts" id="bankingForm" type="POST">
            <label for="id">Enter your Doctor ID</label>
            <input type="text" name="id" id="id" size="20">

            <label for="name">Enter your name:</label>
            <input type="text" name="name" id="name" size="20">

            <label for="address">Enter your address:</label>
            <input type="text" name="address" id="address" size="50">

            <label for="contact">Enter your contact:</label>
            <input type="text" name="contact" id="contact" size="50">
            
            <div class="buttons">
                <input type="submit" value="Add Doctor" onclick="addDoctor()">
                <input type="button" value="Update Doctor" onclick="updateDoctor()">
                <input type="button" value="Delete Doctor" onclick="deleteDoctor()">
            </div>
             </form>
    </div>    
    <div style="padding-left: 60px">  
    <h4>Account Details</h4>
            <table id="doctordetailstb">
                <thead>
                    <tr>
                        <th>Doctor ID</th>
                        <th>Doctor Name</th>
                        <th>Doctor Address</th>
                        <th>Contact Number</th>
                    </tr>
                </thead>
                <tbody>
                <form action="Search" id="searchForm" type="POST">
                
                <label for="id" style="display:inline-block;">Enter Doctor ID</label>
               
         				<input class="search" type="text" name="sid" id="sid" size="2" style="width:20%">
						<input type="button" value="search" id="sbtn"  onclick="searchDoctor()">
               
                </form>
                

          <c:forEach items="${bankingList}" var="banking">
      
			        <tr>
			          <td style="border: 1px solid #ddd; padding: 8px; text-align: left; background-color: #f2f2f2;">${banking.bankingId}</td>
			          <td style="border: 1px solid #ddd; padding: 8px; text-align: left; background-color: #f2f2f2;">${banking.customerName}</td>
			          <td style="border: 1px solid #ddd; padding: 8px; text-align: left; background-color: #f2f2f2;">${banking.customerAddress}</td>
			          <td style="border: 1px solid #ddd; padding: 8px; text-align: left; background-color: #f2f2f2;">${banking.contactNumber}</td>
			        </tr>
			      </c:forEach>
                </tbody>
            </table>

            
       </div>
       
    
    <script>

	
function addDoctor(){
	var form = document.getElementById("bankingForm");
	form.action="addDoctor";
	//alert (document.getElementById("bankingForm").action);
	form.method="POST";
	form.method.type="POST";
	//alert (document.getElementById("bankingForm").method);
	form.submit();
}

function searchDoctor(){
	 var searchform = document.getElementById('sid').value;
	console.log(searchform);
	
	
		fetch("http://localhost:8080/Doctor/"+searchform)
    .then(response => response.json())
    .then(data => {
      console.log(data);
      printdatatotable(data)
      
    })
    .catch(error => {

      console.error(error);
    });
}

function printdatatotable(data){
	document.getElementById("doctordetailstb").innerHTML=`
			<thead>
            <tr>
                <th>Doctor ID</th>
                <th>Doctor Name</th>
                <th>Doctor Address</th>
                <th>Contact Number</th>
            </tr>
        </thead>
        <tbody>
        <tr>
       			 <th>` +data.bankingId +`</th>
      			<th>` +data.customerName+`</th>
      			  <th>` +data.customerAddress+`</th>
      			  <th>` +data.contactNumber+`</th>
    </tr>
        </tbody>`
}    


function updateDoctor(){
	var form = document.getElementById("bankingForm");
	form.action="updateDoctor";
	form.method="PUT";
	form.method.type="PUT";
	form.submit();
}

function deleteDoctor(){
	var form = document.getElementById("bankingForm");
	form.action="deleteDoctor";
	form.method="DELETE";
	form.method.type="DELETE";
	form.submit();
}

</script>  
    
    
    
</body>
</html>


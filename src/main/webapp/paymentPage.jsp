<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
 

	<%
    if (request.getAttribute("card") == null) {
        response.sendRedirect("paymentServlet"); 
    }
	%>

    
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/paymentPage.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
	<title>Payment Portal</title>
	<link rel="icon" type="image/png" href="images/faviconIcon.png">
	
	<style>
		.card 
		{
		  display: inline-block;
		  width: 91%;
		  margin-right: 20px;
		  transition-duration: 0.8s;
		  color: white;
		  border-radius: 15px;
		  border-style: none;
		  height: 193px;
		  margin-left: 54px;
		  margin-top: 44px;
		  background-image: url("images/cardImg.jpg");
		  background-size: 327px 193px;
		}
		
		.addCard 
{
	display: inline-block;
  width: 91%;
  margin-right: 20px;
  transition-duration: 0.8s;
  color: white;
  border-radius: 15px;
  height: 193px;
  margin-left: 54px;
  margin-top: 44px;
  background-image: url("images/cardImg.jpg");
  background-size: 327px 193px;
  
  display: flex;
  justify-content: center; /* horizontal centering */
  align-items: center;     /* vertical centering */
  
}

.addCard:hover 
{
	scale : 105%;
	transition-duration : 0.8s;
}
	</style>


</head>
<body>

	<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="StudentDashboardServlet">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="StudentDashboardServlet">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="viewResult.jsp">Exam</a>
		        </li>
		        
		        <li class="nav-item" >
		          <a class="nav-link" href="#">FAQ</a>
		        </li>
            
		        
		      </ul>
		
		    
		            
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/signOut.png">
		      
		      </div>
		      
		        
		      <div class = "profile-pic">
			   	  	
				<img class ="profile-pic img" src = "images/profilePic.png">
		      </div>
		      
		     
		    </div>
		  </div>
	</nav> 
	
	<div class = "mainDiv">
	
	
		<div class = "leftDiv">
				
			<c:forEach items = "${card}" var = "card">
			
				<div class = "card" 

					onclick = "savedCard(this)"
					data-cardNum = "${card.cardNum}"
					data-expDate = "${card.expDate}"
					data-cvv = "${card.cvv}"
					data-bank = "${card.bank}">
					
					<div><img class = "cardIcon" src = "images/nfcIcon.png" alt = "nfcIcon"></div>
					<div><img style = "float : left; margin: 0px 0px 0px 9px; width : 67px; height : 67px;" class = "cardIcon" src = "images/masterCard.png" alt = "nfcIcon"></div>
					
					<p class = "cardNum">${card.cardNum}</p>
					<span style = "margin :14px 85px 5px 30px" class = "cardtextDiv cardText">Exp : ${card.expDate}</span>
					<span class = "cardtextDiv cardText">cvv : ${card.cvv}</span>
						
				</div>		
							
			</c:forEach>
			
				<div class = "addCard" onclick="location.href='addCard.jsp'">
				
					<img alt="addCard" src = "images/add.png" width = "50px" height = "50px">
				
				</div>
			
			
			
		</div>
				

			
		<div class = "rightDiv">

			<!-- Form to store details -->
			
			
			<div class = "formDiv">
			<form action = "paymentServlet" method = "POST">
				
		
					<div class="mb-3">
					  <label for="stdNum" class="form-label" >Registration No.</label>
					  <input class="form-control" type="text" class="form-control" name = "stdNum" id = "stdNum" required >
					</div>
					
					<div class="mb-3">
					  <label for="cardNum" class="form-label" >Card Num</label>
					  <input class="form-control" type = "text" name = "cardNum" id = "cardNum" placeholder = "xxxx-xxxx-xxxx-xxxx" style = "letter-spacing: 5px;" required>
					</div>
					
					
					
					<div class="mb-3">
					  <label for="expDate" class="form-label">Exp Date</label>
					  <input class="form-control" type = "text" name = "expDate" id = "expDate" required>
					</div>
					
					<div class="mb-3">
					  <label for="cvv" class="form-label">cvv</label>
					 <input class="form-control" type = "text" name = "cvv" id = "cvv" required>
					</div>
					
					<div class="mb-3">
					  <label for="amount" class="form-label">Amount</label>
					 <input class="form-control" type = "text" name = "amount" id = "amount" required>
					</div>
					
					
					
				
					<button type="submit" class="btn btn-primary btn-lg">Pay</button>
						
		
				</form>
				
				</div>
		
			
		 </div>
		
	 </div>
	


    <!-- for the cards on the left side -->	
    
	
	
	<!-- JS function to pass the stored card values to the form -->
	<script>
	
		function savedCard(div) 
		{
			
		    var cardNum = div.getAttribute('data-cardNum');
		    var bank = div.getAttribute('data-bank');
		    var expDate = div.getAttribute('data-expDate');
		    var cvv = div.getAttribute('data-cvv');
	
		   
		    document.getElementById('cardNum').value = cardNum;
		    document.getElementById('cvv').value = cvv;
		    document.getElementById('expDate').value = expDate;
		    document.getElementById('bank').value = bank;
	
		}
	
	</script>

</body>
</html>
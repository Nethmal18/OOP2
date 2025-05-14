<%@ page import="java.util.*,com.school.model.Income" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Income Management</title>
    <link rel="stylesheet" href="css/Income.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="teacherDashboard.css">
	
	<style>

		.nav-item 
		{
			margin-right : 50px;
		}
		
		.nav-item a:hover{
			
			color : royalblue;
		}
		
		.navbar-brand {
		
		  font-size: var(--bs-navbar-brand-font-size);
		  color: var(--bs-navbar-brand-color);
		  text-decoration: none;
		  white-space: nowrap;
		  top: -23px;
		  left: -8px;
		  position:absolute;
		  height : 50px;
		  margin-top : 0px;
		}
		
		.navbar 
		{
			height : 80px !important;
		}
		
		
		.logOutDiv {
		  display: inline-block;
		  margin-right: 0px;
		  transition-duration: 0.5s;
		}
		
		
		.logOutDiv:hover 
		{
			scale : 110%;
			transition-duration: 0.5s;
		}
		
		
		.pfpDiv 
		{
			display : inline-block;
			margin-right: 60px;
		}
		
		
		.logOutIcon 
		{
			width: 70px;
		 	 height: 70px;
		}
		
		.profile-pic {
		  width: 43px;
		  height: 43px;
		  margin-right: 23px;
		}
		
		.profile-pic img {
		            width: 100%;
		            height: 100%;
		 }
	
	
	
	
	
	
	
	
	</style>
</head>
<body>

<!--nav bar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary" >
		  <div class="container-fluid">
		        <a class="navbar-brand" href="FinanceManager.jsp">
     				 <img src="images/LogoResized.png" alt="LOGO" width="136" height="122"> 
     		    </a>

		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        
		        
		        <li class="nav-item" style = "margin-left : 130px">
		          <a class="nav-link" href="FinanceManager.jsp">Home</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="IncomeServlet">Incomes</a>
		        </li>
		        
		        <li class="nav-item">
		          <a class="nav-link" href="ExpensesServlet">Expenses</a>
		        </li>
		        
           
		      </ul>
		
		    <div style = "margin-top : 10px" onclick = "location.href='FinanceManager.jsp'"  class = "logOutDiv">
		
					<img class ="profile-pic" src = "images/notifications.png">
		      
		      </div>
		     
		      
		      <div   onclick = "location.href='home.jsp'"  class = "logOutDiv">
		
					<img class ="logOutIcon" src = "images/logout.gif">
		      
		      </div>
		   
		     
		    </div>
		  </div>
	</nav>  
<div class="container">


    <h2>Income Management</h2>

    <% String message = (String)request.getAttribute("message");
       if (message != null) { %>
    <div class="success-message">
        <i class="fas fa-check-circle"></i> <%= message %>
    </div>
    <% } %>

    <!-- Add Income Form -->
    <div class="form-container">
        <div class="form-header">Add New Income</div>
        <form action="IncomeServlet" method="post">
            <input type="hidden" name="action" value="add" />
            
            <div class="form-group">
                <label for="type">Income Type</label>
                <select id="type" name="type" required>
                    <option value="" disabled selected>Select Type</option>
                    <option value="Tuition Fees">Tuition Fees</option>
                    <option value="Admission Fees">Admission Fees</option>
                    <option value="Exam Fees">Exam Fees</option>
                    <option value="Library Fees">Library Fees</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" step="0.01" id="amount" name="amount" required placeholder="Enter amount" />
            </div>
            
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" required />
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Add Income
                </button>
            </div>
        </form>
    </div>

    <!-- Income List -->
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                List<Income> incomes = (List<Income>)request.getAttribute("incomes");
                if (incomes != null && !incomes.isEmpty()) {
                    for (Income income : incomes) {
                %>
                <tr>
                    <td><%= income.getId() %></td>
                    <td><%= income.getIncomeType() %></td>
                    <td>$<%= String.format("%.2f", income.getAmount()) %></td>
                    <td><%= income.getDate() %></td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-success btn-sm" onclick="showUpdateForm(<%= income.getId() %>)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <form action="IncomeServlet" method="post" style="display:inline; margin:0;">
                                <input type="hidden" name="id" value="<%= income.getId() %>" />
                                <input type="hidden" name="action" value="delete" />
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this income record?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <tr id="updateForm<%= income.getId() %>" class="update-form-row" style="display:none;">
                    <td colspan="5">
                        <form action="IncomeServlet" method="post" class="update-form">
                            <input type="hidden" name="id" value="<%= income.getId() %>" />
                            <input type="hidden" name="action" value="update" />
                            
                            <div class="form-group">
                                <label for="updateType<%= income.getId() %>">Type</label>
                                <select id="updateType<%= income.getId() %>" name="type" required>
                                    <option value="Tuition Fees" <%= income.getIncomeType().equals("Tuition Fees") ? "selected" : "" %>>Tuition Fees</option>
                                    <option value="Admission Fees" <%= income.getIncomeType().equals("Admission Fees") ? "selected" : "" %>>Admission Fees</option>
                                    <option value="Exam Fees" <%= income.getIncomeType().equals("Exam Fees") ? "selected" : "" %>>Exam Fees</option>
                                    <option value="Library Fees" <%= income.getIncomeType().equals("Library Fees") ? "selected" : "" %>>Library Fees</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="updateAmount<%= income.getId() %>">Amount</label>
                                <input type="number" step="0.01" id="updateAmount<%= income.getId() %>" name="amount" value="<%= income.getAmount() %>" required />
                            </div>
                            
                            <div class="form-group">
                                <label for="updateDate<%= income.getId() %>">Date</label>
                                <input type="date" id="updateDate<%= income.getId() %>" name="date" value="<%= income.getDate() %>" required />
                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save"></i> Update
                                </button>
                                <button type="button" class="btn btn-danger" onclick="hideUpdateForm(<%= income.getId() %>)">
                                    <i class="fas fa-times"></i> Cancel
                                </button>
                            </div>
                        </form>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="5" style="text-align: center; padding: 20px;">
                        <i class="fas fa-info-circle"></i> No income records found.
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</div>

<script>
function showUpdateForm(id) {
    const updateForm = document.getElementById('updateForm' + id);
    updateForm.style.display = 'table-row';
}

function hideUpdateForm(id) {
    const updateForm = document.getElementById('updateForm' + id);
    updateForm.style.display = 'none';
}
</script>

</body>
</html>
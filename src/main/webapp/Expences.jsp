<%@ page import="java.util.*,com.school.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expenses Management</title>
    <link rel="stylesheet" href="css/Expenses.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" >
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

    <h2>Expenses Management</h2>

    <% String message = (String)request.getAttribute("message");
       if (message != null) { %>
    <div class="success-message">
        <i class="fas fa-check-circle"></i> <%= message %>
    </div>
    <% } %>

    <!-- Add Expense Form -->
    <div class="form-container">
        <div class="form-header">Add New Expense</div>
        <form action="ExpensesServlet" method="post">
            <input type="hidden" name="action" value="add" />

            <div class="form-group">
                <label for="etype">Expense Type</label>
                <select id="etype" name="etype" required>
                    <option value="" disabled selected>Select Type</option>
                    <option value="Administrative Expenses">Administrative Expenses</option>
                    <option value="Academic Expenses">Academic Expenses</option>
                    <option value="Facility & Maintenance">Facility & Maintenance</option>
                    <option value="Capital Expenditures">Capital Expenditures</option>
                </select>
            </div>

            <div class="form-group">
                <label for="eamount">Amount</label>
                <input type="number" step="0.01" id="eamount" name="eamount" required placeholder="Enter amount" />
            </div>

            <div class="form-group">
                <label for="edate">Date</label>
                <input type="date" id="edate" name="edate" required />
            </div>

            <div class="form-group">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i> Add Expense
                </button>
            </div>
        </form>
    </div>

    <!-- Expenses List -->
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
                List<Expenses> expenses = (List<Expenses>)request.getAttribute("expenses");
                if (expenses != null && !expenses.isEmpty()) {
                    for (Expenses expense : expenses) {
                %>
                <tr>
                    <td><%= expense.getEx_id() %></td>
                    <td><%= expense.getExpenses_type() %></td>
                    <td>$<%= String.format("%.2f", expense.getEx_amount()) %></td>
                    <td><%= expense.getDate() %></td>
                    <td>
                        <div class="action-buttons">
                            <button class="btn btn-success btn-sm" onclick="showUpdateForm(<%= expense.getEx_id() %>)">
                                <i class="fas fa-edit"></i>
                            </button>
                            <form action="ExpensesServlet" method="post" style="display:inline; margin:0;">
                                <input type="hidden" name="eid" value="<%= expense.getEx_id() %>" />
                                <input type="hidden" name="action" value="delete" />
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this expense record?')">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </form>
                        </div>
                    </td>
                </tr>
                <tr id="updateForm<%= expense.getEx_id() %>" class="update-form-row" style="display:none;">
                    <td colspan="5">
                        <form action="ExpensesServlet" method="post" class="update-form">
                            <input type="hidden" name="eid" value="<%= expense.getEx_id() %>" />
                            <input type="hidden" name="action" value="update" />
                            
                            <div class="form-group">
                                <label for="updateType<%= expense.getEx_id() %>">Type</label>
                                <select id="updateType<%= expense.getEx_id() %>" name="etype" required>
                                    <option value="Administrative Expenses" <%= expense.getExpenses_type().equals("Administrative Expenses") ? "selected" : "" %>>Administrative Expenses</option>
                                    <option value="Academic Expenses" <%= expense.getExpenses_type().equals("Academic Expenses") ? "selected" : "" %>>Academic Expenses</option>
                                    <option value="Facility & Maintenance" <%= expense.getExpenses_type().equals("Facility & Maintenance") ? "selected" : "" %>>Facility & Maintenance</option>
                                    <option value="Capital Expenditures" <%= expense.getExpenses_type().equals("Capital Expenditures") ? "selected" : "" %>>Capital Expenditures</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="updateAmount<%= expense.getEx_id() %>">Amount</label>
                                <input type="number" step="0.01" id="updateAmount<%= expense.getEx_id() %>" name="eamount" value="<%= expense.getEx_amount() %>" required />
                            </div>
                            
                            <div class="form-group">
                                <label for="updateDate<%= expense.getEx_id() %>">Date</label>
                                <input type="date" id="updateDate<%= expense.getEx_id() %>" name="edate" value="<%= expense.getDate() %>" required />
                            </div>
                            
                            <div class="form-group">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save"></i> Update
                                </button>
                                <button type="button" class="btn btn-danger" onclick="hideUpdateForm(<%= expense.getEx_id() %>)">
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
                        <i class="fas fa-info-circle"></i> No expense records found.
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
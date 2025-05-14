package com.school.Controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.model.Card;
import com.shcool.DBUtil.PaymentDBUtil;


@WebServlet("/paymentServlet")
public class paymentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String stdID = request.getParameter("stdNum");
		String amount = request.getParameter("amount");
		
		LocalDate currentDate = LocalDate.now();
		String date = currentDate.toString();
		float convertedAmount = 0;
		
		
		//Getting card information from the database and passing them to the payment portal
		List<Card> result = PaymentDBUtil.getCard();
		
		
		if(result == null || result.isEmpty())
		{
			System.out.println("Empty result found");
		}
		else
		{
			System.out.println("Saved card information displayed");
			request.setAttribute("card", result);
			
		}
		
		//When the payment pages is oaded, its going to come this servlet to retreive the card information.
		//But the form is not filled, therefore amount is NULL.
		//Thats why if the amount is empty, user is forwaded to the payment page
		
		if(amount == null || amount.isEmpty())
		{
			System.out.println("Amount is empty");
			request.getRequestDispatcher("paymentPage.jsp").forward(request, response);
			return;
					
		}
		else
		{
			try
			{
				convertedAmount = Float.parseFloat(amount);
			}
			catch(NumberFormatException e)
			{
				e.printStackTrace();
			}
		}
				
		
		
		//Storing form values in the DB
		boolean isSuccess;
		
		isSuccess = PaymentDBUtil.payAmount(stdID, convertedAmount, date);
		
		if(isSuccess == true)
		{
			System.out.println("Successfull data insertion");
			response.sendRedirect("paymentSuccess.jsp");
		}
		else
		{
			response.sendRedirect("invalidId.jsp");
		}
		


	}
	
	/*To retreive card details from the DB when loading the paymentPage */
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Your logic here, or just forward to doPost() if you want
	    doPost(request, response);
	}
	


}

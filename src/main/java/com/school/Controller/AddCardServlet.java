package com.school.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shcool.DBUtil.PaymentDBUtil;



/**
 * Servlet implementation class AddCardServlet
 */
@WebServlet("/AddCardServlet")
public class AddCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cardNum = request.getParameter("cardNum");
		String expDate = request.getParameter("expDate");
		String cvv = request.getParameter("cvv");
		String bank = request.getParameter("bank");
		
		int convertedCvv = Integer.parseInt(cvv);
		
		System.out.println(cardNum);
		
		boolean isSuccess = PaymentDBUtil.saveCard(cardNum, expDate, convertedCvv, bank);
		
		if (isSuccess == true)
		{
			System.out.println("Result is success!!");
			request.getRequestDispatcher("paymentPage.jsp").forward(request, response);
		}
		else
		{
			System.out.println("Result failed!!");
		}
	}

}

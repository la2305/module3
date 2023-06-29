package com.example.product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "product_discount_calculator ", value = "/calculator")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float price = Float.parseFloat(request.getParameter("price"));
        float discount = Float.parseFloat(request.getParameter("discount"));
        float discountAmount = (float) (price*discount*0.01);
        float priceAfterDiscount =(price-price*(discount/100));

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1> Discount Amount:  "+discountAmount+" VND"+"</h1>");
        writer.println("<h1> Discount Price:  "+priceAfterDiscount+" VND"+"</h1>");
        writer.println("</html>");
    }
}

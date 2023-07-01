package com.example.calculatorapplication;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.sql.rowset.serial.SerialException;

@WebServlet(name = "helloServlet", value = "/calculate")
public class HelloServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        float firstOperand = Integer.parseInt(request.getParameter("firstoperand"));
        float secondOperand = Integer.parseInt(request.getParameter("secondoperand"));
        char operator = request.getParameter("operator").charAt(0);
        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>result:</h1>");
        try {
            float result = Calculator.calculate(firstOperand, secondOperand, operator);
            writer.println(firstOperand + " " + operator + " " + secondOperand + " = " + result);
        } catch (Exception ex) {
            writer.println("error: " + ex.getMessage());
        }
        writer.println("</html>");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }


    public void destroy() {
    }
}
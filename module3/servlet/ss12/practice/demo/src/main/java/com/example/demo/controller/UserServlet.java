package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserService userService;

    public void init() {
        userService = new UserService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try{
            switch (action) {
                case "create":
                    showNewForm(request,response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
                case "delete":
                    deleteUser(request,response);
                    break;
                case "sort":
                    sortByName(request, response);
                    break;
                default:
                    listUser(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    private void sortByName(HttpServletRequest request, HttpServletResponse response) {
        List<User> list = userService.sortByName();
        RequestDispatcher dispatcher;
        if (list.isEmpty()) {
            dispatcher = request.getRequestDispatcher("user/error.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("user/list.jsp");
            request.setAttribute("listUser", list);
            request.setAttribute("restore", "Restore to the origin list");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        //        ??
        request.setAttribute("user",user);
        dispatcher.forward(request,response);
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
        //        ??
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ??
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request,response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listUser = userService.selectAllUsers();
        request.setAttribute("listUser", listUser);
//        ???
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action ="";
        }
        try {
            switch (action){
                case "create":
                    insertUser(request,response);
                    break;
                case "edit":
                    updateUser(request,response);
                    break;
                case "search":
                    searchByCountry(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchByCountry(HttpServletRequest request, HttpServletResponse response) {
        String searchStr = request.getParameter("searchStr");
        List<User> list = userService.searchByCountry(searchStr);
        RequestDispatcher dispatcher;
        if (list.isEmpty()) {
            dispatcher = request.getRequestDispatcher("user/error.jsp");
        } else {
            dispatcher = request.getRequestDispatcher("user/search.jsp");
            request.setAttribute("searchStr", searchStr);
            request.setAttribute("list", list);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        userService.updateUser(user);
//        ???????????
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name,email,country);
        userService.insertUser(user);
        ////???????????
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request,response);
    }
}

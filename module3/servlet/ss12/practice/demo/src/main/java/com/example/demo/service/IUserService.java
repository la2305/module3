package com.example.demo.service;

import com.example.demo.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();
    void insertUser (User user);
    User selectUser(int id);
    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> sortByName();
    List<User> searchByCountry(String searchStr);

}

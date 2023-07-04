package com.example.mainusermanager.service;

import com.example.mainusermanager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();
    void insertUser(User user) throws SQLException;
    User selectUser(int id) throws SQLException;

    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;
    List<User> searchUser(String country) throws SQLException;
    List<User> oderByUser() throws SQLException;


}

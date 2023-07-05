package com.example.mainusermanager.respository;

import com.example.mainusermanager.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRespository {
    List<User> selectAllUsers();
    void insertUser(User user) throws SQLException;
    User selectUser(int id);

    boolean deleteUser(int id) throws SQLException;
    boolean updateUser(User user) throws SQLException;

    List<User> oderByUser() throws SQLException;


}

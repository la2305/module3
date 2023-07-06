package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.respository.UserRespository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    private UserRespository userRespository = new UserRespository();
    @Override
    public List<User> selectAllUsers() {
        return userRespository.selectAllUsers();
    }

    @Override
    public void insertUser(User user) {
        userRespository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRespository.selectUser(id);
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userRespository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return userRespository.updateUser(user);
    }

    @Override
    public List<User> sortByName() {
        return userRespository.sortByName();
    }

    @Override
    public List<User> searchByCountry(String searchStr) {
        return userRespository.searchByCountry(searchStr);
    }
}

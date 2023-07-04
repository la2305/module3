package com.example.mainusermanager.service;

import com.example.mainusermanager.model.User;
import com.example.mainusermanager.respository.IUserRespository;
import com.example.mainusermanager.respository.UserRespository;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService{
    private IUserRespository iUserRespository = new UserRespository();
    @Override
    public List<User> selectAllUsers() {
        return iUserRespository.selectAllUsers();
    }

    @Override
    public void insertUser(User user) throws SQLException {
        iUserRespository.insertUser(user);
    }

    @Override
    public User selectUser(int id) throws SQLException {
        return iUserRespository.selectUser(id);
    }


    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserRespository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return  iUserRespository.updateUser(user);
    }

    @Override
    public List<User> searchUser(String country) throws SQLException {
        List<User> listUser = iUserRespository.selectAllUsers();
        for (User u : listUser) {
            if (!country.toLowerCase().contains(u.getCountry().toLowerCase()))
                listUser.remove(u);
        }
        return listUser;
    }

    @Override
    public List<User> oderByUser() throws SQLException {
        return iUserRespository.oderByUser();
    }

}

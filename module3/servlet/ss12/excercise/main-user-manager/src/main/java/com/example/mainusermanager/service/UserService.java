package com.example.mainusermanager.service;

import com.example.mainusermanager.model.User;
import com.example.mainusermanager.respository.IUserRespository;
import com.example.mainusermanager.respository.UserRespository;

import java.util.List;

public class UserService implements IUserService{
    private IUserRespository iUserRespository = new UserRespository();
    @Override
    public List<User> selectAllUsers() {
        return iUserRespository.selectAllUsers();
    }

}

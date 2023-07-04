package com.example.mainusermanager.service;

import com.example.mainusermanager.model.User;

import java.util.List;

public interface IUserService {
    List<User> selectAllUsers();
}

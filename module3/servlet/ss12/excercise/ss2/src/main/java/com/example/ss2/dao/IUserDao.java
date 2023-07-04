package com.example.ss2.dao;

import com.example.ss2.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDao {
    List<User> selectAllUsers();
}

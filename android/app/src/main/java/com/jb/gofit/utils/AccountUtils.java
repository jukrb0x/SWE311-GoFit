package com.jb.gofit.utils;

import com.jb.gofit.dao.UserDao;
import com.jb.gofit.database.AppDatabase;
import com.jb.gofit.entity.User;

import java.util.List;
import java.util.Objects;

public class AccountUtils {
    private final AppDatabase db;

    public AccountUtils(AppDatabase db) {
        this.db = db;
    }

    public Boolean login(String username, String password) {
        UserDao userDao = db.userDao();
        List<User> userList = userDao.checkUser(username, password);
        for (User user : userList) {
            return Objects.equals(user.password, password);
        }
        return false;
    }

    public Boolean register(String username, String password) {
        UserDao userDao = db.userDao();
        List<User> userList = userDao.checkUser(username, password);
        for (User user : userList) {
            return Objects.equals(user.password, password);
        }
        return false;
    }
}

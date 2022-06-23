package com.jb.gofit.dao;


import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.Query;

import com.jb.gofit.entity.User;

import java.util.List;

@Dao
public interface UserDao {
    @Query("SELECT * FROM user")
    List<User> getAll();

    @Query("SELECT * FROM user WHERE uid IN (:userIds)")
    List<User> loadAllByIds(int[] userIds);

    @Insert
    void insertAll(User... users);

    @Delete
    void delete(User user);

    @Query("SELECT * FROM user WHERE username LIKE :username AND password LIKE :password")
    List<User> checkUser(String username, String password);

    @Query("SELECT * FROM user WHERE username LIKE :username")
    List<User> checkUser(String username);

    // get user by username
    @Query("SELECT * FROM user WHERE username LIKE :username")
    User getUser(String username);

}

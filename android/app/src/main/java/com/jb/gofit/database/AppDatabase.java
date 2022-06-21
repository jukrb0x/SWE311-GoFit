package com.jb.gofit.database;


import androidx.room.Database;
import androidx.room.RoomDatabase;

import com.jb.gofit.dao.UserDao;
import com.jb.gofit.entity.User;

@Database(entities = {User.class}, version = 1)
public abstract class AppDatabase extends RoomDatabase {
    public abstract UserDao userDao();
}

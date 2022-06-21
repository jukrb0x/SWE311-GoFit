package com.jb.gofit.database;


import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;

import com.jb.gofit.dao.UserDao;
import com.jb.gofit.entity.User;

@Database(entities = {User.class}, version = 1)
public abstract class AppDatabase extends RoomDatabase {
    private static volatile AppDatabase instance; // database singleton
    private static final Object LOCK = new Object();
    public abstract UserDao userDao();

    // get persistent database instance singleton
    public static AppDatabase getInstance(Context ctx) {
        // seems like not persistent
        if (instance == null) {
            synchronized (LOCK) {
                if (instance == null) {
                    instance = Room.databaseBuilder(
                            ctx.getApplicationContext(),
                            AppDatabase.class,
                            "user-database"
                    ).allowMainThreadQueries(). // this is bad, do not use in production
                            build();
                }

            }
        }
        return instance;
    }

    public static void destroyInstance() {
        instance = null;
    }
}

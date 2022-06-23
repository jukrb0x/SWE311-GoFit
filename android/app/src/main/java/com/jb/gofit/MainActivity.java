package com.jb.gofit;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.jb.gofit.dao.UserDao;
import com.jb.gofit.database.AppDatabase;
import com.jb.gofit.entity.User;
import com.jb.gofit.utils.AccountUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

// we need channel to connect flutter and native java
public class MainActivity extends FlutterActivity {
    private static final String CHANNEL_TEST = "com.jb.gofit/test";
    private static final String CHANNEL_USER = "com.jb.gofit/user";
    AppDatabase db;
    AccountUtils Account;
    List<User> userList;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        db = AppDatabase.getInstance(this.getApplication());
        {
            UserDao userDao = db.userDao();
            User testUser = new User(
                    "test",
                    "John Sena",
                    "123@gmail.com",
                    "123",
                    65.0,
                    170.0,
                    20,
                    1
            );
            testUser.setWeightGoal(50);
            userDao.insertAll(testUser);
        }
        // init the account utils
        this.Account = new AccountUtils(db);
    }

    // start

    // end

    // test code start
    private void addTestUser() {
        UserDao userDao = db.userDao();
        User testUser = new User(
                "johnsena",
                "John Sena",
                "123@gmail.com",
                "123456",
                65.0,
                170.0,
                20,
                1
        );
        testUser.setWeightGoal(50);
        userDao.insertAll(testUser);
    }
    // test code end

    @SuppressLint("WrongThread") // this is bad bad
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_TEST)
                .setMethodCallHandler(
                        (call, result) -> {
                            // This method is invoked on the main thread.
                            if (call.method.equals("getUserList")) {
                                UserDao userDao = db.userDao();

                                List<String> userList = new ArrayList<>();
                                for (User user : userDao.getAll()) {
                                    userList.add(user.getName());
                                }
//                                userList = userDao.getAll().forEach(i -> userList.add(i));
                                Log.i("APP", String.valueOf(userList));
                                Log.i("APP", "Created.");
                                result.success(userList);
                            }

                            if (call.method.equals("addUserTest")) {
                                Log.i("APP", "add user test.");
                                addTestUser();
                            }

                            if (call.method.equals("clearDatabase")) {
                                db.clearAllTables();
                            }

                        }
                );
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_USER)
                .setMethodCallHandler(
                        ((call, result) -> {
                            // login request
                            if (call.method.equals("login")) {
                                Boolean res = Account.login(call.argument("username"), call.argument("password"));
                                result.success(res);
                            }
                        })
                );
    }


}

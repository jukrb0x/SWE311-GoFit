package com.jb.gofit;

import androidx.annotation.NonNull;
import androidx.room.Room;

import com.jb.gofit.dao.UserDao;
import com.jb.gofit.database.AppDatabase;
import com.jb.gofit.entity.User;

import java.util.List;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

// we need channel to connect flutter and native java
public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.jb.gofit/test";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            // This method is invoked on the main thread.
                            // TODO
                        }
                );
    }

    // db test
    AppDatabase db = Room.databaseBuilder(getApplicationContext(), AppDatabase.class, "user-database").build();

    UserDao userDao = db.userDao();
    List<User> userList = userDao.getAll();


}

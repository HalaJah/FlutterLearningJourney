package com.example.period_tracker_app;
import com.google.firebase.FirebaseApp;
import androidx.multidex.MultiDex;
import android.content.Context;

public class MyApplication extends android.app.Application {
    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
}

    


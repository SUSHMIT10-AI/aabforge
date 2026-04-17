package com.aabforge.app;
import android.app.Application;
import com.google.android.gms.ads.MobileAds;
public class MyApplication extends Application {
  @Override public void onCreate() {
    super.onCreate();
    try { MobileAds.initialize(this, status -> {}); } catch (Throwable ignored) {}
  }
}

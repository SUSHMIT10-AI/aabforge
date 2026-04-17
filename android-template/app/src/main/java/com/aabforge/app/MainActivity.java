package com.aabforge.app;

import android.annotation.SuppressLint;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
  private WebView web;

  @SuppressLint("SetJavaScriptEnabled")
  @Override protected void onCreate(Bundle s) {
    super.onCreate(s);
    setTheme(R.style.AppTheme);
    setContentView(R.layout.activity_main);

    getWindow().setStatusBarColor(getResources().getColor(R.color.theme_color, getTheme()));
    getWindow().setNavigationBarColor(getResources().getColor(R.color.nav_color, getTheme()));

    web = findViewById(R.id.webview);
    WebSettings s2 = web.getSettings();
    s2.setJavaScriptEnabled(true);
    s2.setDomStorageEnabled(true);
    s2.setDatabaseEnabled(true);
    s2.setMediaPlaybackRequiresUserGesture(false);
    s2.setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);
    s2.setUserAgentString(s2.getUserAgentString() + " AABforgeApp/1.0");
    web.setWebViewClient(new WebViewClient());
    web.setWebChromeClient(new WebChromeClient());
    web.setBackgroundColor(Color.TRANSPARENT);
    web.loadUrl(getString(R.string.app_url));
  }

  @Override public void onBackPressed() {
    if (web.canGoBack()) web.goBack(); else super.onBackPressed();
  }
}

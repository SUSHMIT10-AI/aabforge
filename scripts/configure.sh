#!/usr/bin/env bash
set -e
A=$CM_BUILD_DIR/android
APP=$A/app/src/main

# Rewrite package name in AndroidManifest
sed -i "s|PACKAGE_NAME_PLACEHOLDER|${PACKAGE_NAME}|g" $APP/AndroidManifest.xml

# Rewrite app/build.gradle
sed -i "s|APPLICATION_ID_PLACEHOLDER|${PACKAGE_NAME}|g" $A/app/build.gradle
sed -i "s|VERSION_NAME_PLACEHOLDER|${VERSION_NAME:-1.0.0}|g" $A/app/build.gradle
sed -i "s|VERSION_CODE_PLACEHOLDER|${VERSION_CODE:-1}|g" $A/app/build.gradle

# Toggle billing dependency
if [ "$ENABLE_BILLING" = "true" ]; then
  sed -i "s|// BILLING_DEP|implementation 'com.android.billingclient:billing:6.2.0'|g" $A/app/build.gradle
fi

# Strings: app name + URL
cat > $APP/res/values/strings.xml <<EOF
<resources>
  <string name="app_name">${APP_NAME}</string>
  <string name="app_url">${APP_URL}</string>
  <string name="admob_app_id">${ADMOB_APP_ID:-ca-app-pub-3940256099942544~3347511713}</string>
  <string name="admob_banner_id">${ADMOB_BANNER_ID:-ca-app-pub-3940256099942544/6300978111}</string>
  <string name="admob_interstitial_id">${ADMOB_INTERSTITIAL_ID:-ca-app-pub-3940256099942544/1033173712}</string>
  <string name="admob_rewarded_id">${ADMOB_REWARDED_ID:-ca-app-pub-3940256099942544/5224354917}</string>
</resources>
EOF

# Colors
cat > $APP/res/values/colors.xml <<EOF
<resources>
  <color name="theme_color">${THEME_COLOR:-#4f46e5}</color>
  <color name="splash_color">${SPLASH_COLOR:-#FFFFFF}</color>
  <color name="nav_color">${NAV_COLOR:-#000000}</color>
</resources>
EOF

# Orientation in manifest
sed -i "s|ORIENTATION_PLACEHOLDER|${ORIENTATION:-portrait}|g" $APP/AndroidManifest.xml

# Inject AdMob app id meta-data only if provided
if [ -n "$ADMOB_APP_ID" ]; then
  sed -i 's|<!-- ADMOB_META -->|<meta-data android:name="com.google.android.gms.ads.APPLICATION_ID" android:value="@string/admob_app_id"/>|g' $APP/AndroidManifest.xml
fi

echo "Configuration complete."

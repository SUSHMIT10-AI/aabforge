# AABforge Native Android Builder
Builds a **native Android WebView app** (not TWA) and outputs a signed `.aab` ready for Google Play.

## Setup
1. Push to GitHub.
2. Generate Gradle wrapper locally once: `gradle wrapper --gradle-version 8.7` inside `scripts/android-template/`. Commit `gradlew`, `gradlew.bat`, `gradle/wrapper/gradle-wrapper.{jar,properties}`.
3. In Codemagic → Add application → connect this repo.
4. Create env-var group `keystore_credentials`:
   - `CM_KEYSTORE` (base64 of `release.keystore`)
   - `CM_KEYSTORE_PASSWORD`
   - `CM_KEY_ALIAS`
   - `CM_KEY_PASSWORD`
5. Generate API token: Codemagic → Teams → Personal → Integrations → API token.
6. Note the **App ID** (URL `codemagic.io/app/<APP_ID>`) and **Workflow ID** = `build-native-aab`.

## Generate keystore

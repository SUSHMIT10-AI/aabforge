# AABforge — Codemagic Build Repo

This repo is consumed by the AABforge Supabase edge function to build signed `.aab` and `.apk` files on Codemagic.

## Structure (DO NOT CHANGE)
```
/codemagic.yaml          <- workflow config (must be at repo root)
/android-template/       <- Gradle template with __PLACEHOLDERS__
   ├── build.gradle
   ├── settings.gradle
   ├── gradle.properties
   ├── gradle/
   └── app/
```

## How to use
1. Create a new empty GitHub repo.
2. Unzip this bundle into it.
3. `git add . && git commit -m "init" && git push`
4. Connect the repo in Codemagic → it will auto-detect `codemagic.yaml`.
5. Add these env vars to Codemagic group `aabforge`:
   - `SUPABASE_URL`
   - `SUPABASE_SERVICE_ROLE_KEY`
   - `BUILD_ID` (passed per-build by the edge function)

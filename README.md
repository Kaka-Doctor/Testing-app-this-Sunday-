# App ya majaribio — Android + PWA

Complete, buildable source for **App ya majaribio**, generated with AppCraft Studio.

- **Application ID:** `com.apex.portal`
- **Version:** `1.0.0` (versionCode 1)
- **Target SDK:** 36 · **Compile SDK:** 36 · **Min SDK:** 24
- **Language:** Kotlin · **Gradle 8.11.1 · AGP 8.9.1**
- **Signing:** debug key by default; your release keystore when supplied

---

## Option 1 — Build a real APK in the cloud (easiest, no Android SDK)

This repository already contains `.github/workflows/build-apk.yml`.

1. Create an empty repository on GitHub and push this folder:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/<YOUR-GITHUB-USERNAME>/app-yetu.git
   git push -u origin main
   ```
2. Open the **Actions** tab → **Build Android APK & AAB** → wait ~3–5 minutes.
3. Download the APK:
   - From **Releases** (stable link):
     `https://github.com/<YOUR-GITHUB-USERNAME>/app-yetu/releases/latest/download/app-yetu-v1.0.0.apk`
   - Or from the workflow run's **Artifacts** section.

The APK is signed and ready to install. Enable "Install unknown apps" for your
browser/file manager on the phone, then open the downloaded file.

### Optional: sign the release build with your own keystore

Create a real keystore (never commit it):

```bash
keytool -genkeypair -v -keystore release.keystore -alias appcraft \
  -keyalg RSA -keysize 2048 -validity 9125
```

Add these repository secrets (Settings → Secrets and variables → Actions):

| Secret | Value |
| --- | --- |
| `KEYSTORE_BASE64` | base64 of `release.keystore` |
| `KEYSTORE_PASSWORD` | store password |
| `KEY_ALIAS` | `appcraft` |
| `KEY_PASSWORD` | key password |

---

## Option 2 — Android Studio

1. Unzip this project and open the folder in Android Studio (Ladybug or newer).
2. Let Gradle sync (Android Studio downloads Gradle 8.11.1 automatically).
3. Press **Run ▶** to install on a connected phone or emulator.
4. To create a signed build: **Build → Generate Signed Bundle / APK**.
   Choose **APK** for direct installation or **AAB** for Google Play.

### Command line

The official Gradle 8.11.1 wrapper is included (`gradlew`, `gradlew.bat`,
`gradle/wrapper/gradle-wrapper.jar`), so no global Gradle install is needed:

```bash
# macOS / Linux
chmod +x gradlew
./gradlew :app:assembleDebug        # app/build/outputs/apk/debug/app-debug.apk
./gradlew :app:bundleRelease        # app/build/outputs/bundle/release/app-release.aab
```

```bat
REM Windows
gradlew.bat :app:assembleDebug
gradlew.bat :app:bundleRelease
```

---

## Option 3 — Host the PWA (no APK required)

`index.html`, `manifest.webmanifest` and `sw.js` are ready for GitHub Pages:

1. Push the repository (commands above).
2. **Settings → Pages → Deploy from a branch → main / root**.
3. Open `https://<YOUR-GITHUB-USERNAME>.github.io/app-yetu/` on Android Chrome and
   choose **Add to Home screen / Install app**.

---

## Project structure

```
app/src/main/AndroidManifest.xml    # permissions, AdMob ID, launcher activity
app/src/main/java/.../MainActivity.kt
app/src/main/res/layout/activity_main.xml
app/src/main/res/mipmap-*/          # real PNG launcher icons generated from your logo
app/src/main/res/values/            # strings, colors, themes
app/src/main/assets/index.html      # the complete offline app UI
.github/workflows/build-apk.yml     # cloud APK/AAB builder
gradlew, gradlew.bat                # included Gradle wrapper (no install needed)
gradle/wrapper/                     # wrapper jar + properties
index.html                          # PWA version (GitHub Pages)
manifest.webmanifest
sw.js
```

## AdMob
- App ID: `ca-app-pub-3940256099942544~3347511713`
- Banner unit: `ca-app-pub-3940256099942544/6300978111`
- Interstitial unit: `ca-app-pub-3940256099942544/1033173712`
- Test mode: enabled (safe test ads)

Replace these with your own units before publishing, and only use production IDs
after the app is verified.

## Notes

- Change the app icon or splash image in AppCraft Studio and re-export rather than
  editing the mipmap PNGs by hand.
- `local.properties` (your SDK path) is machine-specific and should not be committed.
- Keep `release.keystore` and its passwords private — losing them means you cannot
  publish updates to the same Play listing.

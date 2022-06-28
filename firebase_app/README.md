# App Signing for release
### Generate release key
keytool -genkey \
-v -keystore ./release-key.jks \
-keyalg RSA \
-keysize 2048 \
-validity 10000 \
-alias release-key

key password: P@$$w0rd


### List the key hashes 

keytool \
-list \
-v -keystore ./release-key.jks \
-alias release-key \
-storepass password \
-keypass password


### Before 2020/21

1. Flutter run (debug mode):50mb


2. Fat apk  20mb
```
flutter build apk
```

3. Splitted apks
 - x86_64 8mb
 - arm64-v81 8mb
 - arembi-v71 8mb
```
flutter build apk --split-per-abi
```

3. App bundle
```
flutter build appbundle
```
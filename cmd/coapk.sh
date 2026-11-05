#!/bin/bash
cd ..
aapt2 link -I "sdk/platforms/android-29/android.jar" --manifest src/AndroidManifest.xml --min-sdk-version 29 --target-sdk-version 29 --java build/generated -o build/unsigned.apk build/compiled.zip
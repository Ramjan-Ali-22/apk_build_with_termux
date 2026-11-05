#!/bin/bash
cd ..
apksigner sign --ks cmd/my-release-key.jks --ks-key-alias my-key --ks-pass pass:kspass --key-pass pass:kspass --out apk/signed.apk build/aligned.apk
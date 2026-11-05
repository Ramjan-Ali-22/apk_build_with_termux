#!/bin/bash
cd ..
javac -source 21 -target 21 -classpath "sdk/platforms/android-29/android.jar" -d build/classes build/generated/com/example/hello/R.java src/MainActivity.java
#plz change your pkg name
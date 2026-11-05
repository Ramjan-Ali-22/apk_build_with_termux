APK Build with Termux

Build Android APK files directly from Termux — without Android Studio.

This project provides a shell-script-based Android APK build system. It combines Android SDK build tools and Java compilation tools to build an APK from Java source code and XML resources.

The build process is automated: run one command, and the project handles compilation, DEX generation, APK packaging, alignment, and signing.

Features

- Build Android APK files directly from Termux.
- No Android Studio or desktop computer required.
- Automated build process using a single command.
- Compile Java source files using "javac".
- Compile Android resources using "AAPT2".
- Convert Java class files into DEX using "D8".
- Automatically package DEX files into the APK.
- Align APK files using "zipalign".
- Sign APK files using "apksigner".
- Customize Java source code and XML resources.

Project Structure

apk_build_with_termux/
│
├── build.sh
│
├── cmd/
│   ├── apkalign.sh
│   ├── coapk.sh
│   ├── coclass.sh
│   ├── corsc.sh
│   ├── d8.sh
│   ├── dexadd.sh
│   ├── signapk.sh
│   └── my-release-key.jks
│
├── sdk/
│   └── platforms/
│       └── android-29/
│           └── android.jar
│
└── src/
    ├── AndroidManifest.xml
    ├── MainActivity.java
    └── res/
        ├── layout/
        │   └── activity_main.xml
        └── values/
            └── strings.xml

Requirements

The following tools must be installed and accessible through your shell's "PATH":

- Bash
- Java Development Kit (JDK)
- "javac"
- Android Asset Packaging Tool 2 ("aapt2")
- Android DEX compiler ("d8")
- "zip"
- "zipalign"
- "apksigner"

The project includes the Android API 29 platform library:

sdk/platforms/android-29/android.jar

The current build scripts use Java source and target version 21.

«Note: This project is configured for Android API 29. The generated application declares Android 10 (API 29) as its minimum SDK.»

Installation

Clone the repository:

git clone https://github.com/Ramjan-Ali-22/apk_build_with_termux.git

Enter the project directory:

cd apk_build_with_termux

Make the build script executable:

chmod +x build.sh

Build APK

Run:

./build.sh

The script automatically executes the build stages.

<details>
<summary>Build stages</summary>1. Resource compilation — "corsc.sh" compiles resources from "src/res/" using AAPT2.
2. APK packaging — "coapk.sh" links the compiled resources and manifest into an unsigned APK and generates the Java resource class.
3. Java compilation — "coclass.sh" compiles Java source files and the generated "R.java" file.
4. DEX generation — "d8.sh" converts compiled Java class files into "classes.dex".
5. DEX packaging — "dexadd.sh" adds the DEX file to the unsigned APK.
6. APK alignment — "apkalign.sh" aligns the APK using "zipalign".
7. APK signing — "signapk.sh" signs the aligned APK using "apksigner".

</details>When the build completes successfully, the script prints:

apk build successfuls 😎😎😎

Output

The signed APK is generated at:

apk/signed.apk

You can install this APK on a compatible Android device.

Customization

The main source directory is:

src/

You can modify the following files:

File| Purpose
"src/MainActivity.java"| Application Java code
"src/AndroidManifest.xml"| Application manifest and package
"src/res/layout/activity_main.xml"| User interface layout
"src/res/values/strings.xml"| Application strings

After making changes, run the build script again.

Changing the package name

The current package name is:

com.example.hello

It is referenced in multiple places. If you change it, update all relevant locations:

1. "package" in "src/AndroidManifest.xml".
2. The Java package declaration in "src/MainActivity.java".
3. The generated "R.java" path referenced in "cmd/coclass.sh".
4. The class-file path referenced in "cmd/d8.sh".

For a different package, update the corresponding directory paths in the build scripts as well.

Rebuilding

The current "build.sh" creates "apk/" and "build/" using "mkdir". Consequently, running it again while those directories already exist will fail.

For a clean rebuild, run:

rm -rf apk build && ./build.sh

This removes the previous generated output and builds the APK again.

Security Notes

The current project archive includes a signing keystore under "cmd/", and the signing script contains hardcoded password arguments.

For public or production use:

- Generate your own signing keystore.
- Do not publish your private signing key or its password.
- Keep the keystore outside the public repository.
- Update the signing script to use your own keystore and credentials.
- Never use a shared public keystore for an application you intend to maintain or distribute.

Losing your signing key can make it difficult to publish updates under the same app identity.

Limitations

- The build scripts currently assume the package name "com.example.hello" in their class paths.
- The D8 script currently selects class files directly inside the package directory; projects with additional nested package directories or separate compiled classes may require changes.
- The project is configured for API 29 and Java source/target 21. Runtime compatibility still depends on the APIs and language features used by the application.
- This is a lightweight command-line build system, not a complete replacement for every Android Gradle Plugin feature.

Contributing

Contributions, improvements, bug reports, and suggestions are welcome.

If you find an issue or have an idea to improve the build system, feel free to open an issue or submit a pull request.

Author

Ramjan Ali

GitHub: "Ramjan-Ali-22" (https://github.com/Ramjan-Ali-22)

Repository: "apk_build_with_termux" (https://github.com/Ramjan-Ali-22/apk_build_with_termux)

---

Built with Termux, Java, and Android SDK tools. 😎
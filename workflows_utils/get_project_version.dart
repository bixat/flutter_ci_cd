import 'dart:io';

import 'add_to_output.dart';

main() async {
  final data = File('./pubspec.yaml');
  String text = data.readAsStringSync();
  String currentVersion = text.substring(text.indexOf("version: ") + 9,
      text.indexOf("\n", text.indexOf("version: ")));
  String versionName = currentVersion;
  String versionCode = '1';
  if (currentVersion.contains('+')) {
    versionName = currentVersion.split('+').first;
    versionCode = currentVersion.split('+').last;
  }
  String versionEnvVar =
      "version_name=${versionName.trim()}\nversion_code=${versionCode.trim()}";
  await setOutput(versionEnvVar);
}

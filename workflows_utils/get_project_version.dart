import 'dart:io';

import 'add_to_output.dart';

main() async {
  final data = File('./pubspec.yaml');
  String text = data.readAsStringSync();
  String currentVersion = text.substring(text.indexOf("version: ") + 9,
      text.indexOf("\n", text.indexOf("version: ")));
  String versionEnvVar = "project_version=v${currentVersion.trim()}";
  await setOutput(versionEnvVar);
}

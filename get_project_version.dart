import 'dart:io';

import 'package:yaml/yaml.dart';

main() async {
  final data = File('./pubspec.yaml');
  final mapData = loadYaml(data.readAsStringSync());
  final String currentVersion = mapData["version"];
  print("::set-output name=project_version::v$currentVersion");
}

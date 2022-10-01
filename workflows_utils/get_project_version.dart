import 'dart:io';

main() async {
  final data = File('./pubspec.yaml');
  String text = data.readAsStringSync();
  String currentVersion = text.substring(text.indexOf("version: ") + 9,
      text.indexOf("\n", text.indexOf("version: ")));
  print("::set-output name=project_version::v${currentVersion.trim()}");
}

import 'dart:io';

main() async {
  final data = File('./pubspec.yaml');
  String text = data.readAsStringSync();
  String currentVersion = text.substring(text.indexOf("version: ") + 9,
      text.indexOf("\n", text.indexOf("version: ")));
  await Process.run(
      'echo "project_version=v${currentVersion.trim()}" >> \$GITHUB_ENV', [],
      runInShell: true);
}

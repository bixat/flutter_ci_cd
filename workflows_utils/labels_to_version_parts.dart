import 'dart:io';

const List<String> options = ["major", "minor", "patch"];
Future<void> main(List<String> labels) async {
  List<String> versionParts = List.from(labels);
  versionParts.removeWhere((e) => !options.contains(e));
  String parts = "";
  if (versionParts.isNotEmpty) {
    parts = versionParts.join(",");
    parts = "bump:$parts";
  }
  await Process.run('echo "parts=$parts" >> \$GITHUB_OUTPUT', [],
      runInShell: true);
}

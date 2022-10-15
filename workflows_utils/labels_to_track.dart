import 'dart:io';

const List<String> options = ["alpha", "beta", "internal"];
Future<void> main(List<String> labels) async {
  List<String> trackLabels = List.from(labels);
  trackLabels.removeWhere((e) => !options.contains(e));
  String track = "alpha";
  if (trackLabels.isNotEmpty) {
    track = trackLabels.first;
  }
  await Process.run('echo "track=$track" >> \$GITHUB_ENV', [],
      runInShell: true);
}

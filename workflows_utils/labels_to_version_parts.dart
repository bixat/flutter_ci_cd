import 'add_to_output.dart';

const List<String> options = ["major", "minor", "patch"];
Future<void> main(List<String> labels) async {
  List<String> versionParts = List.from(labels);
  versionParts.removeWhere((e) => !options.contains(e));
  String parts = "";
  if (versionParts.isNotEmpty) {
    parts = versionParts.join(",");
    parts = "parts=bump:$parts";
  }
  await setOutput(parts);
}

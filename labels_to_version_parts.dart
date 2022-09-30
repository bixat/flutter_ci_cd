const List<String> options = ["major", "minor", "patch"];
void main(List<String> labels) {
  List<String> versionParts = List.from(labels);
  versionParts.removeWhere((e) => !options.contains(e));
  String parts = "";
  if (versionParts.isNotEmpty) {
    parts = versionParts.join(",");
    parts = "bump:$parts";
  }
  print("::set-output name=parts::$parts");
}

const List<String> options = ["major", "minor", "patch"];
void main(List<String> labels) {
  List<String> versionParts = List.from(labels);
  versionParts.removeWhere((e) => !options.contains(e));
  print("::set-output name=parts::bump:${versionParts.join(",")}");
}

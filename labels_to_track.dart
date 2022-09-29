const List<String> options = ["alpha", "beta", "internal"];
void main(List<String> labels) {
  List<String> trackLabels = List.from(labels);
  trackLabels.removeWhere((e) => !options.contains(e));
  String track = "alpha";
  if (trackLabels.isNotEmpty) {
    track = trackLabels.first;
  }
  print("::set-output name=track::$track");
}

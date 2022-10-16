import 'add_to_output.dart';

const List<String> options = ["alpha", "beta", "internal"];
Future<void> main(List<String> labels) async {
  List<String> trackLabels = List.from(labels);
  trackLabels.removeWhere((e) => !options.contains(e));
  String track = "track=alpha";
  if (trackLabels.isNotEmpty) {
    track = "track=${trackLabels.first}";
  }
  await setOutput(track);
}

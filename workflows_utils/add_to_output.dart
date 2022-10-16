import 'dart:io';

Future<void> setOutput(String item) async {
  Map<String, String> envVars = Platform.environment;
  String? envPath = envVars["GITHUB_ENV"];
  File ghEnv = File(envPath!);
  String currentContent = await ghEnv.readAsString();
  if (currentContent.isNotEmpty) {
    currentContent += "\n" "$item";
  } else {
    currentContent = item;
  }
  ghEnv.writeAsString(currentContent);
}

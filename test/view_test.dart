import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/models/photo_model.dart';
import 'package:flutter_ci_cd/models/post_model.dart';
import 'package:flutter_ci_cd/models/user_model.dart';
import 'package:flutter_ci_cd/views/photo_view.dart';
import 'package:flutter_ci_cd/views/post_view.dart';
import 'package:flutter_ci_cd/views/user_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvc_rocket/mvc_rocket.dart';
import 'dummy_data.dart';
import 'fake_rocket_request.dart';

void main() {
  testWidgets('Test Post view (setup,refresh,update)', (tester) async {
    // Create request object
    RocketRequestTest request = RocketRequestTest(postData);
    Rocket.add(rocketRequestKey, request);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: PostExample(
      title: 'test',
    )));
    // Check loading
    expect(find.bySubtype<CircularProgressIndicator>(), findsOneWidget);
    // After 1 second data loaded
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(postData.first[postTitleField]), findsOneWidget);
    // Click to refresh for reload data
    await tester.tap(find.byIcon(Icons.data_usage));
    await tester.pump();
    // Check loading
    expect(find.bySubtype<CircularProgressIndicator>(), findsOneWidget);
    // After 1 second data loaded
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(postData.first[postTitleField]), findsOneWidget);
    // Change first post title
    await tester.tap(find.byIcon(Icons.update));
    await tester.pump();
    // Title changed
    expect(find.text("This Title changed"), findsOneWidget);
  });

  testWidgets('Test user view (setup,refresh,update)', (tester) async {
    // Create request object
    RocketRequestTest request = RocketRequestTest(userData);
    Rocket.add(rocketRequestKey, request);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: UserExample(
      title: 'test',
    )));
    // Check loading
    expect(find.bySubtype<CircularProgressIndicator>(), findsOneWidget);
    // After 2 second data loaded
    await tester.pump(const Duration(seconds: 1));
    expect(find.text("User :${userData.first[userNameField]}"), findsOneWidget);
    // Click to refresh for reload data
    await tester.tap(find.byIcon(Icons.get_app));
    await tester.pump();
    // Check loading
    expect(find.bySubtype<CircularProgressIndicator>(), findsOneWidget);
    // After 1 second data loaded
    await tester.pump(const Duration(seconds: 1));
    expect(find.text("User :${userData.first[userNameField]}"), findsOneWidget);
    // Change first username
    await tester.tap(find.byIcon(Icons.update));
    await tester.pump();
    // Name changed
    expect(find.text("User :Mohammed CHAHBOUN 💙"), findsOneWidget);
    // After 2 seconds data updated from API
    await tester.pump(const Duration(seconds: 2));
    expect(find.text("User :${userData.first[userNameField]}"), findsOneWidget);
  });

  testWidgets('Test Photo view setup', (tester) async {
    // Create request object
    RocketRequestTest request = RocketRequestTest(photoData);
    Rocket.add(rocketRequestKey, request);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
        home: PhotoExample(
      title: 'test',
    )));
    // Check loading
    expect(find.bySubtype<CircularProgressIndicator>(), findsOneWidget);
    // After 1 second data loaded
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(photoData.first[photoTitleField]), findsOneWidget);
  });
}

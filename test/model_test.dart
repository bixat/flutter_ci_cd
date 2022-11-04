import 'package:flutter_ci_cd/models/photo_model.dart';
import 'package:flutter_ci_cd/models/post_model.dart';
import 'package:flutter_ci_cd/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'dummy_data.dart';

void main() {
  group('Test Post model (multi, fromJson, toJson, updateFields, state)', () {
    final post = Post();
    const String newTitle = "New title";
    test("Test Post model (multi, fromJson, toJson)", () {
      // Test setMulti, fromJson & toJson
      post.setMulti(postData);
      expect(post.multi!.first.toJson(), postData.first);
    });
    test("Test Post model UpdateFields", () {
      // Test updateFields
      post.multi!.first.updateFields(titleField: newTitle);
      expect(post.multi!.first.toJson()[postTitleField], newTitle);
    });
  });
  group('Test Photo model (multi, fromJson, toJson, updateFields)', () {
    final photo = Photo();
    const String newTitle = "New title";
    test("Test Photo model (multi, fromJson, toJson)", () {
      // Test setMulti, fromJson & toJson
      photo.setMulti(photoData);
      expect(photo.multi!.first.toJson(), photoData.first);
    });
    test("Test Photo model updateFields", () {
      // Test updateFields
      photo.multi!.first.updateFields(titleField: newTitle);
      expect(photo.multi!.first.toJson()[photoTitleField], newTitle);
    });
  });

  group('Test User model (multi, fromJson, toJson, updateFields)', () {
    final user = User();
    const String newTitle = "New username";
    test('Test User model (multi, fromJson, toJson)', () {
      // Test setMulti, fromJson & toJson
      user.setMulti(userData);
      expect(user.multi!.first.toJson(), userData.first);
    });
    test('Test User model updateFields', () {
      // Test updateFields
      user.multi!.first.updateFields(usernameField: newTitle);
      expect(user.multi!.first.toJson()[userUsernameField], newTitle);
    });
  });
}

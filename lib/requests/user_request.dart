import 'package:flutter_ci_cd/models/user_model.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

const String usersEndpoint = "users";

class GetUsers {
  static Future getUsers(User userModel) =>
      Rocket.get<RocketClient>().request(usersEndpoint, model: userModel);
}

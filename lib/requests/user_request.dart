import 'package:flutter_ci_cd/models/user_model.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

const String usersEndpoint = "users";

class GetUsers {
  static Future getUsers(User userModel) => Rocket.get(rocketRequestKey)
      .getObjData(usersEndpoint, userModel, multi: true);
}

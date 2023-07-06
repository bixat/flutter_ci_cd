import 'package:flutter_ci_cd/models/todos.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

const String todosEndpoint = "todos";

class GetTodos {
  static Future gettodos(Todos todosModel) =>
      Rocket.get<RocketClient>().request(todosEndpoint, model: todosModel);
}

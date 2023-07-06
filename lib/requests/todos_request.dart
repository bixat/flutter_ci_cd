import 'package:flutter_ci_cd/models/todo.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

const String todosEndpoint = "todos";

class GetTodos {
  static Future getTodos(Todos todosModel) =>
      Rocket.get<RocketClient>().request(todosEndpoint, model: todosModel);
}

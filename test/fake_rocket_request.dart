import 'package:mvc_rocket/mvc_rocket.dart';

class RocketRequestTest {
  List<Map<String, dynamic>> data;
  RocketRequestTest(this.data);
  Future getObjData<T>(
    String endpoint,
    RocketModel<T> model, {
    Map<String, dynamic>? params,
    bool multi = false,
    dynamic Function(dynamic)? inspect,
  }) async {
    model.state = RocketState.loading;
    await Future.delayed(const Duration(seconds: 1));
    try {
      model.setMulti(data);
      model.state = RocketState.done;
    } catch (e) {
      model.setException(RocketException(exception: e.toString()));
    }

    return model;
  }
}

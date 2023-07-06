import 'package:flutter_ci_cd/models/photo_model.dart';
import 'package:flutter_rocket/flutter_rocket.dart';

const String photosEndpoint = "photos";

class GetPhotos {
  static Future getPhotos(Photo photoModel) =>
      Rocket.get<RocketClient>().request(photosEndpoint, model: photoModel);
}

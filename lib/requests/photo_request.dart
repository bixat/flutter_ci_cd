import 'package:flutter_ci_cd/models/photo_model.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

const String photosEndpoint = "photos";

class GetPhotos {
  static Future getPhotos(Photo photoModel) => Rocket.get(rocketRequestKey)
      .getObjData(photosEndpoint, photoModel, multi: true);
}

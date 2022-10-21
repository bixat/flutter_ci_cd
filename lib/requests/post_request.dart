import 'package:flutter_ci_cd/models/post_model.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

const String postsEndpoint = "posts";

class GetPosts {
  static Future getPosts(Post postModel) =>
      Rocket.get(rocketRequestKey).getObjData(
        // endpoint
        postsEndpoint,
        // your model
        postModel,
        inspect: (d) {
          return d;
        },
        // if you received data as List multi will be true & if data as map you not should to define multi its false as default
        multi: true,
        // parameters for send it with request
        // params:{"key":"value"},
        // inspect method for determine exact json use for generate your model in first step
        // if your api send data directly without any supplement values you not should define it
        // inspect:(data)=>data["response"]
      );
}

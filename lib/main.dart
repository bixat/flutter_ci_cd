import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/views/counter_view.dart';
import 'package:flutter_ci_cd/views/mini_view.dart';
import 'package:flutter_ci_cd/views/photo_view.dart';
import 'package:flutter_ci_cd/views/post_view.dart';
import 'package:flutter_ci_cd/views/user_view.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/miniView': (BuildContext context) => MiniView(
                title: "MiniView Example",
              ),
          '/counter': (BuildContext context) => CounterExample(
                title: "Counter",
              ),
          '/post': (BuildContext context) => PostExample(
                title: "100 Posts",
              ),
          '/photo': (BuildContext context) => PhotoExample(
                title: "5000 Photos",
              ),
          '/user': (BuildContext context) => UserExample(
                title: "10 Users",
              ),
        },
        title: '🚀 MVCRocket 🚀 Package',
        theme: ThemeData(
          primaryColor: Colors.brown,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.brown),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyApp());
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final ValueNotifier<double> dx = ValueNotifier<double>(0.1);
  late BuildContext cntx;
  final List<String> exps = [
    "MVCRocket Package",
    "Link your app with API easily",
    "One Package All Features",
    "Make your work easy",
    "this animation make by crazy code with timer"
  ];
  int index = 0;
  MyApp({Key? key}) : super(key: key) {
    const String baseUrl = 'https://jsonplaceholder.typicode.com';
    // create request object
    RocketRequest request = RocketRequest(url: baseUrl);
    // save it, for use it from any screen
    Rocket.add(rocketRequestKey, request);
    Timer.periodic(const Duration(milliseconds: 5), (timer) {
      if (dx.value <=
          MediaQuery.of(cntx).size.width +
              (MediaQuery.of(cntx).size.width * 0.04)) {
        dx.value += 0.5;
      } else {
        dx.value = -MediaQuery.of(cntx).size.width;
        if (index < exps.length - 1) {
          index++;
        } else {
          index = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    cntx = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("🚀 MVCRocket 🚀 PACKAGE"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: context.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ValueListenableBuilder(
                  valueListenable: dx,
                  builder: (context, _, __) {
                    return Transform.translate(
                      offset: Offset(dx.value, 1),
                      //dx: dx.value,
                      child: Text(
                        exps[index],
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    );
                  }),
              const Example("Mini View", "miniView"),
              const Example("Counter View", "counter"),
              const Example("100 Posts", "post"),
              const Example("5000 Photos", "photo"),
              const Example("10 Users", "user"),
            ],
          ),
        ),
      ),
    );
  }
}

class Example extends StatelessWidget {
  final String title, to;
  const Example(this.title, this.to, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.6,
      height: context.height * 0.1,
      child: TextButton(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.brown),
          ),
          onPressed: () => Navigator.pushNamed(context, "/$to")),
    );
  }
}

extension SizeDevice on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

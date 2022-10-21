import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/models/counter_model.dart';
import 'package:mvc_rocket/mvc_rocket.dart';

class CounterExample extends StatelessWidget {
  final String title;
  CounterExample({Key? key, required this.title}) : super(key: key);
  final Counter counter = Counter();
  @override
  Widget build(BuildContext context) {
    // Rocket.add(sizeDesign, Size(100, 200));
    // Rocket.add(sizeScreen, Size(context.width, context.height));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        //width: 10.w,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Number of once call parameter called & you can also click on add icon',
              textAlign: TextAlign.center,
            ),
            RocketView(
              model: counter,
              // call & secondsOfStream & callType optional parameters you can use RocketView Widget without them
              call: add,
              callType: CallType.callAsStream,
              secondsOfStream: 1,
              builder: (context) {
                return Text(
                  counter.count.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        //change your field by json structure
        onPressed: () {
          counter.fromJson({Counter.countKey: counter.count - 1});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.minimize),
      ),
    );
  }

  Future<void> add() async {
    await Future.delayed(const Duration(seconds: 1));
    counter.fromJson({Counter.countKey: counter.count + 1});
  }
}

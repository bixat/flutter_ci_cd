import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CI-CD',
      theme: ThemeData(primarySwatch: Colors.brown, primaryColor: Colors.blue),
      home: MyHomePage(title: 'Flutter CI-CD Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ValueNotifier _counter = ValueNotifier(0);
  final String title;
  MyHomePage({super.key, required this.title});

  _onTapButton(String action) {
    if (action == "+") {
      _counter.value++;
    } else {
      _counter.value--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Placeholder(),
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, _, __) {
                  return Text(
                    '${_counter.value}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              _onTapButton("+");
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _onTapButton("-");
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

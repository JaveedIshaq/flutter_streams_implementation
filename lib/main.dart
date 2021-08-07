import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Streams Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  CounterScreen({Key? key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final StreamController<int> _controller = StreamController();

  int counter = 0;

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Streams Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            StreamBuilder<int>(
                stream: _controller.stream,
                initialData: 0,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  return Text(
                    'Counter Value: ${snapshot.data}',
                    style: Theme.of(context).textTheme.headline3,
                  );
                }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _controller.sink.add(counter++);
              },
              child: Text('Increment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _controller.sink.add(counter--);
              },
              child: Text('Decrement'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

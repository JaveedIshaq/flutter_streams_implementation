import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_implementation/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (BuildContext context) => CounterBloc(0),
          child: CounterScreen()),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Bloc Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            BlocBuilder<CounterBloc, int>(
                builder: (BuildContext context, int state) {
              return Text(
                'Counter Vale: $state',
                style: TextStyle(fontSize: 22),
              );
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _counterBloc.add(CounterEvents.increment);
              },
              child: Text('Increment'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _counterBloc.add(CounterEvents.decrement);
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

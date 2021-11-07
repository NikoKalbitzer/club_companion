import 'package:club_companion/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cubit/page_cubit.dart';

abstract class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);
}

class HomePage extends AppPage {
  const HomePage({Key? key, required this.currentState}) : super(key: key);

  final HomePageState currentState;
  final String title = "Home Page!";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      widget.currentState.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _counter = widget.currentState.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends AppPage {
  const SecondPage({Key? key, required this.currentState}) : super(key: key);

  final SecondPageState currentState;
  final String title = "Second Page!";

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      widget.currentState.counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    _counter = widget.currentState.counter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

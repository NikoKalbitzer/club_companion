import 'package:club_companion/model/music_entry.dart';
import 'package:club_companion/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';

import 'cubit/page_cubit.dart';

import 'package:flutter_acrcloud/flutter_acrcloud.dart';

const apiKey = "b8d121bbff175e0712de30db851f0fd2";
const apiSecret = "8kIvp1EkmEnVITGu7IpGZNc8g9y0h6YZiHkJg0wC";
const host = "identify-eu-west-1.acrcloud.com";

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

  int _consecutiveShakes = 0;
  String _shaken = "false";
  int _lastShake = DateTime.now().millisecondsSinceEpoch;
  int _newShake = 0;
  int _shakeTimeDiff = 0;

  void _handleShake() {
    _newShake = DateTime.now().millisecondsSinceEpoch;
    _shakeTimeDiff = _newShake - _lastShake;
    if (_shakeTimeDiff <= 1700) {
      _consecutiveShakes++;
    } else {
      _consecutiveShakes = 0;
    }
    if (_consecutiveShakes >= 4) {
      //todo alles in if raus und dafür den music shit
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('recognizing music...'),
      ));
      //TODO recognize
      //recognizeMusic();
    }
    _lastShake = DateTime.now().millisecondsSinceEpoch;
  }
  /*
  Future<MusicEntry>? recognizeMusic() async {
    final session = ACRCloud.startSession();
    final result = await session.result;
    var music = null;
    if (result == null) {
      // Cancelled.
      return Fu;
    } else if (result.metadata == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('No result.'),
      ));
      return;
    }

    music = result.metadata!.music.first;
  }
  */

  @override
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      _handleShake();
    });
    ACRCloud.setUp(ACRCloudConfig(apiKey, apiSecret, host));
    detector.startListening();
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

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
            Text(_shaken),
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

class SavedMusicPage extends AppPage {
  const SavedMusicPage({Key? key, required this.currentState})
      : super(key: key);

  final SavedMusicPageState currentState;
  final String title = "Saved Music";
  @override
  State<SavedMusicPage> createState() => _SavedMusicPageState();
}

class _SavedMusicPageState extends State<SavedMusicPage> {
  List<MusicEntry> savedMusic = [];

  @override
  Widget build(BuildContext context) {
    savedMusic = widget.currentState.savedMusic;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const NavBar(),
        body: ListView.builder(
          itemCount: savedMusic.length,
          itemBuilder: (context, index) {
            final item = savedMusic[index];
            return ListTile(
              title: item.buildTitle(context),
              subtitle: item.buildSubtitle(context),
            );
          },
        ));
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

//TODO: refactor to different class
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

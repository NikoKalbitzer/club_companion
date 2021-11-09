import 'package:flutter/material.dart';

class MusicEntry {
  final String interpreter;
  final String songTitle;
  MusicEntry(this.interpreter, this.songTitle);

  @override
  Widget buildTitle(BuildContext context) => Text(songTitle);

  @override
  Widget buildSubtitle(BuildContext context) => Text(interpreter);
}

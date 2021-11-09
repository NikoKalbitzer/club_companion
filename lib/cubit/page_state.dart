part of 'page_cubit.dart';

abstract class PageState {}

class HomePageState extends PageState {
  int counter = 0;
}

class SecondPageState extends PageState {
  int counter = 0;
}

class SavedMusicPageState extends PageState {
  List<MusicEntry> savedMusic = [MusicEntry("Metallica", "Enter Sandman")];
}

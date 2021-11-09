import 'package:bloc/bloc.dart';
import 'package:club_companion/model/music_entry.dart';
import 'package:club_companion/pages.dart';

part 'page_state.dart';

class PageCubit extends Cubit<AppPage> {
  PageCubit(HomePageState homePageState)
      : _homePageState = homePageState,
        super(HomePage(currentState: homePageState));

  HomePageState _homePageState;
  SecondPageState _secondPageState = SecondPageState();
  SavedMusicPageState _savedMusicPageState = SavedMusicPageState();

  //Saving method is not needed -> Calling reference is enough
  void saveCurrentState(
      PageState stateOfCurrentPage, PageType typeOfCurrentPage) {
    switch (typeOfCurrentPage) {
      case PageType.homePage:
        _homePageState = stateOfCurrentPage as HomePageState;
        break;
      case PageType.secondPage:
        _secondPageState = stateOfCurrentPage as SecondPageState;
        break;
      default:
    }
  }

  void returnPage(PageType typeOfPageStateNeeded) {
    switch (typeOfPageStateNeeded) {
      case PageType.homePage:
        emit(HomePage(currentState: _homePageState));
        break;
      case PageType.secondPage:
        emit(SecondPage(currentState: _secondPageState));
        break;
      case PageType.savedMusicPage:
        emit(SavedMusicPage(currentState: _savedMusicPageState));
        break;
      default:
    }
  }
}

enum PageType { homePage, secondPage, savedMusicPage }

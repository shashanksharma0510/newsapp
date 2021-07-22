class AppState {
  static final AppState _appState = AppState._internal();
bool switchValue=false;


  factory AppState() {
    return _appState;
  }

  AppState._internal();
}

final appState = AppState();

import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/models/app/app_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';

extension StoreProviderDispatch on BuildContext {
  dynamic dispatch(ReduxAction action) {
    return StoreProvider.of<AppState>(this).dispatch(action);
  }
}

extension StoreProviderGetState on BuildContext {
  AppState get appState {
    return StoreProvider.of<AppState>(this).state;
  }
}

import 'dart:async';

import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/models/app/app_state.dart';
import 'package:crowdleague/services/auth_service.dart';
import 'package:crowdleague/services/database_service.dart';
import 'package:crowdleague/services/device_service.dart';
import 'package:crowdleague/services/navigation_service.dart';
import 'package:crowdleague/services/notifications_service.dart';
import 'package:crowdleague/services/storage_service.dart';
import 'package:crowdleague/utils/redux/services_bundle.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:redux/src/store.dart';

import '../mocks/services/auth_service_mocks.dart';
import '../mocks/services/database_service_mocks.dart';
import '../mocks/services/storage_service_mocks.dart';

class FakeServicesBundle extends ServicesBundle {
  final Completer<Store<AppState>> _reduxCompleter;

  FakeServicesBundle(
      {@required Completer<Store<AppState>> completer,
      GlobalKey<NavigatorState> navKey})
      : _reduxCompleter = completer,
        super(
            navKey: navKey ?? GlobalKey<NavigatorState>(),
            authService: FakeAuthService(),
            databaseService: FakeDatabaseService(),
            storageService:
                FakeStorageService(StreamController<ReduxAction>()));

  @override
  // TODO: implement auth
  AuthService get auth => throw UnimplementedError();

  @override
  Future<Store<AppState>> createStore() => _reduxCompleter.future;

  @override
  // TODO: implement database
  DatabaseService get database => throw UnimplementedError();

  @override
  // TODO: implement device
  DeviceService get device => throw UnimplementedError();

  @override
  GlobalKey<NavigatorState> get navKey => super.navKey;

  @override
  // TODO: implement navigation
  NavigationService get navigation => throw UnimplementedError();

  @override
  // TODO: implement notifications
  NotificationsService get notifications => throw UnimplementedError();

  @override
  // TODO: implement storage
  StorageService get storage => throw UnimplementedError();
}
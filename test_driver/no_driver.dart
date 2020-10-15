import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crowdleague/models/app/app_state.dart';
import 'package:crowdleague/utils/redux/services_bundle.dart';
import 'package:crowdleague/utils/redux/store_operation.dart';
import 'package:crowdleague/widgets/crowd_league_app.dart';
import 'package:flutter/material.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';

Future<void> main() async {
  // enableFlutterDriverExtension() was removed to allow us to manually
  // interact with the app

  // Create the rdt middleware that connects to the rdt server.
  final _rdtMiddleware = RemoteDevToolsMiddleware<AppState>('localhost:8000');

  // Create an operation for the services bundle to run on the store.
  final _rdtOperation = StoreOperation((store) async {
    _rdtMiddleware.store = store; // give middleware access to the store
    await _rdtMiddleware.connect();
  });

  // Settings to make the firestore package use the local emulator
  final _firestoreSettings = Settings(
      host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);

  // Setup the services bundle to use a different bucket and with an extra
  // middleware that sends each action and state to the rdt server for display.
  ServicesBundle.setup(
      bucketName: 'gs://profile-pics-prototyping',
      extraMiddlewares: [_rdtMiddleware],
      storeOperations: [_rdtOperation],
      firestoreSettings: _firestoreSettings);

  runApp(CrowdLeagueApp());
}
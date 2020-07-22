import 'dart:async';

import 'package:crowdleague/actions/profile/update_profile_page.dart';
import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/actions/storage/update_upload_task.dart';
import 'package:crowdleague/enums/storage/upload_task_update_type.dart';
import 'package:crowdleague/services/storage_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'storage_upload_task_mocks.dart';

class FakeStorageService extends Fake implements StorageService {
  final Map<String, StorageUploadTask> _tasks = <String, StorageUploadTask>{};

  @override
  Stream<ReduxAction> uploadProfilePic(String userId, String filePath) async* {
    final uuid = Uuid().v1();

    // emit a setup event to create the entry in the store that will be used
    // by each subsequent update event
    yield UpdateUploadTask((b) => b
      ..type = UploadTaskUpdateType.setup
      ..uuid = uuid
      ..filePath = filePath);

    // the profile page vm now has the uuid that it can use to access the upload
    // task
    yield UpdateProfilePage((b) => b..uploadingProfilePicId = uuid);

    // create a fake upload task with a stream we can add events to
    final controller = StreamController<StorageTaskEvent>();
    final uploadTask = FakeStorageUploadTask(controller);
    _tasks[uuid] = uploadTask;

    // we can't create StorageTaskEvent objects as the class has a private constructor
    // so we don't bother with the uploadTask and just yield UpdateUploadTask actions directly
    // await for (final action in uploadTask.events
    //     .map<UpdateUploadTask>((event) => event.toUpdateUploadTask())) {
    //   yield action;
    // }

    // TODO: run a profile pic upload and record the actions and replicate here

    // an example that ended in an error
    yield UpdateUploadTask((b) => b
      ..type = UploadTaskUpdateType.progress
      ..uuid = uuid
      ..totalByteCount = 159
      ..bytesTransferred = 3782214);

    yield UpdateUploadTask((b) => b
      ..type = UploadTaskUpdateType.progress
      ..uuid = uuid
      ..totalByteCount = 159
      ..bytesTransferred = 3782214);

    yield UpdateUploadTask((b) => b
      ..type = UploadTaskUpdateType.failure
      ..uuid = uuid
      ..failure.code = -13021
      ..failure.description = 'description'
      ..totalByteCount = 159
      ..bytesTransferred = 3782214);
  }
}
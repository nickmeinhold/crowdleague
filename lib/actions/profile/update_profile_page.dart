library update_profile_page;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/models/profile/profile_pic.dart';
import 'package:crowdleague/utils/serializers.dart';

part 'update_profile_page.g.dart';

abstract class UpdateProfilePage extends Object
    with ReduxAction
    implements Built<UpdateProfilePage, UpdateProfilePageBuilder> {
  @nullable
  String get userId;
  @nullable
  String get leaguerPhotoURL;
  @nullable
  bool get selectingProfilePic;
  @nullable
  bool get pickingProfilePic;
  @nullable
  String get uploadingProfilePicId;
  @nullable
  ProfilePic get removeDeletingState;

  UpdateProfilePage._();

  factory UpdateProfilePage(
      {String userId,
      String leaguerPhotoURL,
      bool selectingProfilePic,
      bool pickingProfilePic,
      String uploadingProfilePicId,
      ProfilePic removeDeletingState}) = _$UpdateProfilePage._;

  factory UpdateProfilePage.by(
      [void Function(UpdateProfilePageBuilder) updates]) = _$UpdateProfilePage;

  Object toJson() =>
      serializers.serializeWith(UpdateProfilePage.serializer, this);

  static UpdateProfilePage fromJson(String jsonString) => serializers
      .deserializeWith(UpdateProfilePage.serializer, json.decode(jsonString));

  static Serializer<UpdateProfilePage> get serializer =>
      _$updateProfilePageSerializer;

  @override
  String toString() => '''UPDATE_PROFILE_PAGE: 
    ${userId == null ? '' : 'userId | '}
    ${leaguerPhotoURL == null ? '' : 'profilePicURL | '}
    ${selectingProfilePic == null ? '' : 'selectingProfilePic | '}
    ${pickingProfilePic == null ? '' : 'pickingProfilePic | '}
    ${uploadingProfilePicId == null ? '' : 'uploadingProfilePicId | '}
    ''';
}

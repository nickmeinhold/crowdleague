library delete_profile_pic;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/models/profile/profile_pic.dart';
import 'package:crowdleague/utils/serializers.dart';
import 'package:meta/meta.dart';

part 'delete_profile_pic.g.dart';

abstract class DeleteProfilePic extends Object
    with ReduxAction
    implements Built<DeleteProfilePic, DeleteProfilePicBuilder> {
  ProfilePic get pic;

  DeleteProfilePic._();

  factory DeleteProfilePic({@required ProfilePic pic}) = _$DeleteProfilePic._;

  factory DeleteProfilePic.by(
      [void Function(DeleteProfilePicBuilder) updates]) = _$DeleteProfilePic;

  Object toJson() =>
      serializers.serializeWith(DeleteProfilePic.serializer, this);

  static DeleteProfilePic fromJson(String jsonString) => serializers
      .deserializeWith(DeleteProfilePic.serializer, json.decode(jsonString));

  static Serializer<DeleteProfilePic> get serializer =>
      _$deleteProfilePicSerializer;

  @override
  String toString() => 'DELETE_PROFILE_PIC';
}

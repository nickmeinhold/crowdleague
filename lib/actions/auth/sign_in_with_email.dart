library sign_in_with_email;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/utils/serializers.dart';

part 'sign_in_with_email.g.dart';

abstract class SignInWithEmail extends Object
    with ReduxAction
    implements Built<SignInWithEmail, SignInWithEmailBuilder> {
  SignInWithEmail._();

  factory SignInWithEmail() = _$SignInWithEmail._;

  Object toJson() =>
      serializers.serializeWith(SignInWithEmail.serializer, this);

  static SignInWithEmail fromJson(String jsonString) => serializers
      .deserializeWith(SignInWithEmail.serializer, json.decode(jsonString));

  static Serializer<SignInWithEmail> get serializer =>
      _$signInWithEmailSerializer;

  @override
  String toString() => 'SIGN_IN_WITH_EMAIL';
}

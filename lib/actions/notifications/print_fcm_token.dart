library print_fcm_token;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/utils/serializers.dart';

part 'print_fcm_token.g.dart';

abstract class PrintFCMToken extends Object
    with ReduxAction
    implements Built<PrintFCMToken, PrintFCMTokenBuilder> {
  PrintFCMToken._();

  factory PrintFCMToken() = _$PrintFCMToken;

  Object toJson() => serializers.serializeWith(PrintFCMToken.serializer, this);

  static PrintFCMToken fromJson(String jsonString) => serializers
      .deserializeWith(PrintFCMToken.serializer, json.decode(jsonString));

  static Serializer<PrintFCMToken> get serializer => _$printFCMTokenSerializer;

  @override
  String toString() => 'PRINT_FCM_TOKEN';
}

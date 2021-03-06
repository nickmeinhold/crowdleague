library plumb_database_stream;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/actions/redux_action.dart';
import 'package:crowdleague/utils/serializers.dart';

part 'plumb_database_stream.g.dart';

abstract class PlumbDatabaseStream extends Object
    with ReduxAction
    implements Built<PlumbDatabaseStream, PlumbDatabaseStreamBuilder> {
  PlumbDatabaseStream._();

  factory PlumbDatabaseStream() = _$PlumbDatabaseStream;

  Object toJson() =>
      serializers.serializeWith(PlumbDatabaseStream.serializer, this);

  static PlumbDatabaseStream fromJson(String jsonString) => serializers
      .deserializeWith(PlumbDatabaseStream.serializer, json.decode(jsonString));

  static Serializer<PlumbDatabaseStream> get serializer =>
      _$plumbDatabaseStreamSerializer;

  @override
  String toString() => 'PLUMB_DATABASE_STREAM';
}

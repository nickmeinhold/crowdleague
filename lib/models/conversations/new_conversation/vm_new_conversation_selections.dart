library vm_new_conversation_selections;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/models/app/serializers.dart';
import 'package:crowdleague/models/leaguers/leaguer.dart';

part 'vm_new_conversation_selections.g.dart';

abstract class VmNewConversationSelections
    implements
        Built<VmNewConversationSelections, VmNewConversationSelectionsBuilder> {
  BuiltList<Leaguer> get selections;

  VmNewConversationSelections._();

  factory VmNewConversationSelections(
          [void Function(VmNewConversationSelectionsBuilder) updates]) =
      _$VmNewConversationSelections;

  Object toJson() =>
      serializers.serializeWith(VmNewConversationSelections.serializer, this);

  static VmNewConversationSelections fromJson(String jsonString) =>
      serializers.deserializeWith(
          VmNewConversationSelections.serializer, json.decode(jsonString));

  static Serializer<VmNewConversationSelections> get serializer =>
      _$vmNewConversationSelectionsSerializer;
}

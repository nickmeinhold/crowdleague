library add_problem;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:crowdleague/models/actions/redux_action.dart';
import 'package:crowdleague/models/enums/problem_type.dart';
import 'package:crowdleague/models/problem.dart';
import 'package:crowdleague/models/serializers.dart';

part 'add_problem.g.dart';

abstract class AddProblem extends Object
    with ReduxAction
    implements Built<AddProblem, AddProblemBuilder> {
  Problem get problem;

  AddProblem._();

  factory AddProblem([void Function(AddProblemBuilder) updates]) = _$AddProblem;
  factory AddProblem.createFrom(
      String message, String traceString, ProblemType type) {
    return AddProblem(
      (b) => b
        ..problem.replace(Problem((b) => b
          ..message = message
          ..trace = traceString
          ..type = type)),
    );
  }

  Object toJson() => serializers.serializeWith(AddProblem.serializer, this);

  static AddProblem fromJson(String jsonString) => serializers.deserializeWith(
      AddProblem.serializer, json.decode(jsonString));

  static Serializer<AddProblem> get serializer => _$addProblemSerializer;

  @override
  String toString() => 'ADD_PROBLEM';
}

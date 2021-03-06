import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'failure/value_failure/value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  T getDataOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((l) => throw Exception("Unexpected Error"), id);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

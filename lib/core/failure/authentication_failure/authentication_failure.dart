import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_failure.freezed.dart';

@freezed
abstract class AuthenticationFailure with _$AuthenticationFailure {
  const factory AuthenticationFailure.wrongPasswordOrEmail() =
      WrongPasswordOrEmail;
}

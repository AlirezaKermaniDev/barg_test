// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationFailureTearOff {
  const _$AuthenticationFailureTearOff();

  WrongPasswordOrEmail wrongPasswordOrEmail() {
    return const WrongPasswordOrEmail();
  }
}

/// @nodoc
const $AuthenticationFailure = _$AuthenticationFailureTearOff();

/// @nodoc
mixin _$AuthenticationFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wrongPasswordOrEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wrongPasswordOrEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wrongPasswordOrEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongPasswordOrEmail value) wrongPasswordOrEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WrongPasswordOrEmail value)? wrongPasswordOrEmail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongPasswordOrEmail value)? wrongPasswordOrEmail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationFailureCopyWith<$Res> {
  factory $AuthenticationFailureCopyWith(AuthenticationFailure value,
          $Res Function(AuthenticationFailure) then) =
      _$AuthenticationFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationFailureCopyWithImpl<$Res>
    implements $AuthenticationFailureCopyWith<$Res> {
  _$AuthenticationFailureCopyWithImpl(this._value, this._then);

  final AuthenticationFailure _value;
  // ignore: unused_field
  final $Res Function(AuthenticationFailure) _then;
}

/// @nodoc
abstract class $WrongPasswordOrEmailCopyWith<$Res> {
  factory $WrongPasswordOrEmailCopyWith(WrongPasswordOrEmail value,
          $Res Function(WrongPasswordOrEmail) then) =
      _$WrongPasswordOrEmailCopyWithImpl<$Res>;
}

/// @nodoc
class _$WrongPasswordOrEmailCopyWithImpl<$Res>
    extends _$AuthenticationFailureCopyWithImpl<$Res>
    implements $WrongPasswordOrEmailCopyWith<$Res> {
  _$WrongPasswordOrEmailCopyWithImpl(
      WrongPasswordOrEmail _value, $Res Function(WrongPasswordOrEmail) _then)
      : super(_value, (v) => _then(v as WrongPasswordOrEmail));

  @override
  WrongPasswordOrEmail get _value => super._value as WrongPasswordOrEmail;
}

/// @nodoc

class _$WrongPasswordOrEmail implements WrongPasswordOrEmail {
  const _$WrongPasswordOrEmail();

  @override
  String toString() {
    return 'AuthenticationFailure.wrongPasswordOrEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WrongPasswordOrEmail);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wrongPasswordOrEmail,
  }) {
    return wrongPasswordOrEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wrongPasswordOrEmail,
  }) {
    return wrongPasswordOrEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wrongPasswordOrEmail,
    required TResult orElse(),
  }) {
    if (wrongPasswordOrEmail != null) {
      return wrongPasswordOrEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WrongPasswordOrEmail value) wrongPasswordOrEmail,
  }) {
    return wrongPasswordOrEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WrongPasswordOrEmail value)? wrongPasswordOrEmail,
  }) {
    return wrongPasswordOrEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WrongPasswordOrEmail value)? wrongPasswordOrEmail,
    required TResult orElse(),
  }) {
    if (wrongPasswordOrEmail != null) {
      return wrongPasswordOrEmail(this);
    }
    return orElse();
  }
}

abstract class WrongPasswordOrEmail implements AuthenticationFailure {
  const factory WrongPasswordOrEmail() = _$WrongPasswordOrEmail;
}

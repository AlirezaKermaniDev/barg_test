import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'friend_model.freezed.dart';
part 'friend_model.g.dart';

@freezed
abstract class Friend with _$Friend {
  const factory Friend({
    int? id,
    String? guid,
    String? name,
  }) = _Friend;

  factory Friend.fromJson(Map<String, dynamic> json) => _$FriendFromJson(json);
}

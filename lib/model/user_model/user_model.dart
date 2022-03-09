import 'package:barg_test/model/friend_model/friend_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    String? guid,
    bool? isOwner,
    String? balance,
    String? picture,
    int? age,
    String? eyeColor,
    String? name,
    String? gender,
    String? company,
    String? email,
    String? phone,
    String? address,
    String? about,
    String? registered,
    double? latitude,
    double? longitude,
    List<String>? tags,
    List<Friend>? friends,
    String? greeting,
    String? favoriteFruit,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

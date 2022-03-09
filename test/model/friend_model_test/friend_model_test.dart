import 'package:barg_test/core/assets.dart';
import 'package:barg_test/model/friend_model/friend_model.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> mockJson = {
    "id": 0,
    "guid": "97241d36-53a1-4795-8869-d998a6582892",
    "name": "Wood Pitts"
  };
  group('The friend model test', () {
    test("friend model should create from json", () {
      Friend userModel = Friend.fromJson(mockJson);
      expect(userModel.name, "Wood Pitts");
      expect(userModel.id, 0);
      expect(userModel.guid, "97241d36-53a1-4795-8869-d998a6582892");
    });
    test("friend model should pass currect value to json test", () {
      Friend userModel = Friend.fromJson(mockJson);
      expect(userModel.toJson()["name"], "Wood Pitts");
      expect(
          userModel.toJson()["guid"], "97241d36-53a1-4795-8869-d998a6582892");
      expect(userModel.toJson()["id"], 0);
    });
  });
}

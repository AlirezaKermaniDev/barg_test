import 'package:barg_test/core/assets.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> mockJson = {
    "guid": "1791c941-9939-4970-be9a-09739587d69b",
    "isOwner": true,
    "balance": "\$1,835.03",
    "picture": "http://placehold.it/32x32",
    "age": 33,
    "eyeColor": "green",
    "name": "Koch Hartman",
    "gender": "male",
    "company": "BISBA",
    "email": "kochhartman@bisba.com",
    "phone": "+1 (923) 566-2621",
    "address": "755 Vermont Court, Rote, Indiana, 1362",
    "about":
        "Voluptate magna est elit esse aliqua minim aliqua veniam elit reprehenderit. Veniam anim ex ea proident. Proident in dolor et proident elit elit anim. Culpa sit ea consectetur proident tempor mollit. Fugiat cillum ut officia enim in excepteur incididunt incididunt duis. Voluptate proident sit exercitation et qui. Laboris voluptate fugiat in excepteur mollit velit occaecat duis cupidatat adipisicing excepteur Lorem do Lorem.\r\n",
    "registered": "2016-06-14T12:33:12 -05:-30",
    "latitude": -54.190089,
    "longitude": -31.352961,
    "tags": ["non", "anim", "ullamco", "Lorem", "consectetur", "ad", "qui"],
    "friends": [
      {
        "id": 0,
        "guid": "97241d36-53a1-4795-8869-d998a6582892",
        "name": "Wood Pitts"
      },
      {
        "id": 1,
        "guid": "aa57a24e-eb7b-421c-9b14-581208434af3",
        "name": "Gretchen Moore"
      },
      {
        "id": 2,
        "guid": "a9998045-280b-497d-8a3f-91c3a2b41a0b",
        "name": "Guerra Banks"
      }
    ],
    "greeting": "Hello, Koch Hartman! You have 4 unread messages.",
    "favoriteFruit": "banana"
  };
  group('The user model test', () {
    test("user model should create from json", () {
      User userModel = User.fromJson(mockJson);
      expect(userModel.name, "Koch Hartman");
      expect(userModel.friends!.length, 3);
    });
    test("user model should pass currect value to json test", () {
      User userModel = User.fromJson(mockJson);
      expect(userModel.toJson()["name"], "Koch Hartman");
      expect(userModel.toJson()["friends"].length, 3);
    });
  });
}

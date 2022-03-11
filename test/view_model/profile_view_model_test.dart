import 'package:barg_test/core/failure/user_failure/user_failure.dart';
import 'package:barg_test/dependency_injection.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/view_model/profile_view_model/profile_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  init();
  group('Profile view model test', () {
    ProfileViewModel profileViewModel = Get.put(ProfileViewModel());

    test(
        "The 'isLoading' value should change when 'changeIsLoadingStatus' function execute",
        () async {
      profileViewModel.changeIsLoadingStatus(true);

      expect(profileViewModel.isLoading, true);

      profileViewModel.changeIsLoadingStatus(false);

      expect(profileViewModel.isLoading, false);
    });
    test(
        "The 'getUserByIdRequest' function should return failure when pass an invalid user Id",
        () async {
      final result = await profileViewModel
          .getUserByIdRequest("3878e85b-d7b6-4e08-9f7b-0d8ebe18f8fb");
      expect(result, const Left(UserFailure.invalidUserId()));
    });
    test(
        "The 'getUserByIdRequest' function should return user object when pass a valid user Id",
        () async {
      final result = await profileViewModel
          .getUserByIdRequest("1791c941-9939-4970-be9a-09739587d69b");
      expect(result.isRight(), true);
    });
  });
}

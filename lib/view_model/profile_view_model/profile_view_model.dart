import 'package:barg_test/core/failure/user_failure/user_failure.dart';
import 'package:barg_test/core/messages.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/repository/user_repository/user_repository.dart';
import 'package:barg_test/view/profile_view/profile_view.dart';
import 'package:barg_test/view_model/utils/show_snack_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../dependency_injection.dart';

class ProfieViewModel extends GetxController {
  late User user;
  bool isLoading = false;

  onBack() {
    Get.back();
  }

  void changeIsLoadingStatus(bool status) {
    isLoading = status;
    update();
  }

  Future<void> getUserById(String userId) async {
    changeIsLoadingStatus(true);

    Either<UserFailure, User> result = await getUserByIdRequest(userId);
    checkGetUserByIdRequesrResult(result);
  }

  void checkGetUserByIdRequesrResult(Either<UserFailure, User> result) {
    changeIsLoadingStatus(false);

    result.fold((failure) {
      showSnackBar(Messages.userFailureToMessage[failure]!);
    }, (user) {
      Get.toNamed(ProfileView.path, arguments: user, preventDuplicates: false,);
    });
  }

  Future<Either<UserFailure, User>> getUserByIdRequest(String userId) async {
    final result = await di<UserRepository>().getUserById(id: userId);
    return result;
  }

  @override
  void onInit() {
    user = Get.arguments;
    super.onInit();
  }
}

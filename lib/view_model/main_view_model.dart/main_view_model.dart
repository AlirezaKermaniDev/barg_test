import 'package:barg_test/core/failure/user_failure/user_failure.dart';
import 'package:barg_test/core/messages.dart';
import 'package:barg_test/dependency_injection.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/repository/user_repository/user_repository.dart';
import 'package:barg_test/view_model/utils/show_snack_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  List<User> usersList = <User>[];
  User? ownerUser;

  Future<void> getUsersList() async {
    Either<UserFailure, List<User>> result = await getUsersListRequest();
    checkGetUsersListRequesrResult(result);
  }

  void checkGetUsersListRequesrResult(Either<UserFailure, List<User>> result) {
    result.fold((failure) {
      showSnackBar(Messages.userFailureToMessage[failure]!);
    }, (users) {
      usersList = users;
      update();
    });
  }

  Future<Either<UserFailure, List<User>>> getUsersListRequest() async {
    final result = await di<UserRepository>().getUsersList();
    return result;
  }

  Future<void> getOwnerUsers() async {
    Either<UserFailure, User> result = await getOwnerUsersRequest();
    checkGetOwnerUsersRequesrResult(result);
  }

  void checkGetOwnerUsersRequesrResult(Either<UserFailure, User> result) {
    result.fold((failure) {
      showSnackBar(Messages.userFailureToMessage[failure]!);
    }, (user) {
      ownerUser = user;

      update();
    });
  }

  Future<Either<UserFailure, User>> getOwnerUsersRequest() async {
    final result = await di<UserRepository>().getOwnerUser();
    return result;
  }

  @override
  void onReady() {
    getUsersList();
    getOwnerUsers();
    super.onReady();
  }
}

import 'package:barg_test/core/assets.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/core/failure/user_failure/user_failure.dart';
import 'package:barg_test/repository/user_repository/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserService implements UserRepository {
  @override
  Future<Either<UserFailure, User>> getOwnerUser() async {
    try {
      final result = await getUsersList();
      return result.fold(
          (l) => Left(l), (r) => Right(r.firstWhere((user) => user.isOwner!)));
    } catch (e) {
      return const Left(UserFailure.failTofetchData());
    }
  }

  @override
  Future<Either<UserFailure, User>> getUserById({required String id}) async {
    try {
      final result = await getUsersList();
      return result.fold((l) => Left(l), (users) {
        List<User> usersById = users.where((user) => user.guid == id).toList();

        if (usersById.isEmpty) {
          return const Left(UserFailure.invalidUserId());
        } else {
          return Right(usersById[0]);
        }
      });
    } catch (e) {
      return const Left(UserFailure.failTofetchData());
    }
  }

  @override
  Future<Either<UserFailure, List<User>>> getUsersList() async {
    try {
      List data = await parseJsonListFromAssets(AssetsPath.userProfilesJson);
      List<User> users = <User>[];
      for (var item in data) {
        users.add(User.fromJson(item));
      }
      return Right(users);
    } catch (e) {
      return const Left(UserFailure.failTofetchData());
    }
  }
}

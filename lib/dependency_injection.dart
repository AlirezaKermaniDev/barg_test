import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/repository/authentication_repository/authentication_repository.dart';
import 'package:barg_test/repository/user_repository/user_repository.dart';
import 'package:barg_test/service/authentication_service/authentication_service.dart';
import 'package:barg_test/service/user_service/user_service.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

void init() {
  di.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationService());
  di.registerLazySingleton<UserRepository>(() => UserService());
}

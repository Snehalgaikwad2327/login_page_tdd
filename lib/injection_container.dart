import 'package:flutter_login_page/feature/login_page/data/dataSources/user_details_local_data_source.dart';
import 'package:flutter_login_page/feature/login_page/data/repositories/user_details_repositories_impl.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/check_login_data_repository.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/get_screen_name.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/get_user_details_repositories.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/is_remember_me_repository.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/set_remember_data_repository.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/set_screen_name_repository.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/set_user_details_repository.dart';
import 'package:flutter_login_page/feature/login_page/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => LoginBloc(
      checkLoginData: serviceLocator(),
      getScreenName: serviceLocator(),
      getUserDetails: serviceLocator(),
      isRememberMe: serviceLocator(),
      setRememberData: serviceLocator(),
      setScreenName: serviceLocator(),
      setUserDetails: serviceLocator()));

  serviceLocator.registerLazySingleton(() => CheckLoginData(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetScreenName(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetUserDetails(serviceLocator()));
  serviceLocator.registerLazySingleton(() => IsRememberMe(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SetRememberData(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SetScreenName(serviceLocator()));
  serviceLocator.registerLazySingleton(() => SetUserDetails(serviceLocator()));

  serviceLocator.registerLazySingleton<UserDetailsRepository>(
    () => UserDetailsRepositoryImpl(localDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton<UserDetailsLocalDataSource>(
    () => UserDetailsLocalDataSourceImpl(sharedPreferences: serviceLocator()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
}

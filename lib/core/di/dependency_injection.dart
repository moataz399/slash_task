import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:slash/core/helpers/cache_helper.dart';
import 'package:slash/core/helpers/dio_helper.dart';
import 'package:slash/core/network/api_service.dart';
import 'package:slash/core/network/api_service2.dart';
import 'package:slash/core/network/dio_factory.dart';
import 'package:slash/features/home/data/repos/home_repo.dart';
import 'package:slash/features/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<ApiService2>(() => ApiService2());
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}

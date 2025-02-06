import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:top_up_app/data/data_sources/home/home_remote_data_source.dart';
import 'package:top_up_app/data/repositories/home_repository_impl.dart';
import 'package:top_up_app/domain/repositories/home_repository.dart';
import 'package:top_up_app/domain/use_cases/get_home_repository.dart';
import 'package:top_up_app/presentation/blocs/home/home_cubit.dart';

import 'data/data_sources/home/remote/home_remote_data_source_impl.dart';

final getIt = GetIt.I;

void init() {
  /// 5- Bloc
  getIt.registerFactory(() => HomeCubit(homeRepository: getIt()));

  /// 4- Use cases
  getIt.registerLazySingleton(() => GetHomeRepository(homeRepository: getIt()));

  /// 3- Repository
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(
      remoteDataSource: getIt()));


  /// 2- Data Source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
          () => HomeRemoteDataSourceImpl(client: getIt()));



  /// 1-Network Client
  getIt.registerLazySingleton(() => http.Client());

}

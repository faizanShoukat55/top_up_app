import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:top_up_app/data/data_sources/beneficiary/remote/beneficiary_remote_data_source_impl.dart';
import 'package:top_up_app/data/data_sources/home/home_remote_data_source.dart';
import 'package:top_up_app/data/repositories/beneficiary_repository_impl.dart';
import 'package:top_up_app/data/repositories/home_repository_impl.dart';
import 'package:top_up_app/domain/repositories/beneficiary_repository.dart';
import 'package:top_up_app/domain/repositories/home_repository.dart';
import 'package:top_up_app/domain/use_cases/get_beneficiary_repository.dart';
import 'package:top_up_app/domain/use_cases/get_home_repository.dart';
import 'package:top_up_app/presentation/blocs/beneficiary/beneficiary_cubit.dart';
import 'package:top_up_app/presentation/blocs/home/home_cubit.dart';
import 'package:top_up_app/presentation/blocs/top_up/top_up_cubit.dart';

import 'data/data_sources/beneficiary/beneficiary_remote_data_source.dart';
import 'data/data_sources/home/remote/home_remote_data_source_impl.dart';

final getIt = GetIt.I;

void init() {
  /// 5- Bloc
  getIt.registerFactory(() => HomeCubit(homeRepository: getIt()));
  getIt.registerFactory(() => TopUpCubit(homeRepository: getIt()));
  getIt.registerFactory(()=>BeneficiaryCubit(beneficiaryRepository: getIt()));

  /// 4- Use cases
  getIt.registerLazySingleton(() => GetHomeRepository(homeRepository: getIt()));
  getIt.registerLazySingleton(() => GetBeneficiaryRepository(beneficiaryRepository: getIt()));

  /// 3- Repository
  getIt.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<BeneficiaryRepository>(
      () => BeneficiaryRepositoryImpl(remoteDataSource: getIt()));

  /// 2- Data Source
  getIt.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<BeneficiaryRemoteDataSource>(
          () => BeneficiaryRemoteDataSourceImpl(client: getIt()));

  /// 1-Network Client
  getIt.registerLazySingleton(() => http.Client());
}

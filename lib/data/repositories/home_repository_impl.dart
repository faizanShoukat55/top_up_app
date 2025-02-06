import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:top_up_app/core/error/server_failure.dart';
import 'package:top_up_app/data/data_sources/home/home_remote_data_source.dart';

import '../../domain/entities/top_up.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/top_up_model.dart';
import '../models/user_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addTopUp(TopUp topUp) {
    // TODO: implement addTopUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TopUp>>> getTopUpList() async {
    try {
      final List<TopUpModel> topUpList = await remoteDataSource.getTopUpList();
      final List<TopUp> topUps =
          topUpList.map((model) => model.toEntity()).toList();
      return Right(topUps);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

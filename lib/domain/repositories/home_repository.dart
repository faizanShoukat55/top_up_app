import 'package:dartz/dartz.dart';


import '../../core/error/server_failure.dart';
import '../../data/models/user_model.dart';
import '../entities/top_up.dart';


abstract class HomeRepository {
  Future<Either<Failure, List<TopUp>>> getTopUpList();

  Future<Either<Failure, void>> addTopUp(TopUp topUp);

  Future<Either<Failure, UserModel>> getProfile();
}
import 'package:dartz/dartz.dart';


import '../../core/error/server_failure.dart';
import '../../data/models/top_up_model.dart';
import '../entities/top_up.dart';


abstract class HomeRepository {
  Future<Either<Failure, List<TopUp>>> getTopUpList();

  Future<Either<Failure, TopUp>> addTopUp(TopUpModel topUp);


}
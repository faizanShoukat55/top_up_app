import 'package:dartz/dartz.dart';
import 'package:top_up_app/core/error/server_failure.dart';
import 'package:top_up_app/domain/entities/top_up.dart';
import 'package:top_up_app/domain/repositories/home_repository.dart';

class GetHomeRepository{
  final HomeRepository homeRepository;
  GetHomeRepository({required this.homeRepository});

  Future<Either<Failure,List<TopUp>>> getTopUpList() async{
    return await homeRepository.getTopUpList();
  }

  Future<Either<Failure,TopUp>> addTopUp(TopUp topUp)async{
    return await homeRepository.addTopUp(topUp.toModel());

  }

}
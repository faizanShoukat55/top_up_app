import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:top_up_app/core/error/server_failure.dart';
import 'package:top_up_app/domain/entities/beneficiary.dart';
import '../../domain/repositories/beneficiary_repository.dart';
import '../data_sources/beneficiary/beneficiary_remote_data_source.dart';
import '../models/beneficiary_model.dart';

class BeneficiaryRepositoryImpl extends BeneficiaryRepository {
  final BeneficiaryRemoteDataSource remoteDataSource;

  BeneficiaryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerFailure, Beneficiary>> addBeneficiary(
      BeneficiaryModel beneficiary) async {
    try {
      final response = await remoteDataSource.addBeneficiary(beneficiary);

      return Right(response.toEntity());
    } catch (e) {
      return Left(ServerFailure());
    }
  }



  @override
  Future<Either<ServerFailure, List<Beneficiary>>> getBeneficiaries() async {
    try {
      final List<BeneficiaryModel> topUpList =
          await remoteDataSource.getBeneficiaries();
      final List<Beneficiary> topUps =
          topUpList.map((model) => model.toEntity()).toList();
      return Right(topUps);
    } catch (e) {
      return Left(ServerFailure());
    }
  }


}

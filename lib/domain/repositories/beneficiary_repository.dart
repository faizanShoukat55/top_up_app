import 'package:dartz/dartz.dart';
import 'package:top_up_app/core/error/server_failure.dart';

import '../../data/models/beneficiary_model.dart';
import '../entities/beneficiary.dart';


abstract class BeneficiaryRepository {
  Future<Either<ServerFailure, List<Beneficiary>>> getBeneficiaries();

  Future<Either<ServerFailure, Beneficiary>> addBeneficiary(BeneficiaryModel beneficiary);
}

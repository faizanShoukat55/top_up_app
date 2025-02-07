import 'package:dartz/dartz.dart';
import 'package:top_up_app/core/error/server_failure.dart';
import 'package:top_up_app/domain/entities/beneficiary.dart';
import 'package:top_up_app/domain/repositories/beneficiary_repository.dart';

class GetBeneficiaryRepository{
  final BeneficiaryRepository beneficiaryRepository;
  GetBeneficiaryRepository({required this.beneficiaryRepository});

  Future<Either<Failure,List<Beneficiary>>> call() async{
    return await beneficiaryRepository.getBeneficiaries();
  }

  Future<Either<Failure,Beneficiary>> addBeneficiary(Beneficiary beneficiary)async{
    return await beneficiaryRepository.addBeneficiary(beneficiary.toModel());

  }

}
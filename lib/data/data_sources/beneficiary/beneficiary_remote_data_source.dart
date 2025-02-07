

import '../../models/beneficiary_model.dart';

abstract class BeneficiaryRemoteDataSource {
  Future<List<BeneficiaryModel>> getBeneficiaries();

  Future<BeneficiaryModel> addBeneficiary(BeneficiaryModel beneficiary);


}

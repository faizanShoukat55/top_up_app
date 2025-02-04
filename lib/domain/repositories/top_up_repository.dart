import '../entities/beneficiary.dart';

abstract class TopUpRepository {
  Future<List<Beneficiary>> getBeneficiaries();

  Future<void> addBeneficiary(Beneficiary beneficiary);

  Future<void> performTopUp(String beneficiaryId, double amount);
}

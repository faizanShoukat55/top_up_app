import 'dart:async';
import '../../domain/entities/beneficiary.dart';
import '../../domain/repositories/top_up_repository.dart';

class TopUpRepositoryImpl implements TopUpRepository {
  final List<Beneficiary> _beneficiaries = [
    const Beneficiary(id: "1", nickname: "John", phoneNumber: "0501234567"),
    const Beneficiary(id: "2", nickname: "Jane", phoneNumber: "0529876543"),
  ];

  @override
  Future<List<Beneficiary>> getBeneficiaries() async {
    return _beneficiaries;
  }

  @override
  Future<void> addBeneficiary(Beneficiary beneficiary) async {
    if (_beneficiaries.length < 5) {
      _beneficiaries.add(beneficiary);
    } else {
      throw Exception("Max 5 beneficiaries allowed");
    }
  }

  @override
  Future<void> performTopUp(String beneficiaryId, double amount) async {
    await Future.delayed(const Duration(seconds: 1));
    print("Top-up successful for beneficiary $beneficiaryId, Amount: $amount");
  }
}

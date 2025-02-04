import 'package:equatable/equatable.dart';
import '../../domain/entities/beneficiary.dart';

abstract class TopUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBeneficiaries extends TopUpEvent {}

class AddBeneficiary extends TopUpEvent {
  final Beneficiary beneficiary;
  AddBeneficiary(this.beneficiary);

  @override
  List<Object?> get props => [beneficiary];
}

class PerformTopUp extends TopUpEvent {
  final String beneficiaryId;
  final double amount;

  PerformTopUp(this.beneficiaryId, this.amount);

  @override
  List<Object?> get props => [beneficiaryId, amount];
}

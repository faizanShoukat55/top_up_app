import 'package:equatable/equatable.dart';
import '../../domain/entities/beneficiary.dart';

abstract class TopUpState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TopUpInitial extends TopUpState {}

class BeneficiariesLoaded extends TopUpState {
  final List<Beneficiary> beneficiaries;

  BeneficiariesLoaded(this.beneficiaries);

  @override
  List<Object?> get props => [beneficiaries];
}

class TopUpSuccess extends TopUpState {}

class TopUpFailure extends TopUpState {
  final String error;

  TopUpFailure(this.error);

  @override
  List<Object?> get props => [error];
}

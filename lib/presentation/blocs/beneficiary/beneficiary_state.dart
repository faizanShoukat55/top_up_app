import 'package:equatable/equatable.dart';
import 'package:top_up_app/core/utils/constant.dart';
import 'package:top_up_app/domain/entities/beneficiary.dart';

import '../../../core/error/server_exception.dart';
import '../../../core/utils/enums.dart';

class BeneficiaryState extends Equatable {
  final ViewState? viewState;
  final List<Beneficiary>? beneficiaries;
  final ServerException? error;

  bool get isAddBeneficiaryAllowed => (beneficiaries?.length ?? 0) <= Constant.maxAllowBeneficiaries;

  const BeneficiaryState({this.viewState, this.beneficiaries, this.error});

  BeneficiaryState copyWith(
      {ViewState? viewState,
      List<Beneficiary>? beneficiaries,
      ServerException? error}) {
    return BeneficiaryState(
        viewState: viewState ?? this.viewState,
        beneficiaries: beneficiaries ?? this.beneficiaries,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [viewState, beneficiaries, error];
}

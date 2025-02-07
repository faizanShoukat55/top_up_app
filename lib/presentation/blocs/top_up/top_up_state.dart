import 'package:equatable/equatable.dart';
import 'package:top_up_app/core/error/server_exception.dart';
import 'package:top_up_app/core/utils/enums.dart';

import '../../../domain/entities/beneficiary.dart';
import '../../../domain/entities/top_up.dart';

class TopUpState extends Equatable {
  final ViewState? viewState;
  final double? amount;
  final Beneficiary? beneficiary;
  final TopUpStatus? topUpStatus;
  final ServerException? error;
  final TopUp? topUp;
  final List<TopUp>? topUpList;

  const TopUpState({
    this.viewState,
    this.amount,
    this.beneficiary,
    this.topUpStatus,
    this.error,
    this.topUp,
    this.topUpList,
  });

  TopUpState copyWith(
      {ViewState? viewState,
      double? amount,
      Beneficiary? beneficiary,
      TopUpStatus? topUpStatus,
      ServerException? error,
      TopUp? topUp,
      List<TopUp>? topUpList}) {
    return TopUpState(
        viewState: viewState ?? this.viewState,
        amount: amount ?? this.amount,
        beneficiary: beneficiary ?? this.beneficiary,
        topUpStatus: topUpStatus ?? this.topUpStatus,
        error: error ?? this.error,
        topUp: topUp ?? this.topUp,
        topUpList: topUpList ?? this.topUpList);
  }

  @override
  List<Object?> get props =>
      [viewState, amount, beneficiary, topUpStatus, error, topUp, topUpList];
}

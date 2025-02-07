import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/constant.dart';
import 'package:top_up_app/core/utils/extensions.dart';
import 'package:top_up_app/domain/entities/user.dart';
import 'package:top_up_app/domain/use_cases/get_home_repository.dart';
import 'package:top_up_app/presentation/blocs/top_up/top_up_state.dart';
import '../../../core/error/server_exception.dart';
import '../../../core/utils/enums.dart';
import '../../../domain/entities/beneficiary.dart';
import '../../../domain/entities/top_up.dart';

class TopUpCubit extends Cubit<TopUpState> {
  final GetHomeRepository homeRepository;

  TopUpCubit({required this.homeRepository})
      : super(const TopUpState(viewState: ViewState.initial)) {
    getTopUpList();
  }

  Future<void> getTopUpList() async {
    emit(state.copyWith(viewState: ViewState.loading));
    final response = await homeRepository.getTopUpList();
    response.fold(
      (failure) => emit(state.copyWith(
          viewState: ViewState.error,
          error: ServerException(message: failure.toString()))),
      (topUpList) => emit(
          state.copyWith(viewState: ViewState.loaded, topUpList: topUpList)),
    );
  }

  Future<void> addTopUp({required TopUp topUp, required User user}) async {
    emit(state.copyWith(viewState: ViewState.loading));

    final response = await homeRepository.addTopUp(topUp);
    response.fold(
      (failure) => emit(state.copyWith(
          viewState: ViewState.error,
          error: ServerException(message: failure.toString()))),
      (newTopUp) => emit(state.copyWith(
          viewState: ViewState.loaded,
          topUpStatus: TopUpStatus.success,
          topUp: newTopUp,
          topUpList: [newTopUp, ...state.topUpList ?? []])),
    );
  }

  void addTopUpToList(TopUp? topUp) {
    emit(state.copyWith(
      topUpStatus: TopUpStatus.busy,
    ));
    if (topUp == null) return;
    List<TopUp> topUpList = List.from(state.topUpList ?? []);
    topUpList.add(topUp);
    emit(state.copyWith(
      topUpStatus: TopUpStatus.topUpAdded,
      topUpList: topUpList.reversed.toList(),
    ));
  }

  void selectAmount(double? amount) {
    emit(state.copyWith(topUpStatus: TopUpStatus.selected, amount: amount));
  }

  void selectBeneficiary(Beneficiary? beneficiary) {
    emit(state.copyWith(
        topUpStatus: TopUpStatus.selected, beneficiary: beneficiary));
  }

  /// Validates balance and spending limits
  Tuple2<bool, String?> validateBalance(
      {required TopUp topUp, required User user}) {
    final isBalanceValid =
        _isBalanceValid(topUp.amount.parsedAmount, user.balance ?? 0.0);
    if (!isBalanceValid.value1) return isBalanceValid;

    final isMonthlyLimitValid =
        _validateMonthlySpendingLimit(topUp.amount.parsedAmount);
    if (!isMonthlyLimitValid.value1) return isMonthlyLimitValid;

    final isBeneficiaryLimitValid = _validateMonthlyBeneficiaryLimit(
        topUp.amount.parsedAmount,
        topUp.accountNumber ?? "",
        user.isVerified ?? false);
    if (!isBeneficiaryLimitValid.value1) return isBeneficiaryLimitValid;

    return const Tuple2(true, null);
  }

  /// Helper Methods
  Tuple2<bool, String?> _isBalanceValid(
          double amount, double availableBalance) =>
      amount > (availableBalance-Constant.topUpFee)
          ? Tuple2(false, Constant.inSufficientBalance)
          : const Tuple2(true, null);

  double _calculateTotalMonthlySpent() => (state.topUpList ?? [])
      .where((topUp) => topUp.type == TopUpType.debit)
      .map((topUp) => (topUp.amount ?? "0").parsedAmount)
      .fold(0.0, (total, amount) => total + amount);

  Tuple2<bool, String?> _validateMonthlySpendingLimit(double amount) {
    double totalSpent = _calculateTotalMonthlySpent();
    return (totalSpent + amount > Constant.monthlyTopUpLimit)
        ? Tuple2(false, Constant.monthlyLimitReached)
        : const Tuple2(true, null);
  }

  double _calculateBeneficiaryMonthlySpent(String accountNumber) =>
      state.topUpList
          ?.where((t) =>
              t.accountNumber == accountNumber && t.type == TopUpType.debit)
          .fold(0.0, (total, t) => total! + t.amount.parsedAmount) ??
      0.0;

  Tuple2<bool, String?> _validateMonthlyBeneficiaryLimit(
      double amount, String accountNumber, bool isVerified) {
    double spent = _calculateBeneficiaryMonthlySpent(accountNumber);
    double limit = isVerified
        ? Constant.verifiedBeneficiaryLimit
        : Constant.unVerifiedBeneficiaryLimit;
    return (spent + amount > limit)
        ? Tuple2(false, Constant.payeesMonthlyLimitReached)
        : const Tuple2(true, null);
  }
}

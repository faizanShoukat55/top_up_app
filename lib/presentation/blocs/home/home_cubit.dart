import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/error/server_exception.dart';
import 'package:top_up_app/core/utils/enums.dart';
import 'package:top_up_app/domain/entities/top_up.dart';

import 'package:top_up_app/presentation/blocs/home/home_state.dart';

import '../../../core/utils/constant.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/use_cases/get_home_repository.dart';
import '../../../main.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeRepository homeRepository;

  HomeCubit({required this.homeRepository})
      : super(const HomeState(viewState: ViewState.initial)) {
    getMyProfile();
  }

  /// Get My Profile
  Future<void> getMyProfile() async {
    emit(state.copyWith(viewState: ViewState.loading));

    /// Todo: for the time being using static data
    emit(state.copyWith(
        viewState: ViewState.loaded,
        user: User(
            id: "-1",
            name: "Faizan Shoukat",
            balance: 4000,
            isVerified: true,
            isBalanceVisible: true)));
  }

  Future<void> updateBalanceVisibility(bool isVisible) async {
    emit(state.copyWith(viewState: ViewState.busy));
    if (state.user != null) {
      User updatedUser = state.user!.copyWith(isBalanceVisible: isVisible);
      emit(state.copyWith(viewState: ViewState.loaded, user: updatedUser));
    } else {
      emit(
          state.copyWith(viewState: ViewState.loaded)); // Handle null user case
    }
  }

  Future<void> updateMyBalance(TopUp? topUp) async {
    try {
      emit(
        state.copyWith(
          viewState: ViewState.loading,
        ),
      );

      User user = User.fromJson(state.user!.toJson());
      double balance = user.balance ?? 0;
      double chargedAmount = double.tryParse('${topUp?.amount}') ?? 0;

      /// TopUp - Debit Amount
      if (state.user?.id != topUp?.accountNumber) {
        double totalBalance =
            balance - (chargedAmount + Constant.topUpFee);
        user.balance = totalBalance;
      }

      emit(state.copyWith(viewState: ViewState.loaded, user: user));
    } catch (e, stackTrace) {
      logger.e('$e $stackTrace');
      emit(state.copyWith(
        error: ServerException(),
      ));
    }
  }
}

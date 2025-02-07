import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/enums.dart';
import 'package:top_up_app/domain/use_cases/get_beneficiary_repository.dart';
import 'package:top_up_app/presentation/blocs/beneficiary/beneficiary_state.dart';

import '../../../core/error/server_exception.dart';
import '../../../domain/entities/beneficiary.dart';

class BeneficiaryCubit extends Cubit<BeneficiaryState> {
  final GetBeneficiaryRepository beneficiaryRepository;

  BeneficiaryCubit({required this.beneficiaryRepository})
      : super(const BeneficiaryState(viewState: ViewState.initial)) {
    getBeneficiary();
  }

  void getBeneficiary() async {
    try {
      /// loading
      emit(state.copyWith(viewState: ViewState.loading));

      /// api call
      final response = await beneficiaryRepository.call();

      /// response handling
      response.fold(
              (failure) =>
              emit(
                state.copyWith(
                    viewState: ViewState.error,
                    error: ServerException(message: failure.toString())),
              ),
              (beneficiaryList) =>
              emit(state.copyWith(
                  viewState: ViewState.loaded,
                  beneficiaries: beneficiaryList)));
    }catch(e){
      emit(state.copyWith(
        viewState: ViewState.error,
        error: ServerException(),
      ));
    }
  }

  /// Add a new beneficiary
  Future<void> addBeneficiary(Beneficiary beneficiary) async {
    /// loading
    emit(state.copyWith(viewState: ViewState.loading));
    try {
      /// api call
      final result = await beneficiaryRepository.addBeneficiary(beneficiary);
      /// response handling
      result.fold(
            (failure) {
          emit(state.copyWith(
            viewState: ViewState.error,
            error: ServerException(),
          ));
        },
            (beneficiary) {
          final updatedBeneficiaries = [...?state.beneficiaries, beneficiary];
          emit(state.copyWith(
            viewState: ViewState.loaded,
            beneficiaries: updatedBeneficiaries,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        viewState: ViewState.error,
        error: ServerException(),
      ));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/error/server_exception.dart';
import 'package:top_up_app/core/utils/enums.dart';

import 'package:top_up_app/presentation/blocs/home/home_state.dart';

import '../../../domain/use_cases/get_home_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeRepository homeRepository;

  HomeCubit({required this.homeRepository})
      : super(const HomeState(viewState: ViewState.initial)) {
    getTopUpList();
  }

  void getTopUpList() async {
    /// loading
    emit(state.copyWith(viewState: ViewState.loading));

    /// api call
    final response = await homeRepository.getTopUpList();

    /// response handling
    response.fold(
        (failure) => emit(
              state.copyWith(
                  viewState: ViewState.error,
                  error: ServerException(message: failure.toString())),
            ),
        (topUpList) => emit(
            state.copyWith(viewState: ViewState.loaded, topUpList: topUpList)));
  }
}

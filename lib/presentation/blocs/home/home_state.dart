import 'package:equatable/equatable.dart';
import 'package:top_up_app/core/utils/enums.dart';
import 'package:top_up_app/domain/entities/top_up.dart';

import '../../../core/error/server_exception.dart';

class HomeState extends Equatable {
  final ViewState? viewState;
  final List<TopUp>? topUpList;
  final ServerException? error;

  const HomeState({this.topUpList, this.viewState, this.error});

  HomeState copyWith(
      {ViewState? viewState, List<TopUp>? topUpList, ServerException? error}) {
    return HomeState(
        viewState: viewState ?? this.viewState,
        topUpList: topUpList ?? this.topUpList,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [viewState, topUpList, error];
}

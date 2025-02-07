import 'package:equatable/equatable.dart';
import 'package:top_up_app/core/utils/enums.dart';

import '../../../core/error/server_exception.dart';
import '../../../domain/entities/user.dart';

class HomeState extends Equatable {
  final ViewState? viewState;
  final User? user;
  final ServerException? error;

  const HomeState({ this.user, this.viewState, this.error});

  get isVerified=>user?.isVerified??false;

  HomeState copyWith(
      {ViewState? viewState,
      User? user,
      ServerException? error}) {
    return HomeState(
        viewState: viewState ?? this.viewState,
        user: user ?? this.user,
        error: error ?? this.error);
  }

  @override
  List<Object?> get props => [viewState, user, error];
}

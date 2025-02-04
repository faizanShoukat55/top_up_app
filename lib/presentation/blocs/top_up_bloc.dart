import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/top_up_repository.dart';
import '../../domain/entities/beneficiary.dart';
import 'top_up_event.dart';
import 'top_up_state.dart';

class TopUpBloc extends Bloc<TopUpEvent, TopUpState> {
  final TopUpRepository repository;

  TopUpBloc(this.repository) : super(TopUpInitial()) {
    on<LoadBeneficiaries>((event, emit) async {
      print("Loading beneficiaries...");
      final beneficiaries = await repository.getBeneficiaries();
      print("Loaded beneficiaries: ${beneficiaries.length}");
      emit(BeneficiariesLoaded(beneficiaries));
    });

    on<AddBeneficiary>((event, emit) async {
      try {
        await repository.addBeneficiary(event.beneficiary);
        final beneficiaries = await repository.getBeneficiaries();
        emit(BeneficiariesLoaded(beneficiaries));
      } catch (e) {
        emit(TopUpFailure(e.toString()));
      }
    });

    on<PerformTopUp>((event, emit) async {
      try {
        await repository.performTopUp(event.beneficiaryId, event.amount);
        emit(TopUpSuccess());
      } catch (e) {
        emit(TopUpFailure(e.toString()));
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/presentation/blocs/beneficiary/beneficiary_cubit.dart';
import 'package:top_up_app/presentation/blocs/beneficiary/beneficiary_state.dart';

class AddBeneficiaryButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddBeneficiaryButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeneficiaryCubit, BeneficiaryState>(
        builder: (context, state) {
      return state.isAddBeneficiaryAllowed
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                backgroundColor: Colors.brown,
                onPressed: onPressed,
                child: const Center(
                  child:  Icon(
                    Icons.add,
                    //size: 50,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink();
    });
  }
}

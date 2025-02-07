import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/presentation/blocs/top_up/top_up_cubit.dart';
import 'package:top_up_app/presentation/blocs/top_up/top_up_state.dart';

import '../../../../core/utils/constant.dart';

class AmountTile extends StatelessWidget {
  const AmountTile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopUpCubit, TopUpState>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(), // Prevents scrolling inside the bottom sheet
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Two items per row
            crossAxisSpacing: 4, // Spacing between columns
            mainAxisSpacing: 4, // Spacing between rows
            childAspectRatio: 3, // Controls the height of the tiles
          ),
          itemCount: Constant.topUpAmount.length,
          itemBuilder: (context, index) {
            return ChoiceChip(
              selectedColor: Colors.blue,
              checkmarkColor: Colors.white,
              disabledColor: Colors.grey,
              label: Text('${Constant.currency} ${Constant.topUpAmount[index]}'),
              selected: state.amount == Constant.topUpAmount[index],
              onSelected: (value) {
                if (value) {
                  context
                      .read<TopUpCubit>()
                      .selectAmount(Constant.topUpAmount[index]);
                } else {
                  context.read<TopUpCubit>().selectAmount(null);
                }
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}


import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/enums.dart';
import '../../../../core/error/server_exception.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/ui.dart';
import '../../../blocs/beneficiary/beneficiary_cubit.dart';
import '../../../blocs/beneficiary/beneficiary_state.dart';
import '../../../blocs/top_up/top_up_cubit.dart';
import '../../../blocs/top_up/top_up_state.dart';
import 'amount_tile.dart';
import 'beneficiary_tile.dart';

class BeneficiariesList extends StatelessWidget {
  const BeneficiariesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopUpCubit, TopUpState>(
      builder: (context, topUpState) {
        return _buildBeneficiaryList(topUpState);
      },
    );
  }


  /// 1- Beneficiary List
  BlocConsumer<BeneficiaryCubit, BeneficiaryState> _buildBeneficiaryList(
      TopUpState topUpState) {
    return BlocConsumer<BeneficiaryCubit, BeneficiaryState>(
      builder: (context, state) {
        if (state.viewState == ViewState.loading) {
          return const CircularProgressIndicator();
        }
        return ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.beneficiaries?.length ?? 0,
          shrinkWrap: true,
          separatorBuilder: (context, index) => DottedLine(
            dashColor: Theme.of(context).colorScheme.surface,
            lineThickness: 0.2,
          ),
          itemBuilder: (context, index) => InkWell(
            splashColor: Colors.white,
            onTap: () {
              if (topUpState.beneficiary?.id ==
                  state.beneficiaries![index].id) {
                context.read<TopUpCubit>().selectBeneficiary(
                      null,
                    );
              } else {
                context.read<TopUpCubit>().selectBeneficiary(
                      state.beneficiaries![index],
                    );
              }

              /// Please select top up amount
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Top Up Amount",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: AmountTile(),
                      ),
                    ],
                  );
                },
              );
            },
            child: BeneficiaryTile(
              isSelected:
                  topUpState.beneficiary?.id == state.beneficiaries![index].id,
              amount: topUpState.amount ?? 0.0,
              beneficiary: state.beneficiaries![index],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state.error is ServerException) {
          ScaffoldMessenger.of(context).showSnackBar(Ui.customSnackBar(
              message: state.error?.message ?? Constant.genericErrorMessage,
              type: SnackBarType.failure));
        }
      },
    );
  }
}

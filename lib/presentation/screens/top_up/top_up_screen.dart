import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/constant.dart';
import 'package:top_up_app/presentation/screens/top_up/widgets/add_beneficiary_button.dart';
import 'package:top_up_app/presentation/screens/top_up/widgets/add_beneficiary_dialog.dart';
import 'package:top_up_app/presentation/screens/top_up/widgets/beneficiaries_list.dart';
import 'package:top_up_app/presentation/screens/top_up/widgets/payees_title.dart';
import '../../../core/error/server_exception.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/ui.dart';
import '../../../domain/entities/top_up.dart';
import '../../../domain/entities/user.dart';
import '../../blocs/home/home_cubit.dart';
import '../../blocs/top_up/top_up_cubit.dart';
import '../../blocs/top_up/top_up_state.dart';

class TopUpScreen extends StatefulWidget {
  const TopUpScreen({super.key});

  @override
  State<TopUpScreen> createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Up"),
      ),
      floatingActionButton: AddBeneficiaryButton(
        onPressed: () {
          /// Add Beneficiary Bottom Sheet
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ), builder: (BuildContext context) {
            return const AddBeneficiaryBottomSheet();
          });
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10,
          children: [

            /// Payees Title
            const PayeesTitle(),

            /// Payees List
            const BeneficiariesList(),

            BlocConsumer<TopUpCubit, TopUpState>(
              listener: (context, state) {
                if (state.topUpStatus == TopUpStatus.success) {
                   _handleTopUpSuccess(context, state);
                }

                if (state.viewState == ViewState.error) {
                  ///Todo: Failure case need to handle properly
                   _handleTopUpError(context, state.error);
                }
              },
              builder: (context, state) {
                if (state.amount == null || state.beneficiary == null) {
                  return const SizedBox();
                }
                return _buildPayButton(context, state);
                // return Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 20),
                //   child: SizedBox(
                //     width: double.maxFinite,
                //     child: ElevatedButton(
                //         onPressed: () {
                //           /// validations
                //           /// For verified account per payee 1000 TopUp allowed
                //           /// For un-verified account per payee 500 TopUp allowed
                //           /// Per month max 3000 TopUp allowed
                //
                //           User? user =
                //               context.read<HomeCubit>().state.user ?? User();
                //
                //           /// Top Up
                //           TopUp topUp = TopUp(
                //               id: "1",
                //               currency: Constant.currency,
                //               amount: '${state.amount}',
                //               accountNumber: '${state.beneficiary?.id}',
                //               type: TopUpType.debit,
                //               beneficiaryName: state.beneficiary?.nickname,
                //               createdAt: DateTime.now().toIso8601String());
                //
                //           var isBalanceValid = context
                //               .read<TopUpCubit>()
                //               .validateBalance(topUp: topUp, user: user);
                //           if (isBalanceValid.value1) {
                //             /// Api Call
                //             context
                //                 .read<TopUpCubit>()
                //                 .addTopUp(topUp: topUp, user: user);
                //           } else {
                //             ScaffoldMessenger.of(context).showSnackBar(
                //                 Ui.customSnackBar(
                //                     message: isBalanceValid.value2??Constant.genericErrorMessage,
                //                     type: SnackBarType.failure));
                //           }
                //         },
                //         child: const Text(
                //           'Pay',
                //         )),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }


  void _handleTopUpSuccess(BuildContext context, TopUpState state) {
    context.read<HomeCubit>().updateMyBalance(state.topUp);
    context.read<TopUpCubit>().addTopUpToList(state.topUp);
    ScaffoldMessenger.of(context).showSnackBar(
      Ui.customSnackBar(
          message: Constant.topUpSuccessMessage, type: SnackBarType.success),
    );
  }


  void _handleTopUpError(BuildContext context, ServerException? error) {
    ScaffoldMessenger.of(context).showSnackBar(
      Ui.customSnackBar(message: error?.message ?? Constant.genericErrorMessage,
          type: SnackBarType.failure),
    );
  }

  Widget _buildPayButton(BuildContext context, TopUpState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {
            final user = context
                .read<HomeCubit>()
                .state
                .user ?? User();
            final topUp = TopUp(
              id: "1",
              currency: Constant.currency,
              amount: '${state.amount}',
              accountNumber: '${state.beneficiary?.id}',
              type: TopUpType.debit,
              beneficiaryName: state.beneficiary?.nickname,
              createdAt: DateTime.now().toIso8601String(),
            );

            final validation = context.read<TopUpCubit>().validateBalance(
                topUp: topUp, user: user);
            if (validation.value1) {
              context.read<TopUpCubit>().addTopUp(topUp: topUp, user: user);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                Ui.customSnackBar(
                    message: validation.value2 ?? Constant.genericErrorMessage,
                    type: SnackBarType.failure),
              );
            }
          },
          child: const Text('Pay'),
        ),
      ),
    );
  }
}
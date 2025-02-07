import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/app_colors.dart';
import '../../../blocs/home/home_cubit.dart';
import '../../../blocs/home/home_state.dart';
import '../../../widgets/profile_with_badge.dart';
import '../../top_up/top_up_screen.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary.withAlpha(1),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileWithBadge(
                              isVerified: state.user?.isVerified ?? false),
                          Text(
                            state.user?.name ?? "N/A",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.secondaryColor),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                (state.user?.isBalanceVisible ?? false)
                                    ? '\$${state.user?.balance?.toStringAsFixed(2)}'
                                    : '******',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                color: Theme.of(context).colorScheme.surface,
                                icon: Icon(
                                    (state.user?.isBalanceVisible ?? false)
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                onPressed: () {
                                  bool isBalanceVisible =
                                      (state.user!.isBalanceVisible ?? false);
                                  context
                                      .read<HomeCubit>()
                                      .updateBalanceVisibility(
                                          !isBalanceVisible);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {
                /// Navigator due to time constraints
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopUpScreen(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_balance_wallet,
                    color: AppColors.whiteColor,
                    size: 80,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Click for Top Up",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_up_app/core/utils/constant.dart';
import 'package:top_up_app/core/utils/enums.dart';
import 'package:top_up_app/presentation/blocs/top_up/top_up_cubit.dart';
import 'package:top_up_app/presentation/screens/home/widgets/history_tile.dart';
import '../../../core/utils/app_colors.dart';
import '../../blocs/top_up/top_up_state.dart';
import '../../widgets/title_widget.dart';
import 'widgets/balance_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// balance Card
            const BalanceCard(),
            const SizedBox(height: 40),

            /// Title
            const TitleWidget(title: 'Top Up History',
              subTitle: 'Here you can see the top up credited and debited history',),
            const SizedBox(height: 16),

            BlocBuilder<TopUpCubit, TopUpState>(
              builder: (context, state) {
                if (state.viewState == ViewState.loaded) {
                  if (state.topUpList?.isEmpty ?? true) {
                    return  Center(
                      child: Text(
                       Constant.noRecordFound,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  ///  Top Up History List
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.topUpList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TopUpHistoryTile(
                        topUp: state.topUpList![index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        DottedLine(
                          dashColor: Theme
                              .of(context)
                              .colorScheme
                              .surface,
                          lineThickness: 0.2,
                        ),
                  );
                } else if (state.viewState == ViewState.error) {
                  return Center(
                    child: Text(
                      "Error: ${state.error}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else if (state.viewState == ViewState.loading) {
                  return  const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryColor,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}

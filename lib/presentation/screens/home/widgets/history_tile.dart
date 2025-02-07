import 'package:flutter/material.dart';
import 'package:top_up_app/core/utils/enums.dart';
import 'package:top_up_app/core/utils/extensions.dart';
import 'package:top_up_app/domain/entities/top_up.dart';

import '../../../../core/utils/app_colors.dart';

class TopUpHistoryTile extends StatelessWidget {
  const TopUpHistoryTile({
    super.key,
    required this.topUp,
  });

  final TopUp topUp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              size: 28,
              color: Colors.brown,
            ),
          ),
          Expanded(
            child: Column(
              spacing: 2,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Amount Transfer to ${topUp.beneficiaryName}'),
                Text(
                  (topUp.createdAt ?? "").dateTimeConversion,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
          Text(
            _getAmount(),
            style: TextStyle(
                color: topUp.type == TopUpType.debit
                    ? AppColors.errorColor
                    : AppColors.successColor),
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_circle_up_outlined,
            color: AppColors.errorColor,
          )
        ],
      ),
    );
  }

  String _getAmount() {
    String sign = topUp.type == TopUpType.debit ? '-' : '+';
    return '$sign ${topUp.currency} ${topUp.amount}';
  }
}

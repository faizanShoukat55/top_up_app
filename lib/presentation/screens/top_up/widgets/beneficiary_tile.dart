import 'package:flutter/material.dart';
import 'package:top_up_app/core/utils/constant.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../domain/entities/beneficiary.dart';


class BeneficiaryTile extends StatelessWidget {
  const BeneficiaryTile({
    super.key,
    this.isSelected = false,
    required this.amount,
    required this.beneficiary,
  });

  final bool isSelected;
  final double amount;
  final Beneficiary beneficiary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: CircleAvatar(
              child: Icon(
                Icons.wallet_outlined,
                size: 38,
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 02,
              children: [
                Text(
                  '${beneficiary.nickname}',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(color: AppColors.whiteColor),
                ),
                Text(
                  '${beneficiary.phoneNumber}',
                ),
              ],
            ),
          ),

          if (isSelected) ...[
            Text("$amount ${Constant.currency}"),
            const SizedBox(
              width: 10,
            ),
          ],
          Icon(
            isSelected ? Icons.check_box : Icons.check_box_outline_blank,
            size: 24,
            color: Colors.green,
          ),

        ],
      ),
    );
  }

}

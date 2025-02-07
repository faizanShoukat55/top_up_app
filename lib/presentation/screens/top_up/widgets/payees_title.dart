import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constant.dart';

class PayeesTitle extends StatelessWidget {
  const PayeesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payees',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(),
              ),
              Text(
                'You can add maximum ${Constant.maxAllowBeneficiaries} Payees\n'
                    'You can top up max ${Constant.monthlyTopUpLimit} AED/Month\n'
                    'Please select Payee and add add top up amount\n'
                    'Top Up Fee ${Constant.topUpFee} ${Constant.currency}'
                ,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.lightGreyColor),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),


        ],
      ),
    );
  }
}

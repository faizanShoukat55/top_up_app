import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class TitleWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const TitleWidget({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? "N/A",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: AppColors.whiteColor),
        ),
        Text(
          subTitle ?? "N/A",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}

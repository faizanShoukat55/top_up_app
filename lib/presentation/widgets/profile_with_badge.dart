import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class ProfileWithBadge extends StatelessWidget {
  final bool isVerified;

  const ProfileWithBadge({super.key, required this.isVerified});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CircleAvatar(
          radius: 40,
          child: Icon(Icons.person, size: 40, color: Colors.white),
        ),
        if (isVerified)
          const Positioned(
            right: 0,
            bottom: 0,
            child:
                Icon(Icons.verified, size: 18, color: AppColors.secondaryColor),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:top_up_app/core/utils/app_colors.dart';

import 'enums.dart';



class Ui {
  /// Snack Bar
  static SnackBar customSnackBar({required String message,required SnackBarType type}) {
    return SnackBar(
      duration: const Duration(seconds: 5),
      content: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            // Icon(
            //   Icons.add_circle,
            //   color: Colors.white,
            // ),
            Text(
              message,
            ),
          ],
        ),
      ),
      backgroundColor: type==SnackBarType.success?AppColors.successColor:AppColors.errorColor,
    );
  }
}

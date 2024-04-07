import 'package:flutter/material.dart';
import 'package:task_management_fares/common/primary_btn.dart';

class LoadingButton extends PrimaryButton {
  const LoadingButton({super.key});

  @override
  VoidCallback get onPressed => () {};

  @override
  Widget get labelWidget => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3,
          ),
        ),
      );
}

import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.hPadding,
    this.vPadding,
    this.elevation,
    this.labelWidget,
    this.labelStyle,
    this.isSecondary = false,
    this.label,
    this.onPressed,
  });

  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;
  final bool isSecondary;
  final double? hPadding;
  final double? vPadding;
  final double? elevation;
  final Widget? labelWidget;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecondary
            ? (backgroundColor ?? Colors.white)
            : backgroundColor ?? Theme.of(context).primaryColor,
        foregroundColor: isSecondary
            ? (foregroundColor ?? Colors.black)
            : Theme.of(context).colorScheme.onPrimary,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            width: 1.5,
            color: isSecondary
                ? (foregroundColor ?? Colors.black)
                : (backgroundColor ?? Theme.of(context).primaryColor),
          ),
        ),
        textStyle: labelStyle ?? Theme.of(context).textTheme.titleMedium,
        padding: EdgeInsets.symmetric(
          vertical: vPadding ?? 16,
          horizontal: hPadding ?? 64,
        ),
      ),
      child: labelWidget ?? Text(label ?? ""),
    );
  }
}

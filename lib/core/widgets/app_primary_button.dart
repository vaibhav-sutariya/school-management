import 'package:flutter/material.dart';
import 'package:starter_app/cubit/theme_cubit.dart';

class AppPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Widget? child;
  final Color? color;
  final Color? textColor;
  final bool fullWidth;
  final double height;
  final double borderRadius;
  final bool isLoading;

  const AppPrimaryButton({
    super.key,
    required this.onPressed,
    this.text = '',
    this.child,
    this.color,
    this.textColor,
    this.fullWidth = true,
    this.height = 55,
    this.borderRadius = 16,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? context.colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 2,
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : child ??
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor ?? Colors.white,
                    ),
                  ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool autofocus;
  final Color? fillColor;
  final BorderSide? borderSide;

  const AppTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.fillColor,
    this.borderSide,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputDecorationTheme = theme.inputDecorationTheme;

    // Standard Reference Color from NewPasswordPage: Color(0xFFF8F9FB)
    // The Container wrapper is removed to rely on InputDecoration for correct filling and borders.
    // If borderSide is provided, we can use 'enabledBorder' / 'focusedBorder' overrides with that side.
    // But typically we should rely on the theme's borders.
    // To support `borderSide` param, we can construct the OutlineInputBorder locally.

    final effectiveColor =
        fillColor ?? inputDecorationTheme.fillColor ?? const Color(0xFFF8F9FB);
    // Using 0xFFF8F9FB as hard fallback if theme doesn't have it, though theme should be updated.

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onTap: onTap,
      readOnly: readOnly,
      autofocus: autofocus,
      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: effectiveColor,
        filled: true, // Always filled as per design
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        enabledBorder: borderSide != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: borderSide!,
              )
            : null, // Fallback to theme
        focusedBorder: borderSide != null
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: borderSide!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              )
            : null, // Fallback to theme
      ),
    );
  }
}

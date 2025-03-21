import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const DefaultButtonWidget({
    super.key,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) {
            return backgroundColor?.withValues(alpha: 0.5);
          } else {
            return backgroundColor;
          }
        }),
        foregroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) {
            return textColor?.withValues(alpha: 0.5);
          } else {
            return textColor;
          }
        }),
        padding: WidgetStatePropertyAll(padding),
      ),
      child: Text(text ?? ''),
    );
  }
}

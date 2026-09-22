import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// A compact "build: passing" style badge, echoing the little status
/// chips GitHub Actions shows on a repo README.
class StatusBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color dotColor;

  const StatusBadge({
    super.key,
    required this.label,
    required this.value,
    this.dotColor = AppColors.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.line),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: 7),
          Text('$label: ', style: AppText.mono(context, size: 12, color: AppColors.textMuted)),
          Text(value, style: AppText.mono(context, size: 12, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionShell extends StatelessWidget {
  final GlobalKey sectionKey;
  final String jobName;
  final String title;
  final Widget child;
  final double maxWidth;

  const SectionShell({
    super.key,
    required this.sectionKey,
    required this.jobName,
    required this.title,
    required this.child,
    this.maxWidth = 760,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < Breakpoints.compact;
    return Container(
      key: sectionKey,
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: EdgeInsets.symmetric(vertical: isCompact ? 48 : 72),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(jobName, style: AppText.mono(context, size: 13, color: AppColors.accent)),
              const SizedBox(width: 10),
              Expanded(child: Container(height: 1, color: AppColors.line)),
            ],
          ),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          SizedBox(height: isCompact ? 24 : 32),
          child,
        ],
      ),
    );
  }
}

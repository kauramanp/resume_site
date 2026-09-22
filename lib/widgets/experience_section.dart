import 'package:flutter/material.dart';
import '../data/resume_data.dart';
import '../models/resume_models.dart';
import '../theme/app_theme.dart';
import 'section_shell.dart';

class ExperienceSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ExperienceSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: sectionKey,
      jobName: 'build',
      title: 'Experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < resumeData.experience.length; i++)
            _ExperienceEntry(
              item: resumeData.experience[i],
              isLast: i == resumeData.experience.length - 1,
            ),
        ],
      ),
    );
  }
}

class _ExperienceEntry extends StatelessWidget {
  final ExperienceItem item;
  final bool isLast;
  const _ExperienceEntry({required this.item, required this.isLast});

  static const _railWidth = 29.0; // space reserved for dot + connecting line
  static const _dotSize = 9.0;

  @override
  Widget build(BuildContext context) {
    // A Stack rather than IntrinsicHeight: the connecting line is
    // Positioned with top+bottom, so it always stretches to match
    // however tall the text content on the right turns out to be,
    // instead of relying on an estimated intrinsic height that can
    // fall short when bullet text wraps to more lines than expected.
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left: (_dotSize - 1.4) / 2,
            top: _dotSize + 6,
            bottom: 0,
            child: Container(width: 1.4, color: AppColors.line),
          ),
        Positioned(
          left: 0,
          top: 6,
          child: Container(
            width: _dotSize,
            height: _dotSize,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.accent),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _railWidth, bottom: isLast ? 0 : 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.role, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 17)),
              const SizedBox(height: 2),
              Text(item.company, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.accent, fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text(item.period, style: AppText.mono(context, size: 12.5, color: AppColors.textFaint)),
              const SizedBox(height: 14),
              for (final point in item.highlights)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text('▸', style: TextStyle(color: AppColors.textFaint, fontSize: 13)),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(point, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15)),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

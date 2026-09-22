import 'package:flutter/material.dart';
import '../data/resume_data.dart';
import '../theme/app_theme.dart';
import 'section_shell.dart';

class SkillsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const SkillsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: sectionKey,
      jobName: 'dependencies',
      title: 'Skills',
      maxWidth: 820,
      child: Wrap(
        spacing: 28,
        runSpacing: 28,
        children: [
          for (final group in resumeData.skills) _SkillGroupCard(category: group.category, items: group.items),
        ],
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  final String category;
  final List<String> items;
  const _SkillGroupCard({required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14.5)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final item in items)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(color: AppColors.line),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(item, style: AppText.mono(context, size: 12.5, color: AppColors.textPrimary, weight: FontWeight.w400)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

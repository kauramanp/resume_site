import 'package:flutter/material.dart';
import '../data/resume_data.dart';
import '../theme/app_theme.dart';
import 'section_shell.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const AboutSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: sectionKey,
      jobName: 'checkout',
      title: 'About',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(resumeData.summary, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 40),
          Text('Community & leadership', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          for (final item in resumeData.community)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8, right: 12),
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.label, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.textPrimary, fontSize: 15.5)),
                        const SizedBox(height: 2),
                        Text(item.detail, style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 24),
          Text('Education', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 16),
          for (final edu in resumeData.education)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(edu.degree, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15.5)),
                        const SizedBox(height: 2),
                        Text(edu.institution, style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(edu.year, style: AppText.mono(context, size: 13, color: AppColors.textFaint)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

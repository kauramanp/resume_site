import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/resume_data.dart';
import '../models/resume_models.dart';
import '../theme/app_theme.dart';
import 'section_shell.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ProjectsSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      sectionKey: sectionKey,
      jobName: 'release',
      title: 'Projects',
      child: Column(
        children: [
          for (var i = 0; i < resumeData.projects.length; i++) ...[
            _ProjectCard(project: resumeData.projects[i]),
            if (i != resumeData.projects.length - 1) const SizedBox(height: 20),
          ],
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectItem project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(project.name, style: Theme.of(context).textTheme.titleLarge),
              ),
              if (project.linkUrl != null)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launchUrl(Uri.parse(project.linkUrl!)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          project.linkLabel ?? 'View',
                          style: const TextStyle(color: AppColors.accent, fontSize: 13.5, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.north_east_rounded, size: 14, color: AppColors.accent),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(project.tagline, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.accentAmber)),
          const SizedBox(height: 14),
          Text(project.description, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15)),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in project.tags)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceAlt,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(tag, style: AppText.mono(context, size: 11.5, color: AppColors.textMuted, weight: FontWeight.w400)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

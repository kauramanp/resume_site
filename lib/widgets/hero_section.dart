import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/resume_data.dart';
import '../theme/app_theme.dart';
import 'status_badge.dart';
import 'terminal_typer.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final VoidCallback onExploreTap;

  const HeroSection({super.key, required this.sectionKey, required this.onExploreTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < Breakpoints.compact;
    return Container(
      key: sectionKey,
      constraints: const BoxConstraints(maxWidth: 760),
      padding: EdgeInsets.only(top: isCompact ? 28 : 48, bottom: isCompact ? 40 : 56),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              StatusBadge(label: 'build', value: 'passing'),
              StatusBadge(label: 'deployed', value: 'github pages', dotColor: AppColors.accentAmber),
            ],
          ),
          SizedBox(height: isCompact ? 24 : 32),
          Text(
            resumeData.name,
            style: (isCompact
                    ? Theme.of(context).textTheme.displayMedium
                    : Theme.of(context).textTheme.displayLarge)
                ?.copyWith(fontSize: isCompact ? 38 : null),
          ),
          const SizedBox(height: 10),
          Text(resumeData.role, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.accent)),
          const SizedBox(height: 4),
          Text(resumeData.location, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: isCompact ? 28 : 36),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.line),
            ),
            child: TerminalTyper(lines: resumeData.terminalIntroLines),
          ),
          SizedBox(height: isCompact ? 24 : 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _PrimaryButton(label: 'Download resume', onTap: () => launchUrl(Uri.base.resolve('resume.pdf'))),
              _SecondaryButton(label: 'GitHub', onTap: () => launchUrl(Uri.parse(resumeData.githubUrl))),
              _SecondaryButton(label: 'LinkedIn', onTap: () => launchUrl(Uri.parse(resumeData.linkedinUrl))),
              _SecondaryButton(label: 'Explore sections', onTap: onExploreTap),
            ],
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          decoration: BoxDecoration(color: AppColors.accent, borderRadius: BorderRadius.circular(8)),
          child: Text(label, style: Theme.of(context).textTheme.labelLarge),
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SecondaryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.line),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

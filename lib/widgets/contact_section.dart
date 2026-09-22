import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/resume_data.dart';
import '../models/resume_models.dart';
import '../theme/app_theme.dart';
import 'section_shell.dart';

class ContactSection extends StatelessWidget {
  final GlobalKey sectionKey;
  const ContactSection({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    final channels = [
      ContactChannel(command: 'mail', value: resumeData.email, url: 'mailto:${resumeData.email}'),
      ContactChannel(command: 'open', value: resumeData.githubUrl, url: resumeData.githubUrl),
      ContactChannel(command: 'open', value: resumeData.linkedinUrl, url: resumeData.linkedinUrl),
      ContactChannel(command: 'cd', value: resumeData.location),
    ];

    return SectionShell(
      sectionKey: sectionKey,
      jobName: 'notify',
      title: 'Contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Open to new opportunities — here's how to reach me.",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 28),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final channel in channels)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MouseRegion(
                      cursor: channel.url != null ? SystemMouseCursors.click : MouseCursor.defer,
                      child: GestureDetector(
                        onTap: channel.url == null ? null : () => launchUrl(Uri.parse(channel.url!)),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: r'$ ', style: AppText.mono(context, color: AppColors.textFaint)),
                              TextSpan(text: '${channel.command} ', style: AppText.mono(context, color: AppColors.accent)),
                              TextSpan(
                                text: channel.value,
                                style: AppText.mono(
                                  context,
                                  color: channel.url != null ? AppColors.textPrimary : AppColors.textMuted,
                                  weight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Container(height: 1, color: AppColors.line),
          const SizedBox(height: 20),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              Text('Built with Flutter, deployed with GitHub Actions.', style: AppText.mono(context, size: 12, color: AppColors.textFaint)),
              Text('© ${DateTime.now().year} ${resumeData.name}', style: AppText.mono(context, size: 12, color: AppColors.textFaint)),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

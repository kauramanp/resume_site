import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/resume_data.dart';
import '../theme/app_theme.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/workflow_rail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  late final List<GlobalKey> _sectionKeys = List.generate(pipelineJobs.length, (_) => GlobalKey());
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    const threshold = 170.0;
    var newIndex = _activeIndex;
    for (var i = 0; i < _sectionKeys.length; i++) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      final dy = box.localToGlobal(Offset.zero).dy;
      if (dy <= threshold) newIndex = i;
    }
    if (newIndex != _activeIndex) setState(() => _activeIndex = newIndex);
  }

  void _goToSection(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeInOutCubic,
      alignment: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.sizeOf(context).width >= Breakpoints.rail;

    final content = SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeroSection(sectionKey: _heroKey, onExploreTap: () => _goToSection(0)),
            AboutSection(sectionKey: _sectionKeys[0]),
            SkillsSection(sectionKey: _sectionKeys[1]),
            ExperienceSection(sectionKey: _sectionKeys[2]),
            ProjectsSection(sectionKey: _sectionKeys[3]),
            ContactSection(sectionKey: _sectionKeys[4]),
          ],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          _TopBar(isWide: isWide),
          if (!isWide)
            Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: AppColors.line)),
              ),
              child: WorkflowStrip(jobs: pipelineJobs, activeIndex: _activeIndex, onSelect: _goToSection),
            ),
          Expanded(
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 280,
                        padding: const EdgeInsets.only(left: 32, top: 56),
                        child: WorkflowRail(jobs: pipelineJobs, activeIndex: _activeIndex, onSelect: _goToSection),
                      ),
                      Expanded(child: content),
                    ],
                  )
                : content,
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  final bool isWide;
  const _TopBar({required this.isWide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isWide ? 32 : 20, vertical: 18),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          Text('amanpreet-kaur', style: AppText.mono(context, size: 13, color: AppColors.textPrimary)),
          Text('/resume', style: AppText.mono(context, size: 13, color: AppColors.textFaint)),
          const Spacer(),
          _IconLink(tooltip: 'GitHub', icon: Icons.code_rounded, url: resumeData.githubUrl),
          const SizedBox(width: 16),
          _IconLink(tooltip: 'LinkedIn', icon: Icons.business_center_outlined, url: resumeData.linkedinUrl),
          const SizedBox(width: 16),
          _IconLink(tooltip: 'Email', icon: Icons.mail_outline_rounded, url: 'mailto:${resumeData.email}'),
        ],
      ),
    );
  }
}

class _IconLink extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final String url;
  const _IconLink({required this.tooltip, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse(url)),
          child: Icon(icon, size: 19, color: AppColors.textMuted),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/resume_models.dart';
import '../theme/app_theme.dart';

/// Vertical rail of connected nodes, one per [PipelineJob] — a literal
/// small workflow graph that also functions as page navigation. The
/// active node fills solid and pulses gently; the rest stay outlined.
class WorkflowRail extends StatelessWidget {
  final List<PipelineJob> jobs;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  const WorkflowRail({
    super.key,
    required this.jobs,
    required this.activeIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < jobs.length; i++)
          _RailNode(
            job: jobs[i],
            isActive: i == activeIndex,
            isPast: i < activeIndex,
            isLast: i == jobs.length - 1,
            onTap: () => onSelect(i),
          ),
      ],
    );
  }
}

class _RailNode extends StatelessWidget {
  final PipelineJob job;
  final bool isActive;
  final bool isPast;
  final bool isLast;
  final VoidCallback onTap;

  const _RailNode({
    required this.job,
    required this.isActive,
    required this.isPast,
    required this.isLast,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final nodeColor = (isActive || isPast) ? AppColors.accent : AppColors.textFaint;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: isActive ? 12 : 9,
                    height: isActive ? 12 : 9,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? AppColors.accent : Colors.transparent,
                      border: Border.all(color: nodeColor, width: 1.6),
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 1.4,
                      height: 38,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      color: isPast ? AppColors.accent.withValues(alpha: 0.5) : AppColors.line,
                    ),
                ],
              ),
              const SizedBox(width: 14),
              Padding(
                padding: const EdgeInsets.only(top: 1, bottom: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.jobName,
                      style: AppText.mono(
                        context,
                        size: 12,
                        color: isActive ? AppColors.accent : AppColors.textFaint,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      job.sectionTitle,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: isActive ? AppColors.textPrimary : AppColors.textMuted,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Horizontal, scrollable equivalent of [WorkflowRail] for narrow
/// viewports, shown as a strip of dots under the top bar.
class WorkflowStrip extends StatelessWidget {
  final List<PipelineJob> jobs;
  final int activeIndex;
  final ValueChanged<int> onSelect;

  const WorkflowStrip({
    super.key,
    required this.jobs,
    required this.activeIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          for (var i = 0; i < jobs.length; i++) ...[
            _StripNode(job: jobs[i], isActive: i == activeIndex, onTap: () => onSelect(i)),
            if (i != jobs.length - 1)
              Container(width: 20, height: 1.4, color: AppColors.line, margin: const EdgeInsets.symmetric(horizontal: 4)),
          ],
        ],
      ),
    );
  }
}

class _StripNode extends StatelessWidget {
  final PipelineJob job;
  final bool isActive;
  final VoidCallback onTap;

  const _StripNode({required this.job, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Container(
            width: isActive ? 10 : 8,
            height: isActive ? 10 : 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppColors.accent : Colors.transparent,
              border: Border.all(color: isActive ? AppColors.accent : AppColors.textFaint, width: 1.4),
            ),
          ),
          const SizedBox(width: 7),
          Text(
            job.jobName,
            style: AppText.mono(context, size: 12, color: isActive ? AppColors.accent : AppColors.textFaint),
          ),
        ],
      ),
    );
  }
}

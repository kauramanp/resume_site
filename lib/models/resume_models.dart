/// A single position held, rendered in the "build" (experience) section.
class ExperienceItem {
  final String role;
  final String company;
  final String period;
  final List<String> highlights;

  const ExperienceItem({
    required this.role,
    required this.company,
    required this.period,
    required this.highlights,
  });
}

/// A shipped project, rendered in the "release" (projects) section.
class ProjectItem {
  final String name;
  final String tagline;
  final String description;
  final List<String> tags;
  final String? linkLabel;
  final String? linkUrl;

  const ProjectItem({
    required this.name,
    required this.tagline,
    required this.description,
    required this.tags,
    this.linkLabel,
    this.linkUrl,
  });
}

/// A category of skills, rendered as a group of pills in the
/// "dependencies" (skills) section.
class SkillGroup {
  final String category;
  final List<String> items;

  const SkillGroup({required this.category, required this.items});
}

/// A single line of contact info, rendered in the "notify" (contact)
/// section — modeled as a shell command a visitor could "run".
class ContactChannel {
  final String command; // e.g. "mail"
  final String value; // e.g. "you@example.com"
  final String? url; // tapped target, e.g. mailto:/tel:/https:

  const ContactChannel({required this.command, required this.value, this.url});
}

/// One line of community / leadership involvement.
class CommunityItem {
  final String label;
  final String detail;

  const CommunityItem({required this.label, required this.detail});
}

/// One line of formal education.
class EducationItem {
  final String degree;
  final String institution;
  final String year;

  const EducationItem({
    required this.degree,
    required this.institution,
    required this.year,
  });
}

/// A pipeline "job" in the left-hand workflow rail — doubles as an
/// in-page navigation entry and a small piece of GitHub Actions
/// vocabulary (checkout, dependencies, build, release, notify).
class PipelineJob {
  final String id; // used as the section anchor / GlobalKey lookup
  final String jobName; // shown in monospace, like a workflow job id
  final String sectionTitle; // shown as the human-readable heading

  const PipelineJob({
    required this.id,
    required this.jobName,
    required this.sectionTitle,
  });
}

/// The full set of content the site renders. Everything a student needs
/// to change to make this their own resume lives in [ResumeData] —
/// see lib/data/resume_data.dart.
class ResumeData {
  final String name;
  final String role;
  final String location;
  final String email;
  final String githubUrl;
  final String linkedinUrl;
  final String summary;
  final List<String> terminalIntroLines;
  final List<SkillGroup> skills;
  final List<ExperienceItem> experience;
  final List<ProjectItem> projects;
  final List<CommunityItem> community;
  final List<EducationItem> education;

  const ResumeData({
    required this.name,
    required this.role,
    required this.location,
    required this.email,
    required this.githubUrl,
    required this.linkedinUrl,
    required this.summary,
    required this.terminalIntroLines,
    required this.skills,
    required this.experience,
    required this.projects,
    required this.community,
    required this.education,
  });
}

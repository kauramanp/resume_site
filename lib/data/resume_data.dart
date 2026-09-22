import '../models/resume_models.dart';

/// ---------------------------------------------------------------------
/// EDIT ME
/// ---------------------------------------------------------------------
/// This is the only file you need to touch to turn this into *your*
/// resume site. Replace the values below with your own details, drop
/// your own PDF at web/resume.pdf, and push — the GitHub Actions
/// workflow in .github/workflows/deploy.yml takes care of the rest.
/// ---------------------------------------------------------------------
final resumeData = ResumeData(
  name: 'Amanpreet Kaur',
  role: 'Senior Android Developer',
  location: 'Jalandhar, Punjab, India',
  email: 'kauramanp1808@gmail.com',
  githubUrl: 'https://github.com/kauramanp',
  linkedinUrl: 'https://www.linkedin.com/in/kauramanp/',
  summary:
      'Senior Android Developer with 8+ years of experience shipping scalable, '
      'high-performance consumer mobile applications using Kotlin and Java. '
      'Proven track record of delivering greenfield products end-to-end — from '
      'architecture decisions to Play Store release. Deep expertise in modern '
      'Android stacks (Jetpack Compose, MVVM/Clean Architecture, Coroutines, '
      'Hilt) and hands-on experience integrating real-time data, IoT/BLE '
      'hardware, payments, and Firebase services. Comfortable ramping fast in '
      'unfamiliar territory — extended skills to Flutter/Dart and iOS patterns.',
  terminalIntroLines: [
    r'$ whoami',
    'Amanpreet Kaur — Senior Android Developer',
    r'$ git log -1 --format="%s"',
    '8+ years shipping Kotlin & Flutter apps, greenfield to Play Store',
    r'$ echo $STATUS',
    'available for new opportunities',
  ],
  skills: [
    SkillGroup(category: 'Languages', items: ['Kotlin', 'Java', 'Dart (Flutter)']),
    SkillGroup(
      category: 'Android',
      items: [
        'Android SDK',
        'Jetpack Compose',
        'ViewModel',
        'LiveData',
        'Navigation',
        'Room',
        'Material Design 3',
        'XML Layouts',
      ],
    ),
    SkillGroup(
      category: 'Architecture',
      items: ['MVVM', 'Clean Architecture', 'Multi-Module Architecture', 'Repository Pattern'],
    ),
    SkillGroup(category: 'Async', items: ['Kotlin Coroutines', 'Flow', 'RxJava']),
    SkillGroup(
      category: 'Networking',
      items: ['Retrofit', 'OkHttp', 'REST APIs', 'GraphQL', 'JSON / Gson / Moshi'],
    ),
    SkillGroup(category: 'Dependency Injection', items: ['Hilt', 'Dagger2']),
    SkillGroup(
      category: 'Database',
      items: ['Room', 'SQLite', 'DataStore', 'SharedPreferences', 'Secure Storage'],
    ),
    SkillGroup(
      category: 'Firebase',
      items: ['FCM Push Notifications', 'Analytics', 'Crashlytics', 'Auth', 'Realtime Database', 'Cloud Storage'],
    ),
    SkillGroup(
      category: 'BLE / IoT',
      items: ['Bluetooth Low Energy', 'GATT Services & Characteristics', 'Device Pairing / Bonding', 'Real-time Device Communication'],
    ),
    SkillGroup(category: 'Background Work', items: ['WorkManager', 'Services', 'Broadcast Receivers']),
    SkillGroup(category: 'Testing', items: ['JUnit', 'MockK', 'Espresso', 'Compose UI Testing']),
    SkillGroup(
      category: 'CI/CD & Tools',
      items: ['Git', 'GitHub Actions', 'Play Console', 'Android Studio', 'Agile / Scrum'],
    ),
    SkillGroup(
      category: 'Other',
      items: [
        'Deep Linking',
        'In-App Purchases',
        'Push Notifications',
        'Performance & Memory Optimization',
        'Battery Optimization',
        'Socket Programming',
        'Accessibility',
      ],
    ),
  ],
  experience: [
    ExperienceItem(
      role: 'Android Developer',
      company: 'Intellisense Technology',
      period: 'Aug 2024 — Feb 2026',
      highlights: [
        'Owned end-to-end development of SafeGuard360, a smart city safety platform connecting citizens, municipal operators, and IoT infrastructure — built emergency alerting, live incident mapping, patrol management, fleet tracking, and camera feed integration into a single modular Android app.',
        'Implemented Bluetooth Low Energy (BLE) and IoT device integration (cameras, sensors, smart lighting) using GATT services, device discovery, pairing/bonding, and bidirectional real-time data synchronisation across diverse Android device models.',
        'Sole developer of TOPSY, a full ride-booking platform — built both the driver and customer Android apps independently, covering ride discovery, real-time tracking, in-app payments, GPS navigation, and digital wallet payouts.',
        'Reduced production crashes and ANRs through proactive monitoring via Firebase Crashlytics and Play Console; coordinated incident triage and hotfix deployments, improving post-release stability.',
        'Maintained 80%+ unit test coverage on critical flows using JUnit and MockK; implemented Compose UI tests to safeguard key user journeys.',
        'Led release validation and rollback strategies for high-stakes production deployments, ensuring zero-downtime releases.',
      ],
    ),
    ExperienceItem(
      role: 'Mobile Application Developer',
      company: 'O7 Solutions',
      period: 'Aug 2020 — Jul 2024',
      highlights: [
        'Delivered multiple high-traffic e-commerce and fintech Android applications serving millions of users, handling secure payments, wallet/recharge workflows, and real-time order tracking.',
        'Integrated mobile apps with enterprise backend systems via API gateways (APIM), implementing OAuth 2.0 authentication, encrypted local storage, and RESTful API layers with Retrofit and OkHttp.',
        'Drove a full codebase migration from legacy Java to Kotlin/Coroutines/Flow, reducing async complexity and improving performance; maintained backward compatibility across Android OS 6.0–14.',
        'Coordinated release strategy across mobile, backend, QA, and product teams for major product initiatives, consistently hitting milestone dates in Agile/Scrum sprints.',
        'Implemented Firebase Analytics and event tracking pipelines, providing product teams with actionable behavioural data to drive roadmap decisions.',
      ],
    ),
    ExperienceItem(
      role: 'Android Developer',
      company: 'Beebo IT Solutions Pvt. Ltd',
      period: 'May 2019 — Jul 2020',
      highlights: [
        'Solely designed and shipped a complete taxi booking platform — built both the driver and customer Android apps from scratch as the only developer on the project.',
        'Customer app covered ride discovery, real-time driver tracking, booking and scheduling, and in-app payments; driver app covered live ride matching, GPS navigation, earnings dashboard, and trip history.',
        'Built with Kotlin + MVVM, socket-based real-time communication, Firebase push notifications, and the Google Maps SDK.',
      ],
    ),
    ExperienceItem(
      role: 'Android Developer',
      company: 'Corevein Technology',
      period: 'Nov 2017 — Apr 2019',
      highlights: [
        'Developed Android applications interfacing with electronic devices and embedded systems via Bluetooth Classic and BLE, building foundational expertise in hardware–software communication that became a career specialisation.',
      ],
    ),
  ],
  projects: [
    ProjectItem(
      name: 'SafeGuard360',
      tagline: 'Smart city safety platform',
      description:
          'Connects citizens, municipal operators, and IoT infrastructure into a single Android app. '
          'Built a real-time emergency alert system with geolocation, a live interactive incident map, '
          'BLE/IoT device integration (cameras, sensors, smart lighting), and role-based dashboards for '
          'citizens, patrol teams, and city administrators. Architected modular features including '
          'SecureDrive (fleet tracking), GuardSense (patrol management), SafeVision (camera feeds), and '
          'SafeCommunity (neighbourhood watch). Sole Android owner from greenfield to Play Store release.',
      tags: ['Kotlin', 'BLE/IoT', 'Jetpack Compose', 'Firebase', 'Maps'],
      linkLabel: 'View on Play Store',
      linkUrl: 'https://play.google.com',
    ),
    ProjectItem(
      name: 'TOPSY',
      tagline: 'Ride & food booking platform — driver + customer apps',
      description:
          'Sole developer of both the driver and customer Android apps for a live ride-booking platform. '
          'Customer app: ride discovery, real-time driver tracking, booking flows, in-app payments. Driver '
          'app: live ride matching, GPS navigation, trip management, digital wallet payouts. Built with '
          'Kotlin + MVVM, socket-based real-time communication, Firebase push notifications, and the '
          'Google Maps SDK. Both apps independently shipped to the Play Store.',
      tags: ['Kotlin', 'MVVM', 'Sockets', 'Firebase', 'Google Maps SDK'],
      linkLabel: 'View on Play Store',
      linkUrl: 'https://play.google.com',
    ),
  ],
  community: [
    CommunityItem(label: 'GDG Jalandhar', detail: 'Organiser & Event Lead, Google Developer Groups'),
    CommunityItem(label: 'Women Techmakers', detail: 'Ambassador, Technovation — since July 2023'),
    CommunityItem(label: 'Google I/O Extended Jalandhar 2023', detail: 'Speaker — Flutter/Dart'),
    CommunityItem(label: 'Hackathon Mentor', detail: 'Jalandhar, Chandigarh, Ghaziabad'),
  ],
  education: [
    EducationItem(degree: 'Master of Computer Applications (MCA)', institution: 'Punjab Technical University, Kapurthala', year: '2017'),
    EducationItem(degree: 'Bachelor of Computer Applications (BCA)', institution: 'Guru Nanak Dev University, Amritsar', year: '2014'),
  ],
);

/// The workflow "jobs" that make up the page — this list drives both the
/// side navigation rail and the section order. The job ids double as
/// GitHub-Actions-style vocabulary, on theme for the site.
const pipelineJobs = [
  PipelineJob(id: 'about', jobName: 'checkout', sectionTitle: 'About'),
  PipelineJob(id: 'skills', jobName: 'dependencies', sectionTitle: 'Skills'),
  PipelineJob(id: 'experience', jobName: 'build', sectionTitle: 'Experience'),
  PipelineJob(id: 'projects', jobName: 'release', sectionTitle: 'Projects'),
  PipelineJob(id: 'contact', jobName: 'notify', sectionTitle: 'Contact'),
];

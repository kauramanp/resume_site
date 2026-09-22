import 'package:flutter/material.dart';
import 'data/resume_data.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${resumeData.name} — ${resumeData.role}',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(context),
      home: const HomeScreen(),
    );
  }
}

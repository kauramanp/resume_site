import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_site/data/resume_data.dart';
import 'package:resume_site/main.dart';

void main() {
  // The test sandbox has no network access, so stop google_fonts from
  // trying to fetch font files at runtime — it falls back to the
  // platform default instead, which is all a layout test needs.
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('renders the hero section with name and role', (tester) async {
    await tester.pumpWidget(const ResumeApp());

    // The terminal intro types itself out with a repeating cursor
    // animation, so avoid pumpAndSettle (it would never settle) and
    // just advance a few frames instead.
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text(resumeData.name), findsOneWidget);
    expect(find.text(resumeData.role), findsOneWidget);
    // A layout overflow throws during the pump above and fails the test,
    // so reaching this line already covers the most common regression —
    // this assertion just double-checks nothing rendered on top of it.
    expect(tester.takeException(), isNull);
  });
}

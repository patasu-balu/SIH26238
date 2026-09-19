import 'package:flutter_test/flutter_test.dart';
import 'package:tribal_scholar/app.dart';

void main() {
  testWidgets('Student Dashboard UI smoke test', (WidgetTester tester) async {
    // Build app and trigger a frame
    await tester.pumpWidget(const TribalScholarApp());

    // Verify App Bar Title
    expect(find.text('TribalScholar'), findsWidgets);

    // Verify Student Profile & Welcome text
    expect(find.text('Welcome back 👋'), findsOneWidget);
    expect(find.text('Reshmen'), findsOneWidget);
    expect(find.text('ST Student'), findsOneWidget);

    // Verify Application Status section
    expect(find.text('Post-Matric Scholarship'), findsOneWidget);
    expect(find.text('Under Verification'), findsOneWidget);

    // Verify Bottom Navigation Labels
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Scholarships'), findsWidgets);
    expect(find.text('Track'), findsOneWidget);
    expect(find.text('Documents'), findsOneWidget);
    expect(find.text('Profile'), findsWidgets);
  });
}

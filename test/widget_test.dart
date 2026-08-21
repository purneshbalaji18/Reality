import 'package:flutter_test/flutter_test.dart';
import 'package:antigravity/main.dart';

void main() {
  testWidgets('Antigravity app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AntigravityApp());

    // Verify that the title text is rendered
    expect(find.text('ANTIGRAVITY'), findsOneWidget);
  });
}

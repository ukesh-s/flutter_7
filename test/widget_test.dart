import 'package:flutter_test/flutter_test.dart';
import 'package:experiment_7/main.dart';

void main() {
  testWidgets('shows simulated employee records and entry fields', (tester) async {
    await tester.pumpWidget(const DemoApp());
    expect(find.text('Employee Records'), findsOneWidget);
    expect(find.text('Demo mode — no Firebase connection'), findsOneWidget);
    expect(find.text('Jordan Lee'), findsOneWidget);
    expect(find.text('Add employee'), findsOneWidget);
  });
}

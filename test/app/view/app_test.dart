import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_best_practices_bloc/app/app.dart';
import 'package:flutter_best_practices_bloc/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}

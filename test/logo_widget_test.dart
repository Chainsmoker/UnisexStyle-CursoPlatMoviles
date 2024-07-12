import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aa3_consumo_api/widgets/logo.dart';

void main() {
  testWidgets('UnisexStyleWidget displays correct text and color', (WidgetTester tester) async {
    const Color testColor = Colors.red;

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: UnisexStyleWidget(
            textColor: testColor,
          ),
        ),
      ),
    );

    expect(find.text('UnisexStyle'), findsOneWidget);
    expect(find.text('Fashion for all'), findsOneWidget);

    final textUnisexStyle = tester.widget<Text>(find.text('UnisexStyle'));
    final textFashionForAll = tester.widget<Text>(find.text('Fashion for all'));

    expect(textUnisexStyle.style?.color, testColor);
    expect(textFashionForAll.style?.color, testColor);
  });
}

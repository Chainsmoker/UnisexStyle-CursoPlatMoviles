import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:aa3_consumo_api/widgets/product_card.dart';

void main() {
  testWidgets('ProductCard renders correctly', (WidgetTester tester) async {
    const Key testKey = Key('product_card');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductCard(
            key: testKey,
            imageUrl: 'https://www.thomas.com.pe/media/catalog/product/t/h/th-25n_1_1.jpg',
            category: 'Test Category',
            productName: 'Test Product',
            initialRating: 3.5,
            onRatingUpdate: (rating) {},
          ),
        ),
      ),
    );

    expect(find.byType(CachedNetworkImage), findsOneWidget);
    expect(find.text('Test Category'), findsOneWidget);
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.byType(RatingBar), findsOneWidget);
    final ratingBar = tester.widget<RatingBar>(find.byType(RatingBar));
    expect(ratingBar.initialRating, 3.5);
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });
}

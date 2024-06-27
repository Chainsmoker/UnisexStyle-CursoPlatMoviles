import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String category;
  final String productName;
  final double initialRating;
  final Function(double)? onRatingUpdate;

  const ProductCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.productName,
    this.initialRating = 0.0,
    this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 400,
        padding: const EdgeInsets.all(10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: 150,
              height: 100,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 14),
            Text(
              category,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        productName,
                        style: const TextStyle(fontSize: 15, fontFamily: 'Kanit'),
                      ),
                      RatingBar(
                        initialRating: initialRating,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 13,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: Colors.amber),
                          half: const Icon(Icons.star_half, color: Colors.amber),
                          empty: const Icon(Icons.star_border, color: Colors.amber),
                        ),
                        onRatingUpdate: onRatingUpdate ?? (rating) {
                          print('Rating is: $rating');
                        },
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.shopping_cart, color: Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

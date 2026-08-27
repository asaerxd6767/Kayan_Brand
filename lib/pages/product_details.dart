import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/models/product_model.dart';
import '../core/widgets/app_bar.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  const ProductDetails({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void onFavoriteTap() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteTap();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    Widget headLine(String message) =>
        Text(message.toUpperCase(), style: textTheme.titleLarge);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: KayanAppBar(textTheme: textTheme),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(widget.product.image),

            Container(
              padding: EdgeInsets.all(KayanSpacing.md),
              child: Column(
                spacing: 15,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(widget.product.category, style: textTheme.bodySmall),
                      Text(
                        '\$${widget.product.price}',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),

                  Text(widget.product.name, style: textTheme.headlineMedium),

                  // TODO: Put the size
                  SizedBox(height: KayanSpacing.lg),
                  // description
                  headLine('fit description'),
                  Text(widget.product.description),

                  headLine('fabric and care'),
                  Text(widget.product.fabricCare),

                  // TODO: Implement on cart screen
                  Row(
                    spacing: 10,
                    children: [
                      GestureDetector(
                        onTap: onFavoriteTap,
                        child: Container(
                          padding: EdgeInsets.all(KayanSpacing.sm),
                          decoration: BoxDecoration(
                            color: colorTheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: isFavorite
                              ? Icon(Icons.favorite)
                              : Icon(Icons.favorite_border),
                        ),
                      ),

                      Expanded(
                        child: ElevatedButton(
                          // TODO: Implement the code to add to the cart
                          onPressed: () {},
                          child: Text('add to cart'.toUpperCase()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

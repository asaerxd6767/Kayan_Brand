import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/responsive.dart';
import 'package:local_brand/core/widgets/kayan_network_image.dart';
import 'package:local_brand/managers/product_manager.dart';
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

  Widget _detailsBlock() {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    Widget headLine(String message) =>
        Text(message.toUpperCase(), style: textTheme.titleLarge);

    return Container(
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

          ListenableBuilder(
            listenable: ProductManager.instance,
            builder: (context, _) {
              final manager = ProductManager.instance;
              final isInCart = manager.isInCart(widget.product);
              return Row(
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
                      onPressed: isInCart
                          ? null
                          : () {
                              manager.addToCart(widget.product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${widget.product.name} added to cart',
                                  ),
                                ),
                              );
                            },
                      child: Text('add to cart'.toUpperCase()),
                    ),
                  ),

                  if (isInCart)
                    IconButton(
                      tooltip: 'Remove from cart',
                      onPressed: () {
                        manager.removeFromCart(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${widget.product.name} removed from cart',
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.remove_shopping_cart,
                        color: colorTheme.error,
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: KayanAppBar(textTheme: Theme.of(context).textTheme),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppBreakpoints.desktopContentWidth,
            ),
            child: context.isTablet || context.isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(KayanSpacing.md),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: KayanNetworkImage(
                              url: widget.product.image,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(KayanSpacing.md),
                          child: _detailsBlock(),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: KayanNetworkImage(
                          url: widget.product.image,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      _detailsBlock(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

// Widget tests for the responsive building blocks.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_brand/core/theme/app_theme.dart';
import 'package:local_brand/models/product_model.dart';
import 'package:local_brand/widgets/category_card.dart';
import 'package:local_brand/widgets/product_grid.dart';

final _product = ProductModel(
  id: 1,
  name: 'Obsidian Silk Trench',
  image: 'https://example.com/placeholder.jpg',
  category: 'Outerwear',
  price: 895,
  description: 'A classic obsidian silk trench coat.',
  fabricCare: 'Dry clean only. 100% Premium Silk.',
);

void main() {
  testWidgets('category card renders name, category and price', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: KayanTheme.lightTheme,
        home: Scaffold(
          body: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 200,
              child: CategoryCard(
                product: _product,
                isFavorite: false,
                onFavoriteTap: () {},
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.text('Obsidian Silk Trench'), findsOneWidget);
    expect(find.text('Outerwear'), findsOneWidget);
    expect(find.text('\$895'), findsOneWidget);
  });

  testWidgets('product grid is single column on a phone-width surface', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductGrid(
            itemCount: 2,
            itemBuilder: (context, index) => const SizedBox(),
          ),
        ),
      ),
    );

    final grid = tester.widget<GridView>(
      find.byType(GridView),
    );
    final delegate =
        grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
    expect(delegate.crossAxisCount, 1);
  });

  testWidgets('product grid uses multiple columns on a wide surface', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1000, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ProductGrid(
            itemCount: 6,
            itemBuilder: (context, index) => const SizedBox(),
          ),
        ),
      ),
    );

    final grid = tester.widget<GridView>(
      find.byType(GridView),
    );
    final delegate =
        grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;
    expect(delegate.crossAxisCount, greaterThan(1));
  });

  testWidgets('grid content is horizontally centered inside a wide screen', (
    WidgetTester tester,
  ) async {
    final screen = 1400.0;
    tester.view.physicalSize = Size(screen, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: ProductGrid(
                  itemCount: 6,
                  itemBuilder: (context, index) => const SizedBox(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final gridRect = tester.getRect(find.byType(GridView));
    final center = gridRect.center.dx;
    final expectedCenter = screen / 2;
    // Allow for small layout rounding.
    expect((center - expectedCenter).abs(), lessThan(1.0));
  });
}
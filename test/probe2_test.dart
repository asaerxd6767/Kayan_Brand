import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_brand/widgets/product_grid.dart';

void main() {
  for (final w in [400, 700, 900, 1200, 1500]) {
    testWidgets('probe home-like structure at width $w', (tester) async {
      tester.view.physicalSize = Size(w.toDouble(), 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      final measured = <double>[];
      final measuredCells = <int>[];
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(24),
                constraints: const BoxConstraints(maxWidth: 1200),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const Text('header'),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        measured.add(constraints.maxWidth);
                        return ProductGrid(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return LayoutBuilder(
                              builder: (context, c) {
                                measuredCells.add(c.maxWidth.toInt());
                                return Container(color: Colors.grey);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      debugPrint('WIDTH $w -> gridLayoutWidth=${measured.join(',')} '
          'cellWidths=${measuredCells.take(6).join(',')}');
    });
  }
}
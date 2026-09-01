import 'package:flutter/material.dart';
import 'package:local_brand/core/theme/app_radius.dart';
import 'package:local_brand/core/theme/app_spacing.dart';
import 'package:local_brand/core/utils/app_validators.dart';
import 'package:local_brand/core/utils/responsive.dart';
import 'package:local_brand/core/utils/extenstions/capitalized.dart';
import 'package:local_brand/core/widgets/app_bar.dart';
import 'package:local_brand/widgets/form_field.dart';

import '../widgets/selectable_box.dart';
import '../widgets/sub_image.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _key = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final skuController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final stockController = TextEditingController();
  final descriptionController = TextEditingController();
  final fabricController = TextEditingController();

  String? selectedCategory;
  List<String> selectedSizes = [];
  Color? selectedColor;
  final List<String> _categories = ['T-Shirts', 'Pants', 'Jackets', 'Shoes'];
  final List<String> _sizes = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;

    Widget headLine(String message) => Text(
      message.toUpperCase(),
      style: textTheme.titleSmall?.copyWith(color: colorTheme.secondary),
    );
    Widget subTitle(String message) =>
        Text(message.toCapitalized(), style: textTheme.bodyMedium);

    Widget leftFieldsBlock() => Column(
          spacing: 15,
          crossAxisAlignment: .start,
          children: [
            headLine('basic details'),
            MyTextField(
              hintText: 'product title',
              controller: titleController,
              validate: (value) => AppValidator.importantField(
                value,
                fieldName: 'product title',
              ),
            ),
            MyTextField(
              hintText: 'SKU',
              controller: skuController,
              validate: (value) =>
                  AppValidator.importantField(value, fieldName: 'SKU'),
            ),

            headLine('category'),
            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                spacing: 20,
                children: _categories
                    .map((e) => SelectableBox(message: e))
                    .toList(),
              ),
            ),

            headLine('pricing and inventory'),
            MyTextField(
              hintText: 'regular price',
              prefixIcon: Icon(Icons.attach_money),
              controller: priceController,
              validate: (value) => AppValidator.importantField(
                value,
                fieldName: 'regular price',
              ),
            ),
            MyTextField(
              hintText: 'discount price (optional)',
              prefixIcon: Icon(Icons.attach_money),
              controller: discountController,
              validate: (value) => AppValidator.importantField(
                value,
                fieldName: 'discount price',
              ),
            ),
            MyTextField(
              hintText: 'stock quantity',
              controller: stockController,
              validate: (value) => AppValidator.importantField(
                value,
                fieldName: 'stock quantity',
              ),
            ),
          ],
        );

    Widget rightFieldsBlock() => Column(
          spacing: 15,
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: KayanSpacing.xs),
            headLine('variants'),
            subTitle('available sizes'),
            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                spacing: KayanSpacing.sm,
                children: _sizes
                    .map((e) => SelectableBox(message: e))
                    .toList(),
              ),
            ),

            SizedBox(height: KayanSpacing.lg),
            headLine('details'),
            MyTextField(
              hintText: 'product description',
              controller: descriptionController,
              maxLines: 3,
              validate: (value) => AppValidator.importantField(
                value,
                fieldName: 'product description',
              ),
            ),
            MyTextField(
              hintText: 'fabric and care details',
              controller: fabricController,
              maxLines: 3,
              validate: (value) => AppValidator.importantField(
                value,
                fieldName: 'fabric and care details',
              ),
            ),

            SizedBox(height: KayanSpacing.sm),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    // TODO: Implement success scaffold message and make the product added
                    print('data clear');
                  }
                },
                child: Text(
                  'publish product'.toUpperCase(),
                ),
              ),
            ),
          ],
        );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: KayanAppBar(textTheme: textTheme),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(KayanSpacing.md),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppBreakpoints.desktopContentWidth,
            ),
            child: Form(
              key: _key,
              child: Column(
                spacing: 15,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'product imagery'.toUpperCase(),
                    style: textTheme.titleSmall?.copyWith(
                      color: colorTheme.secondary,
                    ),
                  ),

                  // Main image
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: KayanRadius.borderLg,
                      color: colorTheme.secondaryContainer,
                    ),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Icon(
                          Icons.image_search_rounded,
                          color: colorTheme.secondary,
                        ),
                        Text(
                          'Main image',
                          style: textTheme.titleSmall?.copyWith(
                            color: colorTheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // two images
                  Row(
                    mainAxisAlignment: .spaceAround,
                    spacing: 10,
                    children: [
                      Expanded(child: SubImage()),
                      Expanded(child: SubImage()),
                    ],
                  ),

                  SizedBox(height: KayanSpacing.lg),

                  // On wide screens split the remaining fields into two columns.
                  if (context.isDesktop)
                    LayoutBuilder(
                      builder: (context, constraints) => Row(
                        crossAxisAlignment: .start,
                        spacing: KayanSpacing.lg,
                        children: [
                          SizedBox(
                            width: (constraints.maxWidth - KayanSpacing.lg) / 2,
                            child: leftFieldsBlock(),
                          ),
                          SizedBox(
                            width: (constraints.maxWidth - KayanSpacing.lg) / 2,
                            child: rightFieldsBlock(),
                          ),
                        ],
                      ),
                    )
                  else ...[
                    leftFieldsBlock(),
                    rightFieldsBlock(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

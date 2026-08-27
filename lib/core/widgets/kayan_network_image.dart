import 'package:flutter/material.dart';

class KayanNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const KayanNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          color: colorTheme.secondaryContainer,
          child: const CircularProgressIndicator(),
        );
      },
      errorBuilder: (context, error, stackTrace) => Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        color: colorTheme.secondaryContainer,
        child: Icon(
          Icons.image_not_supported_outlined,
          color: colorTheme.outline,
          size: 50,
        ),
      ),
    );
  }
}

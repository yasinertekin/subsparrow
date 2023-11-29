import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_mem_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// CustomNetworkImage
final class CustomNetworkImage extends StatelessWidget {
  /// Creates a [CustomNetworkImage] instance.
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache = const CustomMemCache(height: 200, width: 200),
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
  });

  /// The image url.
  final String? imageUrl;

  /// When image is not available then it will show empty widget
  final Widget? emptyWidget;

  /// The mem cache of the image.
  final CustomMemCache memCache;

  /// The box fit of the image.
  final BoxFit? boxFit;

  /// The loading widget of the image.
  final Widget? loadingWidget;

  /// The size of the image.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) return const SizedBox.shrink();
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      height: size?.height,
      width: size?.width,
      errorListener: (value) {
        if (kDebugMode) debugPrint('Error in loading image: $value');
      },
      progressIndicatorBuilder: (context, url, progress) {
        return Center(
          child: loadingWidget ?? const CircularProgressIndicator(),
        );
      },
      errorWidget: (_, __, ___) => emptyWidget ?? const SizedBox.shrink(),
      memCacheHeight: memCache.height,
      memCacheWidth: memCache.width,
    );
  }
}

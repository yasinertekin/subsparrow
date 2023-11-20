import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/src/package/custom_image/custom_mem_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    super.key,
    this.imageUrl,
    this.emptyWidget,
    this.memCache = const CustomMemCache(height: 200, width: 200),
    this.boxFit = BoxFit.cover,
    this.loadingWidget,
    this.size,
  });
  final String? imageUrl;

  /// When image is not available then it will show empty widget
  final Widget? emptyWidget;

  final CustomMemCache memCache;

  final BoxFit? boxFit;

  final Widget? loadingWidget;

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

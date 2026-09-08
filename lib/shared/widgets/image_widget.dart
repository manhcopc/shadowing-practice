import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/generated/colors.gen.dart';

class AppImageNetworkWidget extends StatelessWidget {
  final String? imageUrl;
  final double aspectRatio;
  final double borderRadius;
  final BoxFit boxFit;
  final bool useAspectRatio; // Control AspectRatio wrapper

  const AppImageNetworkWidget({
    super.key,
    this.imageUrl,
    this.aspectRatio = 16 / 9,
    this.borderRadius = 16.0,
    this.boxFit = BoxFit.cover,
    this.useAspectRatio = true, // Mặc định vẫn dùng AspectRatio
  });

  @override
  Widget build(BuildContext context) {
    bool isValidUrl =
        imageUrl != null &&
        imageUrl!.isNotEmpty &&
        imageUrl!.startsWith('http');
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Widget chứa ảnh
    Widget imageWidget = isValidUrl
        ? CachedNetworkImage(
            key: ValueKey(imageUrl), // Key để Flutter cache widget
            fit: boxFit,
            imageUrl: imageUrl!,
            cacheKey: imageUrl, // Cache key cho CachedNetworkImage
            // Bỏ giới hạn kích thước để giữ chất lượng ảnh gốc
            // maxWidthDiskCache & memCacheWidth có thể làm ảnh bị nhòe
            fadeInDuration: const Duration(
              milliseconds: 200,
            ), // Giảm thời gian fade
            fadeOutDuration: const Duration(milliseconds: 100),
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: isDark ? ColorName.backgroundDark : Colors.grey[300]!,
              highlightColor: isDark
                  ? ColorName.textBodyDark.withValues(alpha: 0.1)
                  : Colors.grey[100]!,
              child: Container(
                color: isDark
                    ? ColorName.backgroundDark
                    : ColorName.backgroundLight,
              ),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported),
          )
        : const Icon(Icons.image_not_supported);

    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ), // Điều chỉnh giá trị bo tròn
        child: useAspectRatio
            ? AspectRatio(aspectRatio: aspectRatio, child: imageWidget)
            : imageWidget, // Không dùng AspectRatio → fill parent
      ),
    );
  }
}

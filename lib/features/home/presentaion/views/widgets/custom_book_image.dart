import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.imageurl,
  });

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 2.6 / 4, // !width/height
          child: CachedNetworkImage(
            imageUrl: imageurl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';

class ThumbnailGet extends StatelessWidget {
  final Medium medium;
  const ThumbnailGet({required this.medium, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return FadeInImage(
        fit: BoxFit.cover,
        placeholder: MemoryImage(kTransparentImage),
        image: ThumbnailProvider(
          mediumId: medium.id,
          mediumType: medium.mediumType,
          highQuality: true,
        ),
      );
    } catch (e) {
      return Container(
        child: Center(
          child: Text("No thumbnail"),
        ),
      );
    }
  }
}

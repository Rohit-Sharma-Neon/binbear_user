import 'package:binbear/ui/base_components/base_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class BaseImageLoader extends StatefulWidget {
  final String imageUrl;
  const BaseImageLoader({super.key, required this.imageUrl});

  @override
  State<BaseImageLoader> createState() => _BaseImageLoaderState();
}

class _BaseImageLoaderState extends State<BaseImageLoader> {
  late Image image;
  bool _loading = true;

  @override
  void initState() {
    image = Image.network(
      widget.imageUrl,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
    image.image.resolve( const ImageConfiguration()).addListener((ImageStreamListener((ImageInfo info, bool syncCall) {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    })));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _loading ? const BaseShimmer(width: double.infinity, height: double.infinity, borderRadius: 13,) : image;
  }
}

import 'package:flutter/material.dart';

class ReviewImages extends StatefulWidget {
  const ReviewImages({super.key, required this.link});
  final String link;

  @override
  State<ReviewImages> createState() => _ReviewImagesState();
}

class _ReviewImagesState extends State<ReviewImages> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Image.network(
        widget.link,
        fit: BoxFit.cover,
        height: 400,
      ),
    );
  }
}

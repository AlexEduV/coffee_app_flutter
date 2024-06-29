import 'package:flutter/material.dart';

class DetailsLargeItem extends StatelessWidget {

  final String text;

  const DetailsLargeItem({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 138,
      decoration:BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black87,
            Colors.black,
          ],
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 12,
        ),
      ),
    );
  }
}

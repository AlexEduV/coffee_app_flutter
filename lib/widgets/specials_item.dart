import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';

class SpecialsItem extends StatelessWidget {

  final String title;
  final String text;
  final String imageSource;

  const SpecialsItem({
    required this.title,
    required this.text,
    required this.imageSource,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ProjectColors.accentDarkColor,
            Colors.black,
          ],
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [

          Text(
            title,
          ),

        ],
      ),
    );
  }
}

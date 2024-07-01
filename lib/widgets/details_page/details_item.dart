import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../style/colors.dart';

class DetailsItem extends StatelessWidget {

  final IconData icon;
  final String text;

  const DetailsItem({
    required this.text,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 61,
      width: 61,
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
      child: Column(
        children: [

          Icon(
            icon,
            color: ProjectColors.accentColor,
            size: 22,
          ),

          const Gap(4.0),

          Text(
            text,
            style: const TextStyle(
              color: Colors.white38,
              fontSize: 12,
            ),
          ),

        ],
      ),
    );
  }
}

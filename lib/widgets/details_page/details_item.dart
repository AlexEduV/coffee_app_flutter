import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../style/colors.dart';

class DetailsItem extends StatelessWidget {

  final IconData? icon;
  final String? assetSource;
  final String text;

  const DetailsItem({
    required this.text,
    this.icon,
    this.assetSource,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    const double iconSize = 22;
    const Color iconColor = ProjectColors.accentColor;

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

          assetSource == null ?
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ) :
          Image.asset(
            assetSource!,
            color: iconColor,
            height: iconSize,
            width: iconSize,
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

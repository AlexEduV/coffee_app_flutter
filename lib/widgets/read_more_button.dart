import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app_flutter/helpers/text_helper.dart';

class ReadMoreButton extends StatelessWidget {
  final String textToCheck;
  final Function() onTap;
  final bool isExpanded;
  final double? fontSize;
  final Color? color;
  final MainAxisAlignment alignment;

  const ReadMoreButton({
    required this.textToCheck,
    required this.onTap,
    required this.isExpanded,
    this.fontSize = 14.0,
    this.color = ProjectColors.accentColor,
    this.alignment = MainAxisAlignment.end,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: hasTextOverflow(
        textToCheck,
        Theme.of(context).textTheme.bodyMedium!,
        MediaQuery.of(context).textScaleFactor,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: alignment,
          children: [

            Text(
              !isExpanded ? 'Read More' : 'Read Less',
              style: TextStyle(
                color: color,
                fontSize: fontSize,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

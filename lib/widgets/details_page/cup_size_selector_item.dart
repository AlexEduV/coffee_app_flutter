import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';

class CupSizeSelectorItem extends StatelessWidget {

  final bool isSelected;
  final String text;
  final Function() onTap;

  const CupSizeSelectorItem({
    required this.isSelected,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? ProjectColors.accentColor.withOpacity(0.7) : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? ProjectColors.accentColor : Colors.white60,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      );
  }
}

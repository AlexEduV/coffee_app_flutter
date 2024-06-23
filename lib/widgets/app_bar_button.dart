import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {

  final IconData icon;
  final Function() onTap;

  const AppBarButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final BorderRadius borderRadius = BorderRadius.circular(12.0);

    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ProjectColors.accentDarkColor,
              Colors.black12,
            ],
          ),
          borderRadius: borderRadius,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white24,
          size: 25,
        ),
      ),
    );
  }
}

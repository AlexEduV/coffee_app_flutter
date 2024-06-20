import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CarouselItem extends StatelessWidget {
  final String imageSource;

  final String name;
  final String subName;

  final String price;
  final String stars;

  const CarouselItem({
    super.key,
    required this.imageSource,
    required this.name,
    required this.subName,
    required this.price,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ProjectColors.accentDarkColor,
            Colors.black,
          ]
        )
      ),
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //picture
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              image: DecorationImage(
                image: AssetImage(imageSource),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Gap(15.0),

          //info column
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),

          //subName
          Text(
            subName,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white38,
            ),
          )

        ],
      ),
    );
  }
}

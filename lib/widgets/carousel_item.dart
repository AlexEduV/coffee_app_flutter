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
      width: 180,
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

          //name
          Row(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          //subName
          Row(
            children: [
              Text(
                subName,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white38,
                ),
              ),
            ],
          ),

          const Gap(10.0),

          //price and plus icon
          Row(
            children: [

              //price
              const Text(
                '\$',
                style: TextStyle(
                  color: ProjectColors.accentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Gap(10.0),

              Expanded(
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              //plus icon
              Container(
                decoration: BoxDecoration(
                  color: ProjectColors.accentColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}

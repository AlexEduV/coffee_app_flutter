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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //picture
        Container(
          height: 180,
          width: 180,
          margin: const EdgeInsets.only(right: 20.0,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(imageSource),
              fit: BoxFit.cover,
            ),
          ),
        ),

        const Gap(20.0),

        //info column
        Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),

        const Gap(3.0),

        //subName
        Text(
          subName,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white60,
          ),
        )

      ],
    );
  }
}

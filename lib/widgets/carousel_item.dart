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
    return Stack(
      children: [

        //picture
        Container(
          height: 300,
          width: 200,
          margin: const EdgeInsets.only(right: 10.0,),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(imageSource),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //info column
        Positioned(
          bottom: 10,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const Gap(3.0),

              //subName
              Text(
                subName,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),


            ],
          ),
        )

      ],
    );
  }
}

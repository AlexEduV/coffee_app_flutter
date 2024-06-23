import 'package:coffee_app_flutter/model/coffee.dart';
import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class CarouselItem extends StatelessWidget {
  final Coffee coffee;

  const CarouselItem({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {

    final BorderRadius borderRadius = BorderRadius.circular(30.0);

    return Ink(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ProjectColors.accentDarkColor,
            Colors.black87,
          ],
        ),
      ),
      child: InkWell(
        onTap: () {

          // go to the details page;
          context.goNamed('orderDetails', extra: coffee);

        },
        borderRadius: borderRadius,
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //picture
              Stack(
                children: [

                  Container(
                    height: 146,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(coffee.imageSource),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          topRight: Radius.circular(15.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      child: Row(
                        children: [

                          //star icon
                          const FaIcon(
                            FontAwesomeIcons.solidStar,
                            color: ProjectColors.accentColor,
                            size: 15,
                          ),

                          const Gap(4.0),

                          //star value
                          Text(
                            coffee.stars,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      )
                    ),
                  )
                ],
              ),

              const Gap(15.0),

              //name
              Row(
                children: [
                  Text(
                    coffee.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),

              //subName
              Row(
                children: [
                  Text(
                    coffee.type,
                    style: const TextStyle(
                      fontSize: 13.0,
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
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Gap(10.0),

                  Expanded(
                    child: Text(
                      coffee.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  //plus icon
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ProjectColors.accentColor,
                      borderRadius: BorderRadius.circular(14.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 22,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}

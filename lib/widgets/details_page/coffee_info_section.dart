import 'dart:ui';

import 'package:coffee_app_flutter/helpers/text_helper.dart';
import 'package:coffee_app_flutter/model/coffee.dart';
import 'package:coffee_app_flutter/style/colors.dart';
import 'package:coffee_app_flutter/widgets/details_page/details_item.dart';
import 'package:coffee_app_flutter/widgets/details_page/details_large_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class CoffeeInfoSection extends StatelessWidget {

  final Coffee coffee;

  const CoffeeInfoSection({
    required this.coffee,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(32.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
          decoration: BoxDecoration(
            color: ProjectColors.coffeeBackground.withOpacity(0.8),
            borderRadius: BorderRadius.circular(32.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    coffee.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),

                  Text(
                    coffee.subName,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),

                  const Gap(16.0),

                  Row(
                    children: [

                      const Icon(
                        FontAwesomeIcons.solidStar,
                        color: ProjectColors.accentColor,
                        size: 18,
                      ),

                      const Gap(16.0),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            coffee.stars,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),

                          const Gap(8.0),

                          Text(
                            '(${formatter.format(coffee.reviews.toInt())})',
                            style: const TextStyle(
                              color: Colors.white38,
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),




                ],
              ),

              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Row(
                      children: [

                        const DetailsItem(
                          assetSource: 'assets/images/coffee-beans.png',
                          text: 'Coffee',
                        ),

                        const Gap(16.0),

                        DetailsItem(
                          icon: FontAwesomeIcons.droplet,
                          text: coffee.ingredient,
                        ),


                      ],
                    ),

                    const Gap(16.0),

                    DetailsLargeItem(
                      text: '${coffee.roastLevel} Roasted',
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

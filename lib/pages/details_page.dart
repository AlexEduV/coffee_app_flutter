import 'package:coffee_app_flutter/widgets/details_item.dart';
import 'package:coffee_app_flutter/widgets/details_large_item.dart';
import 'package:flutter/material.dart';

import 'package:coffee_app_flutter/model/coffee.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:coffee_app_flutter/style/colors.dart';
import 'package:coffee_app_flutter/widgets/app_bar_button.dart';

class DetailsPage extends StatefulWidget {

  final Coffee coffee;

  const DetailsPage({
    required this.coffee,
    super.key,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ProjectColors.pageBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [

                  Container(
                    height: 400,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.coffee.imageSource),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20.0,
                    left: 25.0,
                    right: 25.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        //menu
                        AppBarButton(
                          onTap: () {
                            //go back
                            context.go('/');
                          },
                          icon: Icons.chevron_left,
                        ),

                        //profile
                        AppBarButton(
                          onTap: () {},
                          icon: Icons.favorite,
                        ),

                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 370),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: ProjectColors.coffeeBackground,
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text(
                                widget.coffee.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              
                              Text(
                                widget.coffee.subName,
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
                                        widget.coffee.stars,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      const Gap(8.0),

                                      Text(
                                        '(${widget.coffee.reviews})',
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

                          Column(
                            children: [

                              Row(
                                children: [

                                  const DetailsItem(
                                    icon: FontAwesomeIcons.mortarPestle,
                                    text: 'Coffee',
                                  ),

                                  const Gap(16.0),

                                  DetailsItem(
                                    icon: FontAwesomeIcons.droplet,
                                    text: widget.coffee.ingredient,
                                  ),


                                ],
                              ),

                              const Gap(16.0),

                              const Row(
                                children: [

                                  DetailsLargeItem(
                                    text: 'Medium Roasted',
                                  )

                                ],
                              )

                            ],
                          )
                        ],
                      ),
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

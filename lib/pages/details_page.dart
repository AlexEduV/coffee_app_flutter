import 'package:flutter/material.dart';

import 'package:coffee_app_flutter/model/coffee.dart';
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
                      height: 200,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(25.0),
                      decoration: BoxDecoration(
                        color: ProjectColors.coffeeBackground,
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Row(
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

                              const Gap(4.0),
                              
                              Text(
                                widget.coffee.subName,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),

                              const Gap(4.0),


                              
                              


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

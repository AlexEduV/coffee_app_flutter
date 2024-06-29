import 'package:flutter/material.dart';

import 'package:coffee_app_flutter/model/coffee.dart';
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
                ],
              ),



            ],
          ),
        ),
      ),
    );
  }
}

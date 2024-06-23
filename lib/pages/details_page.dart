import 'package:flutter/material.dart';

import 'package:coffee_app_flutter/model/coffee.dart';
import 'package:gap/gap.dart';

import '../style/colors.dart';
import '../widgets/app_bar_button.dart';

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //menu
                    AppBarButton(
                      onTap: () {},
                      icon: Icons.chevron_left,
                    ),

                    //profile
                    AppBarButton(
                      onTap: () {},
                      icon: Icons.favorite,
                    ),

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

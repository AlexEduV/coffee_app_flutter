import 'package:coffee_app_flutter/widgets/details_page/cup_size_selector_item.dart';
import 'package:coffee_app_flutter/widgets/details_page/details_item.dart';
import 'package:coffee_app_flutter/widgets/details_page/details_large_item.dart';
import 'package:coffee_app_flutter/widgets/read_more_button.dart';
import 'package:coffee_app_flutter/widgets/section_title.dart';
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

  late bool isDescriptionExpanded = false;

  final List<String> cupSizes = ['S', 'M', 'L'];
  late int cupSizeSelectedIndex = 0;

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
                    height: 340,
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
                    padding: const EdgeInsets.only(top: 300),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
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

                          IntrinsicWidth(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
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

                                DetailsLargeItem(
                                  text: '${widget.coffee.roastLevel} Roasted',
                                )

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              const Gap(20.0),

              const SectionTitle(
                title: 'Description',
              ),

              const Gap(4.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  widget.coffee.description,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: isDescriptionExpanded ? 10 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const Gap(4.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ReadMoreButton(
                  textToCheck: widget.coffee.description,
                  onTap: () {
                    setState(() {
                      isDescriptionExpanded = !isDescriptionExpanded;
                    });
                  },
                  isExpanded: isDescriptionExpanded,
                ),
              ),

              const Gap(20.0),

              const SectionTitle(
                  title: 'Size',
              ),

              const Gap(4.0),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: List.generate(cupSizes.length, (index) {

                    return Expanded(
                      child: CupSizeSelectorItem(
                        onTap: () {
                          setState(() {
                            cupSizeSelectedIndex = index;
                          });
                        },
                        isSelected: cupSizeSelectedIndex == index,
                        text: cupSizes[index],
                      ),
                    );
                  }),
                ),
              ),

              const Gap(40.0),

              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitle(title: 'Price'),

                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            '\$ ${widget.coffee.price}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                          color: ProjectColors.accentColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              const Gap(17.0),

            ],
          ),
        ),
      ),
    );
  }
}

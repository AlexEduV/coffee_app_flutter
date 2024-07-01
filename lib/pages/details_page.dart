import 'package:coffee_app_flutter/widgets/details_page/coffee_info_section.dart';
import 'package:coffee_app_flutter/widgets/details_page/cup_size_selector_item.dart';
import 'package:coffee_app_flutter/widgets/read_more_button.dart';
import 'package:coffee_app_flutter/widgets/section_title.dart';
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

                  //coffee photo cover
                  Container(
                    height: 450,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.coffee.imageSource),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0),
                      )
                    ),
                  ),

                  //app bar
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

                  //coffee info section
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CoffeeInfoSection(
                        coffee: widget.coffee,
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

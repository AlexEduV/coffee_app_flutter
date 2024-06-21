import 'package:coffee_app_flutter/helpers/text_helper.dart';
import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SpecialsItem extends StatelessWidget {

  final String title;
  final String description;
  final String imageSource;
  final Function() onReadMoreButtonPressed;
  final bool isExpanded;


  SpecialsItem({
    required this.title,
    required this.description,
    required this.imageSource,
    required this.isExpanded,
    required this.onReadMoreButtonPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ProjectColors.accentDarkColor,
            Colors.black,
          ],
        ),
      ),
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //photo
          Container(
            height: 146,
            width: 146,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(imageSource),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Gap(15.0),

          //text column
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),

                const Gap(10.0),

                Text(
                  description,
                  maxLines: isExpanded ? 10 : 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const Gap(4.0),

                Visibility(
                  visible: !isExpanded && hasTextOverflow(
                    description,
                    Theme.of(context).textTheme.bodyMedium!,
                    MediaQuery.of(context).textScaleFactor,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: InkWell(
                    onTap: onReadMoreButtonPressed,
                    child: Row(
                      children: [

                        Text(
                          'Read More',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

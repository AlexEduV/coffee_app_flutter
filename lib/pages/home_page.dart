import 'package:coffee_app_flutter/model/data_model.dart';
import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'package:coffee_app_flutter/model/coffee.dart';
import 'package:coffee_app_flutter/widgets/carousel_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedTabPageIndex = 0;
  List<Coffee> coffeeData = DataModel.getInitCoffeeData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.pageBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: IconButton(
            onPressed: () {},
            icon: const FaIcon(
                FontAwesomeIcons.grip,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Gap(20.0),

          //main text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best\ncoffee for you',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Gap(35.0),

          //search bar
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SearchBar(
              leading: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.search,
                  color: ProjectColors.hintColor,
                ),
              ),
              hintText: 'Find Your Coffee...',
            ),
          ),

          const Gap(30.0),

          //tab bar
          DefaultTabController(
            length: 4,
            child: TabBar(
              labelColor: ProjectColors.accentColor,
              unselectedLabelColor: ProjectColors.hintColor,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
              labelPadding: const EdgeInsets.only(left: 0.0, right: 20,),
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicator: const CircleTabIndicator(
                color: ProjectColors.accentColor,
                radius: 3.0,
              ),
              onTap: (index) {
                setState(() {
                  selectedTabPageIndex = index;
                });
              },
              tabs: const [
                Tab(text: 'Cappuccino',),
                Tab(text: 'Espresso',),
                Tab(text: 'Latte',),
                Tab(text: 'Flat White',),
              ],
            ),
          ),

          //horizontal list view
          SizedBox(
            width: double.maxFinite,
            child: getTabPageByIndex(selectedTabPageIndex),
          ),

          //'special for you' section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Special for you',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
          ),

          //list view
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                
              }
            ),

          )

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ProjectColors.accentColor,
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.basketShopping,
            ),
            label: 'Store'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidHeart,
            ),
            label: 'Favorites'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidBell,
            ),
            label: 'Notifications',
          ),

        ],
      ),
    );
  }


  Widget getTabPageByIndex(int index) {

    if (index == 0) {
      return ListView.separated(
        itemCount: 2,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20.0, top: 15.0, bottom: 15.0,),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: CarouselItem(
              coffee: coffeeData[index],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Gap(25.0);
        },
      );
    }
    else if (index == 1) {
      return const Text('Inspiration');
    }
    else if (index == 2) {
      return const Text('Emotions');
    }

    return Container();
  }
}

class CircleTabIndicator extends Decoration {

  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }

}

class _CirclePainter extends BoxPainter {

  final Color color;
  final double radius;

  const _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {

    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - (radius * 2));

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }

}
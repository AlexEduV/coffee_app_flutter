import 'package:coffee_app_flutter/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ProjectColors.pageBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.menu
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.person
              ),
            ),
          ),
        ],
      ),
      body: const Column(
        children: [

          Gap(20.0),

          //main text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best coffee for you',
              style: TextStyle(
                fontSize: 34.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Gap(35.0),

          //search bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SearchBar(
              leading: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.search,
                  color:ProjectColors.hintColor,
                ),
              ),
              hintText: 'Find Your Coffee...',
            ),
          ),

          //horizontal list view

          //'special for you' section

          //list view

        ],
      ),
    );
  }
}
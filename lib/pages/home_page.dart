import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
          
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:coffee_app_flutter/model/coffee.dart';

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

    return const Placeholder();
  }
}

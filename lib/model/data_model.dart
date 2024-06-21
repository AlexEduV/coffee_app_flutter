import 'coffee.dart';

class DataModel {

  static List<Coffee> coffee = [];

  static const String assetPath = 'assets/images/';

  static List<Coffee> getInitCoffeeData() {

    coffee = [];

    coffee.add(
      const Coffee(index: 1, name: 'Cappuccino', type: 'With Oat Milk', price: '4.20', stars: '4.5', imageSource: '${assetPath}coffee_1.jpg'),
    );

    coffee.add(
      const Coffee(index: 2, name: 'Cappuccino', type: 'With Chocolate', price: '3.14', stars: '4.2', imageSource: '${assetPath}coffee_2.jpg'),
    );

    return coffee;
  }

}

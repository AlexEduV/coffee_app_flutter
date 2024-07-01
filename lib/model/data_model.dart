import 'coffee.dart';

class DataModel {

  static List<Coffee> coffee = [];

  static const String assetPath = 'assets/images/';

  static List<Coffee> getInitCoffeeData() {

    coffee = [];

    coffee.add(
      const Coffee(
        index: 1,
        name: 'Cappuccino',
        subName: 'With Oat Milk',
        price: '4.20',
        stars: '4.5',
        reviews: 6986,
        roastLevel: 'Medium',
        ingredient: 'Milk',
        imageSource: '${assetPath}coffee_1.jpg',
        description: 'A cappuccino is a beloved espresso-based hot coffee drink made with layering of espresso, steamed milk, and milk foam on top. The taste of cappuccinos can be described as creamy, smooth, and balanced. The combination of flavors and textures creates a delightful and comforting experience for many coffee enthusiasts.'
      ),
    );

    coffee.add(
      const Coffee(
        index: 2,
        name: 'Cappuccino',
        subName: 'With Chocolate',
        price: '3.14',
        stars: '4.2',
        reviews: 4843,
        roastLevel: 'Light',
        ingredient: 'Choco',
        imageSource: '${assetPath}coffee_2.jpg',
        description: 'A cappuccino is a beloved espresso-based hot coffee drink made with layering of espresso, steamed milk, and milk foam on top. The taste of cappuccinos can be described as creamy, smooth, and balanced. The combination of flavors and textures creates a delightful and comforting experience for many coffee enthusiasts.'
      ),
    );

    return coffee;
  }

}

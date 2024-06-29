class Coffee {

  final int index;
  final String name;
  final String subName;
  final String price;
  final String stars;
  final int reviews;
  final Roast roastLevel;
  final String ingredient;
  final String imageSource;
  final String description;

  const Coffee({
    required this.index,
    required this.name,
    required this.subName,
    required this.price,
    required this.stars,
    required this.reviews,
    required this.roastLevel,
    required this.ingredient,
    required this.imageSource,
    required this.description,
  });

}

enum Roast { light, medium, mediumDark, dark }
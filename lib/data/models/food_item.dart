// To parse this JSON data, do
//
//     final foodItem = foodItemFromJson(jsonString);

import 'dart:convert';

enum FoodCategory {
  burger,
  chicken,
  fries,
  sandwich,
  soda,
  breakfast,
  ingredient,
}

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;
  EnumValues(this.map) {
    reverseMap = map.map((k, v) => MapEntry(v, k));
  }
}

final foodCategoryValues = EnumValues<FoodCategory>({
  "Burger": FoodCategory.burger,
  "Chicken": FoodCategory.chicken,
  "Fries": FoodCategory.fries,
  "Sandwich": FoodCategory.sandwich,
  "Soda": FoodCategory.soda,
  "Breakfast": FoodCategory.breakfast,
  "Ingredient": FoodCategory.ingredient,
});

FoodItem foodItemFromJson(String str) => FoodItem.fromJson(json.decode(str));

String foodItemToJson(FoodItem data) => json.encode(data.toJson());

class FoodItem {
  final String imageName;
  final String name;
  final String nameTr;
  final String description;
  final String descriptionTr;
  final int calories;
  final String nutrients;
  final String nutrientsTr;
  final double rating;
  bool isLiked;
  final double priceTL;
  final double priceUSD;
  final FoodCategory category;
  bool isInCart;

  FoodItem({
    required this.imageName,
    required this.name,
    required this.nameTr,
    required this.description,
    required this.descriptionTr,
    required this.calories,
    required this.nutrients,
    required this.nutrientsTr,
    required this.rating,
    required this.isLiked,
    required this.priceTL,
    required this.priceUSD,
    required this.category,
    required this.isInCart,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    imageName: json["imageName"],
    name: json["name"],
    nameTr: json["nameTr"],
    description: json["description"],
    descriptionTr: json["descriptionTr"],
    calories: json["calories"],
    nutrients: json["nutrients"],
    nutrientsTr: json["nutrientsTr"],
    rating: json["rating"]?.toDouble(),
    isLiked: json["isLiked"],
    priceTL: json["priceTL"],
    priceUSD: json["priceUSD"]?.toDouble(),
    category: foodCategoryValues.map[json["category"]]!,
    isInCart: json["isInCart"],
  );

  Map<String, dynamic> toJson() => {
    "imageName": imageName,
    "name": name,
    "nameTr": nameTr,
    "description": description,
    "descriptionTr": descriptionTr,
    "calories": calories,
    "nutrients": nutrients,
    "nutrientsTr": nutrientsTr,
    "rating": rating,
    "isLiked": isLiked,
    "priceTL": priceTL,
    "priceUSD": priceUSD,
    "category": foodCategoryValues.reverseMap[category],
    "isInCart": isInCart,
  };
}





/*enum FoodCategory {
  burger,
  chicken,
  fries,
  sandwich,
  soda,
  breakfast,
  ingredient,
}

class FoodItem {
  final String imageName;
  final String name;
  final String description;
  final int calories;
  final String nutrients;
  final double rating;
  bool isLiked;
  final double priceTL;
  final double priceUSD;
  final FoodCategory category;
  bool isInCart;

  FoodItem({
    required this.imageName,
    required this.name,
    required this.description,
    required this.calories,
    required this.nutrients,
    required this.rating,
    required this.isLiked,
    required this.priceTL,
    required this.priceUSD,
    required this.category,
    required this.isInCart,
  });
}

final List<FoodItem> foodItems = [
  FoodItem(
    imageName: 'assets/images/foods/chicken_burger.png',
    name: 'Chicken Burger',
    description: 'Grilled chicken with fresh lettuce and tomato',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.burger,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/beef_burger.png',
    name: 'Beef Burger',
    description: 'Juicy beef patty with cheddar and pickles',
    calories: 600,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.0,
    isLiked: false,
    priceTL: 125.0,
    priceUSD: 4.49,
    category: FoodCategory.burger,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/fries.png',
    name: 'French Fries',
    description: 'Crispy golden potato fries',
    calories: 300,
    nutrients: 'Carbs, Fat',
    rating: 4.5,
    isLiked: true,
    priceTL: 45.0,
    priceUSD: 1.60,
    category: FoodCategory.fries,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/mushroom_fried_chicken.png',
    name: 'Mushroom Fried Chicken',
    description: 'Crispy chicken topped with creamy mushroom sauce',
    calories: 520,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.5,
    isLiked: false,
    priceTL: 120.0,
    priceUSD: 4.20,
    category: FoodCategory.chicken,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/fillet_fried_chicken.png',
    name: 'Fillet Fried Chicken',
    description: 'Tender chicken fillets fried to perfection',
    calories: 470,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.6,
    isLiked: false,
    priceTL: 78.0,
    priceUSD: 2.70,
    category: FoodCategory.chicken,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/garlic_fried_chicken.png',
    name: 'Garlic Fried Chicken',
    description: 'Golden fried chicken with garlic cream drizzle',
    calories: 500,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.4,
    isLiked: false,
    priceTL: 102.0,
    priceUSD: 3.50,
    category: FoodCategory.chicken,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/crispy_chicken.png',
    name: 'Original Fried Chicken',
    description: 'Classic crispy chicken with herbs and spices',
    calories: 510,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.5,
    isLiked: false,
    priceTL: 120.0,
    priceUSD: 4.20,
    category: FoodCategory.chicken,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/original_chicken_bucket.png',
    name: 'Original Fried Chicken Bucket',
    description: 'A bucket of our signature fried chicken pieces',
    calories: 1450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.7,
    isLiked: false,
    priceTL: 115.0,
    priceUSD: 4.00,
    category: FoodCategory.chicken,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/cheese_burger.png',
    name: 'Cheese Burger',
    description: 'Juicy beef patty with cheddar cheese and toppings',
    calories: 620,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.5,
    isLiked: true,
    priceTL: 165.0,
    priceUSD: 5.60,
    category: FoodCategory.burger,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/beef_burger.png',
    name: 'Beef Burger',
    description: 'Grilled beef burger with lettuce and tomato',
    calories: 590,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.7,
    isLiked: false,
    priceTL: 145.0,
    priceUSD: 5.20,
    category: FoodCategory.burger,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/smoke_beef_burger.png',
    name: 'Smoke Beef Burger',
    description: 'Smoky beef patty with caramelized onions and sauce',
    calories: 640,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: false,
    priceTL: 170.0,
    priceUSD: 5.95,
    category: FoodCategory.burger,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/spicy_beef_burger.png',
    name: 'Spicy Beef Burger',
    description: 'Spiced-up beef burger with jalapeños and sauce',
    calories: 610,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.3,
    isLiked: false,
    priceTL: 100.0,
    priceUSD: 3.50,
    category: FoodCategory.burger,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/chicken_burger.png',
    name: 'Chicken Burger',
    description: 'Grilled chicken with fresh lettuce and tomato',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.burger,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/foods/cocacola.png',
    name: 'CocaCola',
    description: 'Refreshing original taste soft drink',
    calories: 140,
    nutrients: 'Sugar, Caffeine',
    rating: 4.6,
    isLiked: false,
    priceTL: 35.0,
    priceUSD: 1.20,
    category: FoodCategory.soda,
    isInCart: true,
  ),
  FoodItem(
    imageName: 'assets/images/foods/fanta.png',
    name: 'Fanta',
    description: 'Crisp orange-flavored carbonated drink',
    calories: 150,
    nutrients: 'Sugar',
    rating: 4.4,
    isLiked: false,
    priceTL: 35.0,
    priceUSD: 1.20,
    category: FoodCategory.soda,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/ingredients/temp/artisan_bun.png',
    name: 'Artisan Bun',
    description: 'Grilled bun with susams.',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.ingredient,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/ingredients/temp/buttermilk.png',
    name: 'Buttermilk Crispy Chicken Fillet',
    description: 'Perfectly cooked chicken fillets.',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.ingredient,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/ingredients/temp/lettuce.png',
    name: 'Shredded Lettuce',
    description: 'Just healthy.',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.ingredient,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/ingredients/temp/tomato.png',
    name: 'Italian Tomato',
    description: 'Very healty.',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.ingredient,
    isInCart: false,
  ),
  FoodItem(
    imageName: 'assets/images/ingredients/temp/mayonnaise.png',
    name: 'Mayonnaise',
    description: 'Goes perfcet with some fries.',
    calories: 450,
    nutrients: 'Protein, Carbs, Fat',
    rating: 4.2,
    isLiked: true,
    priceTL: 110.0,
    priceUSD: 3.95,
    category: FoodCategory.ingredient,
    isInCart: false,
  ),
];
*/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kendin_ye/core/localization/app_localizations.dart';
import 'package:kendin_ye/data/globals.dart';
import 'package:kendin_ye/data/models/food_item.dart';

class IngredientSelector extends StatefulWidget {
  const IngredientSelector({super.key});

  @override
  State<IngredientSelector> createState() => _IngredientSelectorState();
}

class _IngredientSelectorState extends State<IngredientSelector> {
  List<FoodItem> listem = globalFoodItems
      .where((i) => i.category == FoodCategory.ingredient)
      .toList();

  final int _currentPage = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.55,
    );
    _imageList = [
      "assets/images/ingredients/buns/bottom_bun.png",
      "assets/images/ingredients/buns/top_bun.png",
    ];
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  List<String> _imageList = [];
  void _addImage(String img) {
    setState(() {
      _imageList.insert(_imageList.length - 1, img);
    });
  }

  String _imagePath(String original) {
    if (original.isEmpty) {
      return original;
    }
    if (Theme.of(context).brightness == Brightness.dark) {
      final segments = original.split('/');
      if (segments.length > 1 &&
          (segments.contains('buns') || segments.contains('burger_patty'))) {
        // insert 'realistic' folder before the file name
        segments.insert(segments.length - 1, 'realistic');
        return segments.join('/');
      }
    }
    return original;
  }

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context).translate;
    final isTurkish = AppLocalizations.of(context).isTurkish;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "Burger Köftesi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 30,
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1.6,
              child: PageView.builder(
                itemCount: listem.length,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return carouselView(index);
                },
              ),
            ),

            SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  for (int i = 0; i < _imageList.length; i++)
                    Positioned(
                      bottom: i * 15.0,
                      child: Image.asset(
                        _imagePath(_imageList[i]),
                        width: 100,
                        height: 100,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carouselView(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0.0;
        double scale = 0.7;

        if (_pageController.position.haveDimensions) {
          value = index.toDouble() - (_pageController.page ?? 0);
          value = (value * 0.03).clamp(-1, 1);

          final pageOffset =
              _pageController.page ?? _pageController.initialPage.toDouble();
          final difference = (pageOffset - index).abs();
          scale = (1 - (difference * 0.3)).clamp(
            0.7,
            1.0,
          ); // Scale down side items
        }
        return Transform.scale(
          scale: scale,
          child: Transform.rotate(
            angle: pi * value,
            child: carouselCard(index),
          ),
        );
      },
    );
  }

  Widget carouselCard(int index) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_imagePath(listem[index].imageName)),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text("deneme 1"),
        ),
        ElevatedButton(
          onPressed: () {
            _addImage(listem[index].imageName);
            setState(() {});
          },
          child: const Text("Add Ingredient"),
        ),
      ],
    );
  }
}

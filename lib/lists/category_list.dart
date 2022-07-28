import 'package:carousel_slider/carousel_slider.dart';
import 'package:done/reusables/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (_, data, Widget? child) {
      return CarouselSlider.builder(
        itemCount: data.categoryCount,
        itemBuilder: (_, int itemIndex, int pageViewIndex) {
          final card = data.publicCategory[itemIndex];
          return CategoryCard(
            category: card.catName,
            taskNo: card.taskNo,
            percent: card.complete,
          );
        },
        options: CarouselOptions(
          height: 140,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          viewportFraction: 0.6,
          initialPage: 1,
        ),
      );
    });
  }
}

import 'package:done/reusables/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (_, data, Widget? child) {
      return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: data.publicCategory.isNotEmpty // Check if the listView is empty
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.categoryCount,
                itemBuilder: (_, itemIndex) {
                  final card = data.publicCategory[itemIndex];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CategoryCard(
                      category: card.catName,
                      taskNo: card.taskNo,
                      percent: card.complete,
                    ),
                  );
                },
              )
            : Center(
                child: Text(
                  'No categories',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
      );
    });
  }
}

import 'package:done/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:done/reusables/carousel_item.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  static const id = 'ExpScreen';

  @override
  Widget build(BuildContext context) {
    List<CategoryCard> myList = [
      const CategoryCard(category: 'Business', taskNo: 12, percent: 0.4),
      const CategoryCard(category: 'School', taskNo: 5, percent: 0.7),
      const CategoryCard(category: 'Personal', taskNo: 7, percent: 0.5),
      const CategoryCard(category: 'Business', taskNo: 10, percent: 0.2),
    ];

    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 15),
        child: FloatingActionButton(
          backgroundColor: kSecColor,
          elevation: 10,
          child: const Icon(
            Icons.add,
            size: 33,
            semanticLabel: 'Create a new task',
            color: kThemeColor,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What\'s up, dele !',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('CATEGORIES'),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                items: myList,
                options: CarouselOptions(
                  height: 140,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                  initialPage: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

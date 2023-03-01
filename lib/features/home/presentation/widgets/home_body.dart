import 'package:bio_medical/core/custom_widgets/grid_item.dart';
import 'package:bio_medical/core/utils/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  final List<String> banners = const [
    'assets/images/bannerOne.jpg',
    'assets/images/bannerTwo.jpg',
    'assets/images/bannerThree.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildCarouselSlider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Most Common Disease', style: Styles.textStyle20),
                const SizedBox(
                  height: 10.0,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.5,
                  childAspectRatio: 1 / 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                    10,
                    (index) => const GridItem(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider buildCarouselSlider() {
    return CarouselSlider(
      items: banners
          .map(
            (e) => Image(
              image: AssetImage(e),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 250.0,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
        autoPlayAnimationDuration: const Duration(
          seconds: 1,
        ),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

import 'package:bio_medical/core/custom_widgets/grid_item.dart';
import 'package:bio_medical/features/home/presentation/manager/diseases_cubit/diseases_cubit.dart';
import 'package:bio_medical/features/home/presentation/manager/diseases_cubit/diseases_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  final List<String> banners = const [
    'assets/images/bannerOne.jpg',
    'assets/images/bannerTwo.jpg',
    'assets/images/bannerThree.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiseasesCubit, DiseasesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCarouselSlider(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('الأمراض الأكثر إنتشاراً',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (state is GetDateBaseState)
                      GridView.count(
                        crossAxisCount: 1,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.5,
                        childAspectRatio: 1 / 0.5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          DiseasesCubit.get(context).diseases.length,
                          (index) => GridItem(
                              model:
                                  DiseasesCubit.get(context).diseases[index]),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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

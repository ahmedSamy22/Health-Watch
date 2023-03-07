import 'package:bio_medical/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.model,
  });

  final Map model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDiseaseRouteKey, extra: model);
      },
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.asset(
              '${model['image']}',
              width: double.infinity,
              height: 150.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              child: Text(
                '${model['title']}',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

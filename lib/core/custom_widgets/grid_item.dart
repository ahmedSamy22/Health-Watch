import 'package:bio_medical/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDiseaseRouteKey);
      },
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            const Image(
              image: NetworkImage(
                  'https://img.freepik.com/premium-photo/young-woman-using-nebulizer-asthma-respiratory-diseases-white-background_495423-24950.jpg'),
              width: double.infinity,
              height: 150.0,
            ),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              child: const Text(
                'ASTHMA ATTACK',
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
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

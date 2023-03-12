import 'package:bio_medical/core/utils/styles.dart';
import 'package:flutter/material.dart';

class sheetFirstView extends StatelessWidget {
  const sheetFirstView({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _currentPage == 0 ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/premium.png',
                  height: 80,
                  width: 80,
                ),
                const Text(
                  'Premium Content',
                  style: Styles.textStyle28,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'You will get access to all features.\nYou will have Aids video guide for more diseases and statistics of your vital signs.',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontFamily: 'TiltNeon',
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 36.0,
                ),
                const Text(
                  'Starting at \$17.99 /month',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontFamily: 'TiltNeon',
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

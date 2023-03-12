import 'package:bio_medical/core/custom_widgets/sheet_first_view.dart';
import 'package:bio_medical/core/utils/styles.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  int _currentPage = 0;

  int _currentChoice = 0;
  Color firstBorderColor = Colors.grey;
  double firstBorderWidth = 1.0;
  Color secBorderColor = Colors.grey;
  double secBorderWidth = 1.0;

  void _toggleView() {
    setState(() {
      _currentPage = _currentPage == 0 ? 1 : 0;
    });
  }

  @override
  void initState() {
    _currentChoice = 0;
    firstBorderColor = Colors.blue;
    firstBorderWidth = 2.0;
    secBorderColor = Colors.grey;
    secBorderWidth = 1.0;
    super.initState();
  }

  void _toggleChoice() {
    setState(() {
      if (_currentChoice == 0) {
        firstBorderColor = Colors.blue;
        firstBorderWidth = 2.0;
        secBorderColor = Colors.grey;
        secBorderWidth = 1.0;
      } else {
        secBorderColor = Colors.blue;
        secBorderWidth = 2.0;
        firstBorderColor = Colors.grey;
        firstBorderWidth = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.47,
      color: Colors.white,
      child: Stack(
        children: [
          // first view
          sheetFirstView(currentPage: _currentPage),
          // second view
          AnimatedOpacity(
            opacity: _currentPage == 1 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose Your Plan',
                      style: Styles.textStyle16,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentChoice = 0;
                        });
                        _toggleChoice();
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: firstBorderColor,
                              width: firstBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Monthly',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '\$17.99 /month',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'TiltNeon',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'One Week Free Trial',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.green,
                                  fontFamily: 'TiltNeon',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'then \$17.99 per month. Cancel anytime',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontFamily: 'TiltNeon',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          setState(() {
                            _currentChoice = 1;
                          });
                          _toggleChoice();
                        });
                      },
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: secBorderColor,
                              width: secBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Annually',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '\$169.99 /year',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'TiltNeon',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'One Week Free Trial',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.green,
                                  fontFamily: 'TiltNeon',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'then \$169.99 per month. Cancel anytime',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  fontFamily: 'TiltNeon',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Buttons
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                clipBehavior: Clip.none,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: _toggleView,
                      child: ConditionalBuilder(
                        condition: _currentPage == 0,
                        builder: (context) => const Text(
                          'Choose Your Plan',
                          style: Styles.textStyle16,
                        ),
                        fallback: (context) => const Text(
                          'Continue to Checkout',
                          style: Styles.textStyle16,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'May be later',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

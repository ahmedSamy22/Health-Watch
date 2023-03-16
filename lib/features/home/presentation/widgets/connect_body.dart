import 'package:bio_medical/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ConnectBody extends StatelessWidget {
  const ConnectBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 260,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffFF938F),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 200.0),
                      ),
                    ),
                  ),
                ),
                const CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 63.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-vector/smart-gadgets-wearable-technology-trendy-lifestyle-accessories-convenient-devices-portable-electronics-modern-phone-watch-with-touchscreen-concept-illustration_335657-2026.jpg?w=740&t=st=1678963413~exp=1678964013~hmac=768e2e37b0c6a007a3805118b3ea45e332bb39cffed74e1abd8827714726093b'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Text(
                'Connect to Bracelet',
                style: TextStyle(
                  fontSize: 22.0,
                  fontFamily: 'TiltNeon',
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'List of bracelets',
                  style: Styles.textStyle20,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Card(
                  elevation: 1.0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 15.0),
                      width: double.infinity,
                      child: const Text(
                        'Apple Watch',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 1.0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 15.0),
                      width: double.infinity,
                      child: const Text(
                        'Samsung Watch',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 1.0,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 15.0),
                      width: double.infinity,
                      child: const Text(
                        'Xiaomi Band',
                        style: Styles.textStyle18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

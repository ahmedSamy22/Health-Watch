import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 240.0,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    height: 210.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/cover.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 48.0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const CircleAvatar(
                    radius: 45.0,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1678126167~exp=1678126767~hmac=7666f206d1a7ec7e9b0c53092c270d034ea34261e16625ab43fb2387a0c17a0e'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Ahmed Samy',
            // style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

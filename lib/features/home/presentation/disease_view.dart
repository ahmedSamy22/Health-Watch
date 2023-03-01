import 'package:bio_medical/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiseaseView extends StatelessWidget {
  DiseaseView({Key? key}) : super(key: key);

  static String myVideoId = 'tbE0qDLYY7I';

  // Initiate the Youtube player controller
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: myVideoId,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      loop: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ASTHMA ATTACK'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                ),
                builder: (context, player) => player,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Signs and Symptoms :',
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                '* Difficulty breathing \n* Rapid, shallow breaths \n* Noisy, wheezy breathing \n* Coughing, particularly at night \n* Feeling of tightness in the chest\n* Difficulty speaking, in severe attacks\n* Blueness of lips and confusion, in very severe cases \n',
                style: Styles.textStyle15,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Action :',
                style: Styles.textStyle20,
              ),
              const Text(
                '1. Sit the person in a quiet, warm place, away from other people and leaning on a table. \n2. Give the person one puff into their spacer, then 4 breaths through the spacer, repeat 4 times.\n3. Wait 4 minutes, then if there is no improvement give 4 more puffs.\n4. f there is still no improvement or the person’s condition suddenly deteriorates, call an ambulance immediately.\n5. While waiting for medical help to arrive, continue to administer the puffer as described.',
                style: Styles.textStyle15,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bio_medical/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DiseaseView extends StatelessWidget {
  const DiseaseView({Key? key, required this.model}) : super(key: key);

  final Map model;

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: '${model['videoId']}',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${model['title']}'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                ),
                builder: (context, player) => player,
              ),
              const SizedBox(
                height: 10,
              ),
              // const Text(
              //   'Signs and Symptoms :',
              //   style: Styles.textStyle20,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // const Text(
              //   '* Difficulty breathing \n* Rapid, shallow breaths \n* Noisy, wheezy breathing \n* Coughing, particularly at night \n* Feeling of tightness in the chest\n* Difficulty speaking, in severe attacks\n* Blueness of lips and confusion, in very severe cases \n',
              //   style: Styles.textStyle15,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Text(
                ' : الإسعافات الأولية',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // '1. عندما يتعرض المريض للاختناق ساعده على الجلوس فورا وعدم بذل أي مجهود وأطلب منه أن يتنفس من الأنف، فذلك يساعد على تدفئة الهواء للرئة.\n2. ساعده في استخدام جهاز الاستنشاق بشكل صحيح للحصول على الدواء من خلال الجهاز وتوصيله للرئة.\n3. يجب أن تبعد المريض عن الأماكن التي تنتشر فيها مسببات الحساسية مثل الروائح النافذة أو المواد الكيمائية.\n4. انصح المريض بعدم الانفعال أو التعرض للتوتر والقلق اثناء نوبة الربو حتى لا تزيد الأزمة ويختنق.\n5. بعد استخدام جهاز الاستنشاق وتناول الأدوية، قدم للمريض سوائل دافئة مثل الينسون والنعناع، ليساعد على تهدئة السعال والحد من الاختناق.\n6. إذا زادت الاعراض ولم يتحسن المريض يجب الاتصال بسيارة الإسعاف لنقله إلى المستنشفى فورا.\n',
                // '1. إحضار جهاز الرجفان الخارجي الآلي في حال توفره.\n2. ساعد المريض على الجلوس \nتأكد من بقاء المريض بوضعية جلوس مريحة، على سبيل المثال: جلوس المريض على الأرض مع إسناده على الحائط أو على كرسي، إذ يخفف هذا من الضغط على القلب ويحمي المريض من إيذاء نفسه بطريقة أو بأخرى.\n3. راقب التنفس \nراقب وضع المريض إذا كان لا يستطيع التنفس أو يلهث، قد يحتاج الى الإنعاش القلبي الرئوي.\n4. قم بالإنعاش القلبي الرئوي \nقد يساعد قيامك بالإنعاش القلبي الرئوي على إعادة الصدر إلى وضعه الطبيعي بعد كل دفعة، حيث يجب أن تقوم بدفع منتصف الصدر بقوة وبسرعة بمقدار 100 إلى 120 دفعة في الدقيقة.\n5. استخدم جهاز مزيل الرجفان الخارجي\nعند وصول الطوارئ استخدم جهاز الرجفان الخارجي مباشرةً، فقط قم بتشغيله واتبع التعليمات المكتوبة.\n6. استمر بالدفع\nينصح بالاستمرار بالقيام بالإنعاش القلبي الرئوي حتى ملاحظة بدء المريض بالتنفس أو التحرُّك، وعند وصول فريق العمل المتخصص بالإنعاش سلمه المهمة\n7. استخدم الأسبرين\nمن الممكن إعطاء المريض دواء الأسبرين واطلب منه مضغ الدواء ببطء، حيث يزيد الأسبرين من ميوعة الدم. لكن يجب الانتباه على الجرعة، إذ يجب عدم إعطاء المريض أكثر من 300 مغ باليوم,',
                // '1. حافظ على الهدوء، وركّز على التنفس بعمق وهدوء، واحرص على الجلوس بشكل مريح.\n2.  إذا كان الطبيب قد صرف لك دواءً لخفض الضغط فاحرص على تناوله في موعده، وإذا نسيت ذلك فتناوله فورًا.\n3.  يمكنك شرب شاي مهدئ للأعصاب وللجسم، مثل شاي البابونج على سبيل المثال، وتجنب الشاي الأسود أو القهوة لدورها في رفع ضغط الدم.\n4.  تناول قطعة من الشوكولاتة الداكنة فقد تُساعد على خفض الضغط بشكل بسيط كذلك لدورها في إفراز الإندروفين التي تعزز شعورك بالاسترخاء والهدوء.\n',
                '${model['aids']}',
                textDirection: TextDirection.rtl,
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

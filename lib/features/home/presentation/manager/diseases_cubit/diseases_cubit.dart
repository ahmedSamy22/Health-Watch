import 'package:bio_medical/features/home/presentation/manager/diseases_cubit/diseases_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class DiseasesCubit extends Cubit<DiseasesStates> {
  DiseasesCubit() : super(DiseasesInitialState());

  static DiseasesCubit get(context) => BlocProvider.of(context);

  Database? database;
  List<Map> diseases = [];

  void createDataBase() async {
    await openDatabase(
      'Diseases.db',
      version: 1,
      onCreate: (db, version) async {
        print('Database is created');
        await db
            .execute(
          'CREATE TABLE diseases (id INTEGER PRIMARY KEY,title TEXT, image TEXT, aids TEXT, videoId TEXT)',
        )
            .then((value) async {
          print('Table created');
          await db.transaction((txn) async {
            txn.rawInsert(
                'INSERT INTO diseases(title,image,aids,videoId) VALUES ("مرض الربو","assets/images/asthma.png","1. عندما يتعرض المريض للاختناق ساعده على الجلوس فورا وعدم بذل أي مجهود وأطلب منه أن يتنفس من الأنف، فذلك يساعد على تدفئة الهواء للرئة.\n2. ساعده في استخدام جهاز الاستنشاق بشكل صحيح للحصول على الدواء من خلال الجهاز وتوصيله للرئة.\n3. يجب أن تبعد المريض عن الأماكن التي تنتشر فيها مسببات الحساسية مثل الروائح النافذة أو المواد الكيمائية.\n4. انصح المريض بعدم الانفعال أو التعرض للتوتر والقلق اثناء نوبة الربو حتى لا تزيد الأزمة ويختنق.\n5. بعد استخدام جهاز الاستنشاق وتناول الأدوية، قدم للمريض سوائل دافئة مثل الينسون والنعناع، ليساعد على تهدئة السعال والحد من الاختناق.\n6. إذا زادت الاعراض ولم يتحسن المريض يجب الاتصال بسيارة الإسعاف لنقله إلى المستنشفى فورا.\n","d7Mn_X5tg9Y")');
            txn.rawInsert(
                'INSERT INTO diseases(title,image,aids,videoId) VALUES ("الأزمة القلبية","assets/images/heart_attack.png","1. إحضار جهاز الرجفان الخارجي الآلي في حال توفره.\n2. ساعد المريض على الجلوس \nتأكد من بقاء المريض بوضعية جلوس مريحة، على سبيل المثال: جلوس المريض على الأرض مع إسناده على الحائط أو على كرسي، إذ يخفف هذا من الضغط على القلب ويحمي المريض من إيذاء نفسه بطريقة أو بأخرى.\n3. راقب التنفس \nراقب وضع المريض إذا كان لا يستطيع التنفس أو يلهث، قد يحتاج إلى الإنعاش القلبي الرئوي.\n4. قم بالإنعاش القلبي الرئوي \nقد يساعد قيامك بالإنعاش القلبي الرئوي على إعادة الصدر إلى وضعه الطبيعي بعد كل دفعة، حيث يجب أن تقوم بدفع منتصف الصدر بقوة وبسرعة بمقدار 100 إلى 120 دفعة في الدقيقة.\n5. استخدم جهاز مزيل الرجفان الخارجي\nعند وصول الطوارئ استخدم جهاز الرجفان الخارجي مباشرةً، فقط قم بتشغيله واتبع التعليمات المكتوبة.\n6. استمر بالدفع\nينصح بالاستمرار بالقيام بالإنعاش القلبي الرئوي حتى ملاحظة بدء المريض بالتنفس أو التحرُّك، وعند وصول فريق العمل المتخصص بالإنعاش سلمه المهمة.\n7. استخدم الأسبرين\nمن الممكن إعطاء المريض دواء الأسبرين واطلب منه مضغ الدواء ببطء، حيث يزيد الأسبرين من ميوعة الدم. لكن يجب الانتباه على الجرعة، إذ يجب عدم إعطاء المريض أكثر من 300 مغ باليوم.\n" , "0sa_3EGQMN0")');
            txn.rawInsert(
                'INSERT INTO diseases(title,image,aids,videoId) VALUES ("مرض ضغط الدم","assets/images/bloodPressure.png","1. حافظ على الهدوء، وركّز على التنفس بعمق وهدوء، واحرص على الجلوس بشكل مريح.\n2.  إذا كان الطبيب قد صرف لك دواءً لخفض الضغط فاحرص على تناوله في موعده، وإذا نسيت ذلك فتناوله فورًا.\n3.  يمكنك شرب شاي مهدئ للأعصاب وللجسم، مثل شاي البابونج على سبيل المثال، وتجنب الشاي الأسود أو القهوة لدورها في رفع ضغط الدم.\n4.  تناول قطعة من الشوكولاتة الداكنة فقد تُساعد على خفض الضغط بشكل بسيط كذلك لدورها في إفراز الإندروفين التي تعزز شعورك بالاسترخاء والهدوء.\n" , "ON9KsipMdEY")');
          });
        }).catchError((error) {
          print('Error while creating database ${error.toString()}');
        });
      },
      onOpen: (db) {
        getDataFromDatabase(db);
        print('Database is opened');
      },
    ).then((value) {
      database = value;
    });
  }

  void getDataFromDatabase(database) async {
    await database.rawQuery('SELECT * FROM diseases').then((value) {
      diseases = [];
      value.forEach((element) {
        diseases.add(element);
      });
      print(diseases[0]['title']);
      print(diseases[1]['title']);
      print(diseases[2]['title']);
      emit(GetDateBaseState());
    });
  }

  void updateDatabase() {
    database?.rawUpdate('UPDATE diseases SET image = ? WHERE videoId = ?',
        ['assets/images/bloodPressure.png', 'ON9KsipMdEY']).then((value) {
      // getDataFromDatabase(database);
      emit(UpdateDatabaseState());
    });
  }
}

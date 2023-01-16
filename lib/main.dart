import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text(
            'إختبار',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);
  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {

  List<Widget> answerResult = [];
  int rightAnswers = 0;

  void checkAnswer(bool whatUserPicked)
  {
    bool correctAnswer = appBrain.getQuestionAnswers();
    setState(() {
    if(whatUserPicked == correctAnswer)
    {
      rightAnswers++;
      answerResult.add(Padding(
        padding: const EdgeInsets.all(3.0),
        child: Icon(Icons.thumb_up,color: Colors.green,),
      ));
    }
    else
    {
      answerResult.add(Padding(
        padding: const EdgeInsets.all(3.0),
        child: Icon(Icons.thumb_down,color: Colors.red,),
      ));
    }
    if(appBrain.isFinished() == true)
    {
      Alert(
        context: context,
        type: AlertType.success,
        title: "إنتهاء الإختبار",
        desc: "لقد أجبت على $rightAnswers أسئلة صحيحة من أصل 7",
        buttons: [
          DialogButton(
            child: Text(
              "إبدأ من جديد",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      appBrain.reset();
      answerResult = [];
      rightAnswers = 0;
    }
    else
    {
      appBrain.nextQuestion();
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          child: Column(
            children: [
              appBrain.getQuestionImage(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                appBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.indigo,
          width: double.infinity,
          child: TextButton(
            onPressed:()
            {
              checkAnswer(true);
            },
            child: Text(
              'صح',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          color: Colors.deepOrange,
          width: double.infinity,
          child: TextButton(
            onPressed:()
            {
              checkAnswer(false);
            },
            child: Text(
              'خطأ',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

      ],
    );
  }
}


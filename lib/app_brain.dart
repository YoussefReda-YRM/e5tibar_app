import 'package:e5tibar_app/question.dart';
import 'package:flutter/material.dart';

class AppBrain
{
  int _questionNumber = 0;
  List<Question> _questionGroup =
  [
    Question.ap(
      'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
      Image(
        image: AssetImage(
          'assets/images/image-1.jpg',
        ),
      ),
      true,
    ),
    Question.ap(
      'القطط هي حيوانات لاحمة',
      Image(
        image: AssetImage(
          'assets/images/image-2.jpg',
        ),
      ),
      true,
    ),
    Question.ap(
      'الصين موجودة في القارة الإفريقية',
      Image(
        image: AssetImage(
          'assets/images/image-3.jpg',
        ),
      ),
      false,
    ),
    Question.ap(
      'الأرض مسطحة وليست كروية',
      Image(
        image: AssetImage(
          'assets/images/image-4.jpg',
        ),
      ),
      false,
    ),
    Question.ap(
      'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
      Image(
        image: AssetImage(
          'assets/images/image-5.jpg',
        ),
      ),
      true,
    ),
    Question.ap(
      'الشمس تدور حول الأرض والأرض تدور حول القمر',
      Image(
        image: AssetImage(
          'assets/images/image-6.jpg',
        ),
      ),
      false,
    ),
    Question.ap(
      'الحيوانات لا تشعر بالألم',
      Image(
        image: AssetImage(
          'assets/images/image-7.jpg',
        ),
      ),
      false,
    ),
  ];

  void nextQuestion()
  {
    if(_questionNumber < _questionGroup.length - 1)
    {
      _questionNumber++;
    }
  }

  String getQuestionText ()
  {
    return _questionGroup[_questionNumber].questionText;
  }
  Widget getQuestionImage ()
  {
    return _questionGroup[_questionNumber].questionImage;
  }
  bool getQuestionAnswers ()
  {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished()
  {
    if(_questionNumber >= _questionGroup.length-1)
    {
      return true ;
    }
    else
    {
      return false ;
    }
  }

  void reset()
  {
    _questionNumber = 0;

  }
}
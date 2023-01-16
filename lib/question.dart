import 'package:flutter/material.dart';

class Question
{
  late String questionText;
  late Widget questionImage;
  late bool questionAnswer;
  Question.ap(
      this.questionText,
      this.questionImage,
      this.questionAnswer);
  ap(String questionText, Widget questionImage, bool questionAnswer)
  {
    this.questionText = questionText;
    this.questionImage = questionImage;
    this.questionAnswer = questionAnswer;
  }
}
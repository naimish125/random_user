import 'dart:math';

import 'package:flutter/widgets.dart';

import '../../utils/api_helper.dart';
import '../model/home_model.dart';

class Randomprovider extends ChangeNotifier
{
  Future<RandomPerson?> findRandomPerson()
  async {
    return await ApiHelper().randomPersonApi();
  }

  int index = 0;
  int dob = 0;
  void changeIndex()
  {
    Random randomNum = Random();
    index = randomNum.nextInt(5);
    notifyListeners();
  }
}

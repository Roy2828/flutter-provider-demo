import 'package:flutter/material.dart';
import 'package:provider_demo/provider/my_change_notifier.dart';

class SampleModel extends MyChangeNotifier {
  int count = 0;

  countIncrease() {
    count++;
    notifyListener();
  }
}

import 'package:flutter/material.dart';

class MyChangeNotifier {
  Function? notifyFunc;

  registerListener(Function func){
    notifyFunc = func;
  }

  notifyListener() {
    notifyFunc?.call();
  }
}

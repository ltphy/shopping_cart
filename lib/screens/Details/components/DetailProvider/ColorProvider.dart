import 'package:flutter/foundation.dart';

class ColorProvider with ChangeNotifier {
  int selectedColor = 0;


  void setSelectedColor(int color) {
    selectedColor = color;
    notifyListeners();
  }
}

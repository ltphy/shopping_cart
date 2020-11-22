import 'package:flutter/cupertino.dart';

class SelectedProductProvider extends ChangeNotifier {
  String uuid;

  SelectedProductProvider() : uuid = "";

  void setSelectedProduct(String selectedId) {
    this.uuid = selectedId;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class ShowPanelProvider extends ChangeNotifier {
  bool isShowPanel;

  ShowPanelProvider() {
    this.isShowPanel = false;
  }

  setShowPanel(isShowed) {
    this.isShowPanel = isShowed;
    notifyListeners();
  }
}

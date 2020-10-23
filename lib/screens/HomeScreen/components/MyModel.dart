import 'package:flutter/foundation.dart';

class MyModel extends ChangeNotifier {
  //                                               <--- MyModel
  String someValue = 'Hello';

  void doSomething() {
    if (someValue == 'hello') {
      someValue = 'Goodbye';
    } else {
      someValue = 'hello';
    }
    print(someValue);
    notifyListeners();

  }

  void setSomeThing() {}
}

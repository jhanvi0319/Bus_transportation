import 'package:flutter/cupertino.dart';

class StateSettingProvider with ChangeNotifier {
  bool homeSelected = true;
  bool bookATripSelected = false;
  bool travelInfoSelected = false;
  bool contactUsSelected = false;
  showHome() {
    homeSelected = true;
    bookATripSelected = false;
    travelInfoSelected = false;
    contactUsSelected = false;

    notifyListeners();
  }

  showBookAtrip() {
    bookATripSelected = true;
    travelInfoSelected = false;
    contactUsSelected = false;
    homeSelected = false;
    notifyListeners();
  }

  showTravelinfo() {
    travelInfoSelected = true;
    bookATripSelected = false;
    contactUsSelected = false;
    homeSelected = false;
    notifyListeners();
  }

  showContactUs() {
    contactUsSelected = true;
    bookATripSelected = false;
    travelInfoSelected = false;
    homeSelected = false;
    notifyListeners();
  }
}

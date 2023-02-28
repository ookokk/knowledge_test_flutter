import 'package:flutter/material.dart';
import 'soru.dart';

class TestVeri {
  int _soruIndex = 0;

  List<Soru> _soruBankasi = [
    Soru(soruMetni: 'Titanic is the biggest ship ever', soruYaniti: false),
    Soru(
        soruMetni:
            'The number of chickens in the world is more than the number of people',
        soruYaniti: true),
    Soru(soruMetni: 'Butterflies live for one day', soruYaniti: false),
    Soru(soruMetni: 'The world is flat', soruYaniti: false),
    Soru(
        soruMetni: 'Cashews are actually the stem of a fruit',
        soruYaniti: true),
    Soru(soruMetni: 'Fatih Sultan Mehmet never ate potatoes', soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    _soruIndex++;
    if (_soruIndex == 5) {
      _soruIndex = 0;
    }
  }
}

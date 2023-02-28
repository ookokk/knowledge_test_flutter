import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

List<Widget> secimler = [];

int soruIndex = 0;

class Soru {
  String soruMetni;
  bool soruYaniti;

  Soru({required this.soruMetni, required this.soruYaniti});
}

List<Soru> soruBankasi = [
  Soru(soruMetni: 'Titanic is the biggest ship ever', soruYaniti: false),
  Soru(
      soruMetni:
          'The number of chickens in the world is more than the number of people',
      soruYaniti: true),
  Soru(soruMetni: 'Butterflies live for one day', soruYaniti: false),
  Soru(soruMetni: 'The world is flat', soruYaniti: false),
  Soru(soruMetni: 'Cashews are actually the stem of a fruit', soruYaniti: true),
  Soru(soruMetni: 'Fatih Sultan Mehmet never ate potatoes', soruYaniti: true),
];

class _SoruSayfasiState extends State<SoruSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                soruBankasi[soruIndex].soruMetni,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(runSpacing: 3, spacing: 3, children: secimler),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                        setState(() {
                          if (dogruYanit == false) {
                            secimler.add(kTrueIcon);
                          } else {
                            secimler.add(kFalseIcon);
                          }
                          soruIndex++;
                          if (soruIndex > 5) {
                            soruIndex = 0;
                          }
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            bool dogruYanit = soruBankasi[soruIndex].soruYaniti;
                            setState(() {
                              if (dogruYanit == true) {
                                secimler.add(kTrueIcon);
                              } else {
                                secimler.add(kFalseIcon);
                              }
                              soruIndex++;
                              if (soruIndex > 5) {
                                soruIndex = 0;
                              }
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:knowledge_test/test_veri.dart';
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

TestVeri test_1 = TestVeri();

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
                test_1.getSoruMetni(),
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
                        bool dogruYanit = test_1.getSoruYaniti();
                        setState(() {
                          if (dogruYanit == false) {
                            secimler.add(kTrueIcon);
                          } else {
                            secimler.add(kFalseIcon);
                          }
                          test_1.sonrakiSoru();
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
                            bool dogruYanit = test_1.getSoruYaniti();
                            setState(() {
                              if (dogruYanit == true) {
                                secimler.add(kTrueIcon);
                              } else {
                                secimler.add(kFalseIcon);
                              }
                              test_1.sonrakiSoru();
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}

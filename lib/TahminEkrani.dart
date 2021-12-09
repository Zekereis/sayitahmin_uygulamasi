import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin_uygulamasi/SonucEkrani.dart';
import 'package:sayitahmin_uygulamasi/SonucEkraniFalse.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  _TahminEkraniState createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    print("Rastgele Sayı : $rastgeleSayi");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Kalan Hak : $kalanHak",style: TextStyle(color: Colors.pink,fontSize: 30),),
            Text("Yardım : $yonlendirme",style: TextStyle(color: Colors.grey,fontSize: 24),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: Text("Tahmin Et"),
                onPressed: (){

                  setState(() {
                    kalanHak = kalanHak-1;
                  });

                  int tahmin = int.parse(tfTahmin.text);

                  if(tahmin == rastgeleSayi){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
                    return;
                    }

                  if(tahmin > rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini azalt";
                    });
                  }

                  if(tahmin < rastgeleSayi){
                    setState(() {
                      yonlendirme = "Tahmini yükselt";
                    });
                  }

                  if(kalanHak == 0){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkraniFalse()));
                  }

                  tfTahmin.text = "";


                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SonucEkrani()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

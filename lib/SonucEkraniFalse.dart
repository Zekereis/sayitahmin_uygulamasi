import 'package:flutter/material.dart';

class SonucEkraniFalse extends StatefulWidget {
  const SonucEkraniFalse({Key? key}) : super(key: key);

  @override
  _SonucEkraniFalseState createState() => _SonucEkraniFalseState();
}

class _SonucEkraniFalseState extends State<SonucEkraniFalse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuç Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/uzgun_resim.png"),
            Text("Kaybettiniz",style: TextStyle(color: Colors.black54,fontSize: 36),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(

                child: Text("TEKRAR DENE"),
                onPressed: (){

                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


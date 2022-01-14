import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ttgame/main.dart';

void main() => runApp(PageA());

class PageA extends StatelessWidget {
  const PageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tuttu-Tutmadı",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Tuttu-Tutmadı")),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  _AnaEkranState createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {

  TextEditingController t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];
  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
    });
  }

  Widget metinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: TextFormField(
                maxLength: 60,
                decoration: InputDecoration(
                  hintText: "Yaz Bir Şeyler",
                  prefixIcon: Icon(Icons.edit),
                ),
                controller: t1,
              ),
            ),
          ),
          IconButton(
              onPressed: () => listeyeEkle(t1.text), icon: Icon(Icons.send)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(child: ListView.builder(
            reverse: true,
              itemCount: mesajListesi.length,
              itemBuilder: (_, indeksNumarasi) => mesajListesi[indeksNumarasi]),
          ),
          Divider(thickness: 1),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "username";


class MesajBalonu extends StatelessWidget {
  var mesaj;

  MesajBalonu({required this.mesaj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(child: Text(isim[0]),),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(isim),
              ),
              Text(mesaj),
            ],
          ),
        ],
      ),
    );
  }
}

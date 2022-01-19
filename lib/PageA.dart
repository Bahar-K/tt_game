import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        backgroundColor: Colors.blueAccent,
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
  int skor = 0 ;

  TextEditingController t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      // gelenMesaj ulaşmaya çalış
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
      if(gelenMesaj.isEmpty && gelenMesaj.length < 5 ){
        print("Tuttu Tutmadı ile başlayan bir şey yaz");
        //Tuttu Tutmadı ile başlayan bir şey yaz diye hata metni çıkmalı

      }else if(gelenMesaj.toLowerCase().substring(0,5)== "tuttu") {
        print("Tuttu");
        skor ++;

      }else {
        print("Tutmadı");
        skor --;
      }
    });
  }

  Widget metinGirisAlani() {
    FocusNode focusNode = FocusNode();
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RawKeyboardListener(
                focusNode: focusNode,
                onKey: (event) {
                  if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
                    listeyeEkle(t1.text);
                  }
                },
                child: TextFormField(
                  maxLength: 60,
                  decoration: InputDecoration(
                    hintText: "Yaz Bir Şeyler",
                    prefixIcon: Icon(Icons.edit),
                  ),
                  controller: t1,
                  onChanged: (value) {},
                  onEditingComplete: () {},
                ),
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
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Container(
                width: 150,
                height: 23,
                color: Colors.yellowAccent,
                child: Column(
                  children: [
                Center(
                child: Text(
                        "SKOR: $skor ",
                ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Divider(thickness: 1),
          Flexible(
            child: ListView.builder(
                reverse: true,
                itemCount: mesajListesi.length,
                itemBuilder: (_, indeksNumarasi) =>
                    mesajListesi[indeksNumarasi]),
          ),
          Divider(thickness: 1),
          metinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanıcı";

class MesajBalonu extends StatelessWidget {
  var mesaj;
  @override
  MesajBalonu({required this.mesaj});

  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Text(isim[0]),
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.start,
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

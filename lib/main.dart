import 'package:flutter/services.dart';
import 'package:ttgame/state_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './state_data.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => StateData(),
      child: MaterialApp(home: FirstScreen())));
}

class FirstScreen extends StatelessWidget {
  var ilkRenk = Colors.white;
  var ikinciRenk = Colors.redAccent;
  var username;
  var password;
  @override
  Widget build(BuildContext context) {
    Function newCity= Provider.of<StateData>(context).newCity;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateData()),
      ],
      child: MaterialApp(
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            backgroundColor: ilkRenk,
            centerTitle: true,
            title: Text(
              "Before You Start",
              style: TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: ilkRenk,
          body: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(5.0),
              child: Form(
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Container(
                          width: 232,
                          child: TextFormField(
                            onChanged: (input) {
                              newCity(input);
                            },
                            onSaved: (value) {
                              username = value;
                            },
                            decoration: InputDecoration(
                              hintText: "Your User Name",
                              fillColor: ikinciRenk,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 3,
                                  )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide:
                                      BorderSide(color: ikinciRenk, width: 5)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              """BLABALALABLABALALABLABALALABLABALALABL
ABALALABLABALALABLABALALABLABALALABLABALABLABALALABLABALALABLABALALABLABALALABLABAL""",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        height: 200,
                        width: 232,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(23),
                          ),
                          color: ikinciRenk,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: ilkRenk, // background
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.cancel,
                                color: Colors.redAccent,
                                size: 75,
                              ),
                            ),
                            MaterialButton(
                              color: ilkRenk,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PageA()));
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.green,
                                size: 80,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//String isim = "Kullanıcı";

class MesajBalonu extends StatelessWidget {
  var mesaj;
  @override
  MesajBalonu({required this.mesaj});

  Widget build(BuildContext context) {
    String sehir = Provider.of<StateData>(context).isim;
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Text(sehir[0]),
          ),
          SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$sehir"),
                SizedBox(
                  height: 4,
                ),
                Text(mesaj),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
  //final ValueNotifier<String> _username = ValueNotifier<String>("Kullanıcı");
  int skor = 0;

  TextEditingController t1 = TextEditingController();

  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String gelenMesaj) {
    showAlertDialog(BuildContext context) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),

              //title: Text("Title"),
              content: Text("Tuttu Tutmadı ile başlayan bir şey yazmalısın!"),
              actions: [
                MaterialButton(
                  shape: StadiumBorder(),
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Anladım"),
                )
              ],
            );
          });
    }

    setState(() {
      MesajBalonu mesajNesnesi = MesajBalonu(mesaj: gelenMesaj);
      // gelenMesaj ulaşmaya çalış
      mesajListesi.insert(0, mesajNesnesi);
      t1.clear();
      if (gelenMesaj.isEmpty && gelenMesaj.length < 5) {
        return showAlertDialog(
          context,
        );
      } else if (gelenMesaj.toLowerCase().substring(0, 5) == "tuttu") {
        //print("Tuttu");
        skor++;
      } else {
        //print("Tutmadı");
        skor--;
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
                  maxLength: 150,
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

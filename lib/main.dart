import './tt_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget {
  var ilkRenk = Colors.white;
  var ikinciRenk = Colors.redAccent;
  var username;
  var password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    SingleChildScrollView(
                      child: Container(
                        width: 232,
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null) {
                              return "Şifre giriniz.";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
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
                          padding: const EdgeInsets.only(left: 5,right: 5),
                          child: Text(
                            """BLABALALABLABALALABLABALALABLABALALABL
ABALALABLABALALABLABALALABLABALALABLABALABLABALALABLABALALABLABALALABLABALALABLABAL""",
                            style: TextStyle(fontSize: 18, color: Colors.white),
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
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => PageA()));
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
    );
  }
}

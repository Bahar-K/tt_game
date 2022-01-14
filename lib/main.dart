import './PageA.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  var username;
  var password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Before You Start",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        body: Form(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 232,
                  child: TextFormField(
                    onSaved: (value) {
                      username = value;
                    },
                    decoration: InputDecoration(
                      hintText: "Your User Name",
                      fillColor: Colors.redAccent,
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
                              BorderSide(color: Colors.redAccent, width: 5)),
                    ),
                  ),
                ),
                Container(
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
                      fillColor: Colors.redAccent,
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
                              BorderSide(color: Colors.redAccent, width: 5)),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      'BLABALALABLABALALABLABALALABLABALALABLABALALA',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(23),
                    ),
                    color: Colors.redAccent,
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
                          primary: Colors.black, // background
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
                        color: Colors.black,
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
    );
  }
}

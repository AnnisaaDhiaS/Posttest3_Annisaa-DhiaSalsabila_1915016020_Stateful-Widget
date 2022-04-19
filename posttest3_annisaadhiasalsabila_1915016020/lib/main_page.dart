// ignore_for_file: camel_case_types

import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

enum Ukuran { Kecil, Sedang, Besar }

class main_page extends StatefulWidget {
  const main_page({Key? key}) : super(key: key);

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  String nama_pembeli = '';
  String? kue;
  final ctrlNama = TextEditingController();
  List listkue = [
    'Blackforest',
    'Redvelvet',
    'Tiramisu',
    'Brownies: Choco',
    'Brownies: Sweet Strawbwerry',
    'Brownies: Creamy Vanilla'
  ];
  Ukuran size = Ukuran.Kecil;

  @override
  void dispose() {
    ctrlNama.dispose();

    super.dispose();
  }

  String getUkuran(Ukuran value) {
    if (value == Ukuran.Kecil) {
      return "Kecil";
    } else if (value == Ukuran.Sedang) {
      return 'Sedang';
    } else if (value == Ukuran.Sedang) {
      return "Besar";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    var NWidth = MediaQuery.of(context).size.width;
    var NHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 161, 50, 59),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: NWidth,
                height: NHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        Color.fromARGB(255, 213, 99, 109),
                        Color.fromARGB(255, 87, 2, 2),
                      ]),
                ),
                child: ListView(
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      margin: EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/logo.png"),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 40, left: 40, top: 60),
                      margin: EdgeInsets.all(40),
                      alignment: Alignment.center,
                      width: NWidth - 150,
                      height: NHeight - 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Color.fromARGB(255, 255, 252, 214),
                      ),
                      child: ListView(
                        children: [
                          TextField(
                            controller: ctrlNama,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Silahkan isi dengan nama panggilan",
                              hintStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 87, 2, 2),
                              ),
                              labelText: "Nama",
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 87, 2, 2),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Nama Kue : ",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              DropdownButton(
                                hint: Text("Pilih Kue"),
                                value: kue,
                                items: listkue.map((value) {
                                  return DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    kue = value as String?;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Ukuran: ",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 2, 2),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          ListTile(
                            title: Text("Kecil"),
                            leading: Radio(
                              groupValue: size,
                              value: Ukuran.Kecil,
                              onChanged: (Ukuran? value) {
                                setState(() {
                                  size = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Sedang"),
                            leading: Radio(
                              groupValue: size,
                              value: Ukuran.Sedang,
                              onChanged: (Ukuran? value) {
                                setState(() {
                                  size = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            title: Text("Besar"),
                            leading: Radio(
                              groupValue: size,
                              value: Ukuran.Besar,
                              onChanged: (Ukuran? value) {
                                setState(() {
                                  size = value!;
                                });
                              },
                            ),
                          ),
                          OutlinedButton(
                            // color:Color.fromARGB(255, 87, 2, 2),
                            onPressed: () {
                              setState(() {
                                nama_pembeli = ctrlNama.text;
                              });
                            },

                            child: Text("Pesan"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Nama : $nama_pembeli",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 2, 2),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Nama Kue : $kue",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 2, 2),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Ukuran : ${getUkuran(size)}",
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 2, 2),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    nama(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  nama() {
    return Text(
      textAlign: TextAlign.center,
      "© Annisaa' Dhia Salsabila",
      style: TextStyle(
        fontSize: 15,
        fontStyle: FontStyle.italic,
        color: Color.fromARGB(255, 255, 252, 214),
      ),
    );
  }
}

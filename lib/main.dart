import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HttpServicePage.dart';
import 'UserReaponsepage.dart';
import 'UtilPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  @override



  void initState() {
    // TODO: implement initState
    super.initState();
    getUserResponse();

  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Oceanmtech",
          style: GoogleFonts.lora(
              color: CupertinoColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: 1),
        ),
        backgroundColor: CupertinoColors.white,
      ),

      body: ListView.builder(

          itemBuilder: (context,index){
        return ListTile(
        );
      }),
    );
  }
  getUserResponse() async {
    var url = Uri.parse(
        Utils.BASE_URL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print("No Data Found !");
    }
  }
}

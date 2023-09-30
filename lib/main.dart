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
  UserResponse userResponse = UserResponse();

  void initState() {
    // TODO: implement initState
    super.initState();
    getUserResponse();
  }

  List<DataList> finalList = [];

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
          itemCount: finalList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              height: h / 6,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black12, width: 2),
                color: CupertinoColors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage('${finalList[index].image}'),
                        height: h / 3,
                        width: w / 4,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${finalList[index].name}",
                            style: GoogleFonts.lato(
                                fontSize: 16,
                                color: CupertinoColors.black,
                                fontWeight: FontWeight.w800),
                          ),
                          Text("${finalList[index].categoryName}",style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text("${finalList[index].price} Rs",style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),),
                          Text("${finalList[index].averageRating}",style: GoogleFonts.lato(
                            fontSize: 14,
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  getUserResponse() async {
    var url = Uri.parse(Utils.BASE_URL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      userResponse = UserResponse.fromJson(json.decode(response.body));
      finalList.addAll(userResponse.productData!);
      return finalList;
      print(finalList[0].id);
    } else {
      print("No Data Found !");
    }
  }
}

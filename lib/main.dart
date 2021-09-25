import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progment_task/bloc/successbloc/booking_bloc.dart';
import 'package:progment_task/bloc/villagesec_bloc.dart';
import 'package:progment_task/dropdown%20_page.dart';
import 'package:progment_task/model/namemodel.dart';
import 'package:progment_task/model/villagesec.dart';
import 'package:progment_task/repository/SuccessRepository.dart';


Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    // TODO: implement initState

    print("------------------------------------------------a");
    super.initState();

  }

//VillageSecModel villagesecValue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              centerTitle: true,
              title: Text(
                "Progment Task",
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: BlocProvider<BookingBolc>(
              create: (context) =>
                  BookingBolc(bookingRepository: BookingRepository()),
              child:DropDownScreen() ,
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattren/model/cart.dart';
import 'package:flutter_bloc_pattren/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>  Cart(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const HomePage(),
      ),
    );
  }
}

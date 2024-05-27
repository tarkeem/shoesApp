import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nike_store/conroller/cart.dart';
import 'package:nike_store/view/screens/nikeshoes2/nikeshoes2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider(
      create: (context) => cart(),
      builder: (context, child) => child!,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home:nikeshoesmain2(),
      ),
    );
  }
}


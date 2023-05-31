import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesstore/conroller/cart.dart';
import 'package:shoesstore/view/screens/nikeShoes/shoppingBoardSc.dart';
import 'package:shoesstore/view/screens/nikeshoes2/nikeshoes2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //put the provider above material app so all pages can deal with this provider
    return ChangeNotifierProvider(
      create: (context) => cart(),
      builder: (context, child) => child!,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          primarySwatch: Colors.blue,
        ),
        home:nikeshoesmain2(),
      ),
    );
  }
}


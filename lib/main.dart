import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/pages/zapato_page.dart';

import 'models/zapato_model.dart';

void main() {
  return runApp(
     MultiProvider(
      
   
      providers: [
        ChangeNotifierProvider(create: (_)=> ZapatoModel())
      ],
      child: MyApp()
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShoesApp',
      home: 
      ZapatoPage(),
    //ZapatpDescPage()
    );
  }
}



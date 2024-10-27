import 'package:flutter/material.dart';
import 'package:tekton/pages/basico.dart';
import 'package:tekton/pages/home_page.dart';

void main() {
  runApp(TektonApp());
}

class TektonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tektõn App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white, // Cor de fundo padrão
        primarySwatch: Colors.orange,
        // Outros temas
      ),
      home: TektonHomePage(),
    );
  }
}

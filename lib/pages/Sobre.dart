import 'package:flutter/material.dart';
import 'package:tekton/pages/home_page.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        hintColor: const Color.fromARGB(255, 255, 168, 7),
        scaffoldBackgroundColor: Color(0xFF0D1B2A), // Fundo escuro elegante
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white), // Atualização aqui
        ),
      ),
      home: SobrePage(),
    );
  }
}

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B263B),
        title: Padding(
          padding: const EdgeInsets.only(left: 120),
          child: Image.asset('assets/images/logo_appbar.png', height: 90),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TektonHomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Conheça um pouco mais da equipe que transforma os seus sonhos em realidade!',
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 168, 7),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/team_member.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'Descubra o porquê você deve escolher a Tektõn.',
              style: TextStyle(
                  color: const Color.fromARGB(255, 255, 168, 7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: Color(0xFF1B263B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Nossa equipe é dedicada a transformar sonhos em realidade por meio de soluções inovadoras e personalizadas. Trabalhamos para garantir a excelência em cada projeto.',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SocialMediaRow(),
          ],
        ),
      ),
    );
  }
}

class SocialMediaRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.facebook),
            color: Colors.blueAccent,
            onPressed: () {
              // Adicione a lógica para abrir o Facebook
            },
          ),
          IconButton(
            icon: Icon(Icons.linked_camera), // Ícone de LinkedIn
            color: Colors.blue,
            onPressed: () {
              // Adicione a lógica para abrir o LinkedIn
            },
          ),
          IconButton(
            icon: Icon(Icons.camera_alt), // Ícone de Instagram
            color: Colors.pinkAccent,
            onPressed: () {
              // Adicione a lógica para abrir o Instagram
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tekton/pages/home_page.dart';

class ModelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tektõn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF0B1742),
          secondary: Color(0xFFFF9A00),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.close, color: const Color(0xFFFF9A00)),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TektonHomePage()),
            );
          },
        ),
        title: Container(
          height: 100,
          child: Image.asset(
            'assets/images/logo_appbar.png',
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.map, color: Colors.black),
                  label:
                      Text('VER MAPA', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF9A00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.filter_list, color: Colors.black),
                  label: Text('FILTRAR', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF9A00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              children: [
                Wrap(
                  spacing: 16.0,
                  runSpacing: 20.0,
                  children: [
                    PropertyCard(
                      imageUrl: 'assets/images/architecture2.jpg',
                      title: 'Casa Térrea Condomínio Golden - SP',
                      size: '300.00 m²',
                      bedrooms: '3 Quartos',
                      suites: '3 Suítes',
                      price: 'R\$ 1.500.000 Venda',
                    ),
                    PropertyCard(
                      imageUrl: 'assets/images/architecture1.jpg',
                      title: 'Chácara Recanto Itu - SP',
                      size: '2,500.00 m²',
                      bedrooms: '5 Quartos',
                      suites: '3 Suítes',
                      price: 'R\$ 2.200.000 Venda',
                    ),
                    PropertyCard(
                      imageUrl: 'assets/images/architecture3.jpg',
                      title: 'Casa de Praia em Bertioga - SP',
                      size: '250.00 m²',
                      bedrooms: '4 Quartos',
                      suites: '2 Suítes',
                      price: 'R\$ 1.800.000 Venda',
                    ),
                    PropertyCard(
                      imageUrl: 'assets/images/Chacara1.jpg',
                      title: 'Chácara Vale Verde - SP',
                      size: '5,000.00 m²',
                      bedrooms: '6 Quartos',
                      suites: '4 Suítes',
                      price: 'R\$ 3.000.000 Venda',
                    ),
                    PropertyCard(
                      imageUrl: 'assets/images/Campos.jpg',
                      title: 'Casa de Campo em Campos do Jordão - SP',
                      size: '400.00 m²',
                      bedrooms: '5 Quartos',
                      suites: '3 Suítes',
                      price: 'R\$ 2.500.000 Venda',
                    ),
                    PropertyCard(
                      imageUrl: 'assets/images/sonho.jpg',
                      title: 'Chácara dos Sonhos - SP',
                      size: '3,200.00 m²',
                      bedrooms: '4 Quartos',
                      suites: '2 Suítes',
                      price: 'R\$ 2.000.000 Venda',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String size;
  final String bedrooms;
  final String suites;
  final String price;

  PropertyCard({
    required this.imageUrl,
    required this.title,
    required this.size,
    required this.bedrooms,
    required this.suites,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              height: 200, // Aumenta a altura da imagem
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 8.0),
                Text(size, style: TextStyle(color: Colors.grey[600])),
                Text(bedrooms, style: TextStyle(color: Colors.grey[600])),
                Text(suites, style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 12.0),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

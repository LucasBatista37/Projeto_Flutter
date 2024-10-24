import 'package:flutter/material.dart';
import 'package:tekton/pages/chat_geral.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SizedBox(
              width: 200,
              height: 100,
              child: Image.asset(
                'assets/images/logo_appbar.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Sobre Nós'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Contatos'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            onTap: () {
              Navigator.pop(context); // Fecha o drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChatGeralScreen()), // Navega para a tela ChatScreen
              );
            },
          ),
        ],
      ),
    );
  }
}
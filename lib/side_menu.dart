import 'package:flutter/material.dart';
import 'package:tugas1/list_data.dart';
import 'package:tugas1/home_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu Aplikasi'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
// Navigasi ke halaman Home
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Data Mahasiswa'),
            onTap: () {
// Navigasi ke halaman Settings
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListData(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

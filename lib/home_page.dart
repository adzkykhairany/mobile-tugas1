import 'package:flutter/material.dart';
import 'package:tugas1/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('selamat datang'),
      ),
      drawer: const SideMenu(),
    );
  }
}

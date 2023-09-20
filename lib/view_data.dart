import 'package:flutter/material.dart';

class ViewData extends StatelessWidget {
  const ViewData({Key? key, required this.nama, required this.jurusan})
      : super(key: key);

  final String nama;
  final String jurusan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data'),
      ),
      body: Container(
        child: Column(
          children: [Text("Nama : $nama"), Text('Jurusan : $jurusan')],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tugas1/list_data.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  const EditData(
      {Key? key, required this.nama, required this.jurusan, required this.id})
      : super(key: key);
  final String nama;
  final String jurusan;
  final String id;

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final namaController = TextEditingController();
  final jurusanController = TextEditingController();

  Future updateData(String nama, String jurusan) async {
    String url = Platform.isAndroid
        ? 'http://192.168.1.7/mobile-tugas1/index.php'
        : 'http://localhost/mobile-tugas1/index.php';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody =
        '{"id": "${widget.id}","nama": "$nama", "jurusan": "$jurusan"}';
    var response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: jsonBody,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print(response.statusCode);
      throw Exception('Gagal memperbarui data');
    }
  }

  @override
  void initState() {
    super.initState();
    namaController.text = widget.nama;
    jurusanController.text = widget.jurusan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Mahasiswa'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                hintText: 'Nama Mahasiswa',
              ),
            ),
            TextField(
              controller: jurusanController,
              decoration: const InputDecoration(
                hintText: 'Jurusan',
              ),
            ),
            ElevatedButton(
              child: const Text('Update Mahasiswa'),
              onPressed: () {
                String nama = namaController.text;
                String jurusan = jurusanController.text;
                updateData(nama, jurusan).then((result) {
                  if (result['pesan'] == 'berhasil') {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Data berhasil di update'),
                          content: const Text('OK'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ListData(),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

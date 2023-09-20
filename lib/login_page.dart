import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var namauser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  //print('oke');
                  _saveUsername();
                  _loadUsername();
                  //Show alert
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Anda Berhasil Login'),
                          content: Text(namauser),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                } else {
                  //print('gagal');
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Login Gagal'),
                          content: const Text('Username dan Password Salah'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _saveUsername() async {
// Get shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
// Save username to localStorage
    prefs.setString('username', _usernameController.text);
  }

  void _loadUsername() async {
// Get shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
// Get username from localStorage
    namauser = prefs.getString('username');
// Set username on UI
    setState(() {});
  }
}

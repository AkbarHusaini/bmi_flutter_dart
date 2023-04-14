import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.username, required this.password});
  final username;
  final password;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Color.fromARGB(255, 255, 255, 255),
  body: SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.flip_camera_android_outlined,
            color: Color.fromARGB(152, 255, 3, 238),
            size: 60,
          ),
          SizedBox(width: 10),
          Text(
            "login",
            style: TextStyle(
              color: Color.fromARGB(152, 255, 3, 238),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 5,
            ),
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                labelText: "Username",
                labelStyle: TextStyle(
                  color: Color.fromARGB(152, 255, 3, 238)),
                border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(152, 255, 3, 238)),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 5,
            ),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                labelText: "Password  ",
                labelStyle: TextStyle(
                  color: Color.fromARGB(152, 255, 3, 238)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          BorderSide(color: Color.fromARGB(152, 255, 3, 238)),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
         MaterialButton(
          padding: EdgeInsets.all(10),
          minWidth: 225,
          color: Color.fromARGB(152, 255, 3, 238),
          shape: StadiumBorder(),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: Text(
              "Login",
              key: ValueKey<bool>(true),
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            transitionBuilder: (child, animation) =>
                ScaleTransition(child: child, scale: animation),
          ),
            onPressed: () {
              if (_username.text.toString() != username[0].toString() ||
                  _password.text.toString() != password[0].toString()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('username atau password salah')),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(username: username),
                  ),
                );
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          TextButton(
            child: Text(
              "belum punya akun?",
              style: TextStyle(color: Color.fromARGB(152, 255, 3, 238)),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCustomForm()));
            },
          )
        ],
      ),
    ),
  ),
);
}
}
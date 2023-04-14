import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key = null, required this.username});
  final username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  late double _bmi = 0.0;

  void _calculateBMI() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    double heightInMeters = height / 100;

    double bmi = weight / (heightInMeters * heightInMeters);
    setState(() {
      _bmi = bmi;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    String cBMI;
    if (_bmi >= 28)
      cBMI = "Obese";
    else if (_bmi >= 23)
      cBMI = "Overweight";
    else if (_bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(152, 255, 3, 238),
        centerTitle: true,
        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: Text(widget.username[0]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color.fromARGB(99, 252, 97, 255),
                    child: Icon(
                      Icons.favorite,
                      color: Color.fromARGB(152, 255, 3, 238),
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(152, 255, 3, 238),
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _heightController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(152, 255, 3, 238),
                          hintText: 'Tinggi',
                          counterText: '',
                          prefixIcon: Icon(Icons.height),
                          suffixText: 'cm',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(152, 255, 3, 238),
                          hintText: 'Berat',
                          counterText: '',
                          prefixIcon: Icon(Icons.accessibility),
                          suffixText: 'kg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            RawMaterialButton(
              onPressed: _calculateBMI,
              elevation: 2.0,
              fillColor: Colors.white,
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(152, 255, 3, 238), Colors.pinkAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.calculate_rounded,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),

            Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(height: 20),
    Text(
      'Your BMI is:',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 20),
    Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(152, 255, 3, 238),
      ),
      child: Text(
        _bmi.toStringAsFixed(2),
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
          SizedBox(height: 20),
          Text(
                  cBMI,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
                        
          ],
        ),
      ),
    );
  }
}

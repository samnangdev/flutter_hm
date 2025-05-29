import 'package:flutter/material.dart';

class GetstartScreen extends StatefulWidget {
  const GetstartScreen({super.key});

  @override
  State<GetstartScreen> createState() => _GetstartScreenState();
}

class _GetstartScreenState extends State<GetstartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body);
  }

  Widget get _body {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            _logo,
            SizedBox(height: 10),
            Text(
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _logo {
    return Container(child: Image.asset("assets/images/logo.png"));
  }
}

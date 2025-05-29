import 'package:flutter/material.dart';
import 'package:samnang_hm/views/screens/login.dart';
import 'package:samnang_hm/views/screens/register.dart';

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
            SizedBox(height: 30),
            _logo,
            SizedBox(height: 30),
            Text(
              "Welcome",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text("Ready to start shopping. Sign up to get started."),
            SizedBox(height: 80),
            _getStartButton,
            SizedBox(height: 15),
            _textLogin,
          ],
        ),
      ),
    );
  }

  Widget get _textLogin {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginScreen();
                },
              ),
            );
          },
          child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget get _logo {
    return Container(child: Image.asset("assets/images/logo.png"));
  }

  Widget get _getStartButton {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple[400],
            minimumSize: Size(double.infinity, 50),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return RegisterScreen();
                },
              ),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:samnang_hm/views/screens/login.dart';
import 'package:samnang_hm/views/screens/opt_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  bool obsecureText = true;
  bool obsecureText1 = true;
  Widget build(BuildContext context) {
    return Scaffold(body: _body);
  }

  Widget get _body {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              _logo,
              SizedBox(height: 10),
              Text(
                "Register",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              // Text("Welcome back"),
              SizedBox(height: 20),
              _username,
              SizedBox(height: 20),
              _password,
              SizedBox(height: 20),
              _confirmPassword,
              SizedBox(height: 30),
              _registerButton,
              SizedBox(height: 10),
              _textLogin,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _username {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          decoration: InputDecoration(
            labelText: "Username",
            prefix: Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget get _password {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          obscureText: obsecureText,
          decoration: InputDecoration(
            labelText: "Password",
            prefix: Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obsecureText = false;
                });
              },
              icon: Icon(Icons.visibility),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }

  Widget get _confirmPassword {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          obscureText: obsecureText1,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            prefix: Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obsecureText1 = false;
                });
              },
              icon: Icon(Icons.visibility),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
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

  Widget get _registerButton {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
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
                  return OptScreen();
                },
              ),
            );
          },
          child: Text(
            "Register",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

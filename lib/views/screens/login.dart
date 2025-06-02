import 'package:flutter/material.dart';
import 'package:samnang_hm/views/screens/opt_screen.dart';
import 'package:samnang_hm/views/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool obsecureText = true;
  bool _isValidEmail = false;
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
              SizedBox(height: 30),
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              // Text("Welcome back"),
              SizedBox(height: 20),
              _email,
              SizedBox(height: 20),
              _password,
              SizedBox(height: 0),
              _forgetPassword,
              SizedBox(height: 0),
              _loginButton,
              SizedBox(height: 10),
              _textLogin,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _forgetPassword {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Forget Password?",
              style: TextStyle(color: const Color.fromARGB(153, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _email {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextField(
          onChanged: (value) {
            if (value.contains("@")) {
              setState(() {
                _isValidEmail = true;
              });
            }
          },
          decoration: InputDecoration(
            suffix:
                !_isValidEmail
                    ? Icon(Icons.check_circle_rounded)
                    : Icon(Icons.check_circle_rounded, color: Colors.green),
            labelText: "Email",
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

  Widget get _textLogin {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
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
            "Register",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget get _logo {
    return Container(child: Image.asset("assets/images/logo.png"));
  }

  Widget get _loginButton {
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
            "Login",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

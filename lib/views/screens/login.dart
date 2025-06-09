import 'package:flutter/material.dart';
import 'package:samnang_hm/data/user_shared_preference.dart';
import 'package:samnang_hm/views/screens/home_screen.dart';
import 'package:samnang_hm/views/screens/opt_screen.dart';
import 'package:samnang_hm/views/screens/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  bool _obsecurePassword = true;
  bool _isValidEmail = false;
  Widget build(BuildContext context) {
    return Scaffold(body: _body);
  }

  Widget get _body {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
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
        child: TextFormField(
          controller: _emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please input your email";
            }
            return null;
          },
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
        child: TextFormField(
          controller: _passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please input your Password";
            }
            return null;
          },
          obscureText: _obsecurePassword,
          decoration: InputDecoration(
            labelText: "Password",
            prefix: Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obsecurePassword = !_obsecurePassword;
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
            _loginFunc();
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _loginFunc() {
    // String fullName = _fullNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    if (_formKey.currentState?.validate() == true) {
      if (email.isEmpty || password.isEmpty) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Icon(Icons.warning, color: Colors.red, size: 80),
                content: Text("All fields are required."),
              ),
        );
        return;
      } else if (email == "Admin@admin.com" && password == "1234") {
        UserSharePreference.saveUserData("email", email); // fixed typo
        UserSharePreference.saveUserData("password", password);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Icon(Icons.warning, color: Colors.red, size: 80),
                content: Text("Invalid Email or Password."),
              ),
        );
        return;
      }
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Icon(Icons.warning, color: Colors.red, size: 80),
              content: Text("Please fill in all required fields."),
            ),
      );
    }
  }
}

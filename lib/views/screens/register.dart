import 'package:flutter/material.dart';
import 'package:samnang_hm/data/user_shared_preference.dart';
import 'package:samnang_hm/views/screens/home_screen.dart';
import 'package:samnang_hm/views/screens/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isValidEmail = false;
  bool _obsecurePassword = true;
  bool _obsecureConfirmPassword = true;
  bool obsecureText1 = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
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
                SizedBox(height: 10),
                Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                // Text("Welcome back"),
                SizedBox(height: 20),
                _fullName,
                SizedBox(height: 20),
                _email,
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
      ),
    );
  }

  Widget get _fullName {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: _fullNameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please input your Fullname";
            }
            return null;
          },
          // onChanged: (vaTextFieldlue) {
          //   // if (value.contains("@")) {
          //   //   setState(() {
          //   //     _isValidEmail = true;
          //   //   });
          //   // }
          // },
          decoration: InputDecoration(
            labelText: "Fullname",
            // suffix:
            //     !_isValidEmail
            //         ? Icon(Icons.check_circle_rounded)
            //         : Icon(Icons.check_circle_rounded, color: Colors.green),
            prefix: Icon(Icons.person),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
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
              return "Please fill in your Email";
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
            labelText: "Email",
            suffix:
                !_isValidEmail
                    ? Icon(Icons.check_circle_rounded)
                    : Icon(Icons.check_circle_rounded, color: Colors.green),
            prefix: Icon(Icons.email),
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
              return "Please fill in your Password";
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

  Widget get _confirmPassword {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          // controller: _confirmPasswordCon,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please fill in your Confirm Password";
            }
            return null;
          },
          obscureText: _obsecureConfirmPassword,
          decoration: InputDecoration(
            labelText: "Confirm Password",
            prefix: Icon(Icons.lock),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obsecureConfirmPassword = !_obsecureConfirmPassword;
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
            _registerFunc();
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return OptScreen();
            //     },
            //   ),
            // );
          },
          child: Text(
            "Register",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _registerFunc() {
    String fullName = _fullNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    print("$fullName, $email, $password");

    if (_formKey.currentState?.validate() == true) {
      if (fullName.isEmpty || email.isEmpty || password.isEmpty) {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Icon(Icons.warning, color: Colors.red, size: 80),
                content: Text("All fields are required."),
              ),
        );
        return;
      }

      UserSharePreference.saveUserData("fullname", fullName);
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
              content: Text("Please fill in all required fields."),
            ),
      );
    }
  }

  // _registerFunc() {
  //   String fullName = _fullNameController.text;
  //   String email = _emailController.text;
  //   String password = _passwordController.text;
  //   // String confirmPassword = _confirmPasswordController.text;

  //   if (_formKey.currentState?.validate() == true) {
  //     UserSharePreference.saveUserData("fullname", fullName);
  //     UserSharePreference.saveUserData("email", email);
  //     UserSharePreference.saveUserData("password", password);

  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) {
  //           return HomeScreen();
  //         },
  //       ),
  //     );
  //   } else {
  //     final alertDialog = AlertDialog(
  //       title: Icon(Icons.warning, color: Colors.red, size: 80),
  //       content: Text("Plean fill in your fullname"),
  //     );
  //     showDialog(context: context, builder: (context) => alertDialog);
  //   }
  // }
}

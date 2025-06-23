import 'package:flutter/material.dart';
import 'package:samnang_hm/data/user_shared_preference.dart';
import 'package:samnang_hm/views/screens/login.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String fullName = "Guest";
  String Email = "Guest@gmail.com";

  @override
  void initState() {
    super.initState();
    _fetchFullname();
    _fetchEmail();
  }

  Future<void> _fetchFullname() async {
    String? name = await UserSharePreference.getUserData("fullname");
    // print("Fetched fullname: $name",); // Add this line
    if (name != null) {
      setState(() {
        fullName = name;
      });
    }
  }

  Future<void> _fetchEmail() async {
    String? email = await UserSharePreference.getUserData("email");
    // print("Fetched fullemail: $email",); // Add this line
    if (email != null) {
      setState(() {
        Email = email;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            _profile,
            SizedBox(height: 40),
            _userData,
            SizedBox(height: 330),
            _logoutButton,
          ],
        ),
      ),
    );
  }

  Widget get _profile {
    return CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage('assets/images/logo.png'),
    );
  }

  Widget get _userData {
    return Column(
      children: [
        Text(
          "$fullName",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        SizedBox(height: 15),
        Text("$Email", style: TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget get _logoutButton {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple[400],
          minimumSize: Size(double.infinity, 50),
        ),
        onPressed: () {
          logoutFunc();
        },
        child: Text(
          "Logout",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
    );
  }

  void logoutFunc() async {
    // Clear saved user data
    await UserSharePreference.removeUserData("fullname");
    await UserSharePreference.removeUserData("email");

    // Navigate to GetStartScreen and clear the navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }
}

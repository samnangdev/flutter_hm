import 'package:flutter/material.dart';
import 'package:samnang_hm/data/user_shared_preference.dart';
import 'package:samnang_hm/views/screens/account_screen.dart';
import 'package:samnang_hm/views/screens/custom_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = "Guest";
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text("Home Page")),
    Center(child: Text("Favorite Page")),
    Center(child: Text("Cart Page")),
    Center(child: AccountScreen()),
  ];

  @override
  void initState() {
    super.initState();
    _fetchFullname();
  }

  Future<void> _fetchFullname() async {
    String? name = await UserSharePreference.getUserData("fullname");
    if (name != null) {
      setState(() {
        fullName = name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Hi, $fullName",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              // Notifications action
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: _menu,
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Cart",
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_rounded),
            label: "Account",
          ),
        ],
      ),
    );
  }

  Widget get _account {
    return Column(children: [Text("Hi")]);
  }

  Widget get _menu {
    return SafeArea(child: Container(child: Drawer()));
  }
}

// class _HomeScreenState extends State<HomeScreen> {
//   // final prefs = await SharedPreferences.getIns

//   String fullName = "Guest";
//   @override
//   void initState() {
//     super.initState();
//     _fetchFullname();
//   }

//   Future<void> _fetchFullname() async {
//     String? name = await UserSharePreference.getUserData("fullname");
//     if (name != null) {
//       setState(() {
//         fullName = name;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Text(
//               "Hi, $fullName",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),

//         actions: [
//           GestureDetector(
//             onTap: () {
//               showSearch(context: context, delegate: CustomSearchDelegate());
//             },
//             child: Icon(Icons.search),
//           ),

//           // IconButton(
//           //   onPressed: () {
//           //     // isDarkModeNotifier.value = !isDarkModeNotifier.value;
//           //   },
//           //   icon: Icons.ring,
//           //   // icon: ValueListenableBuilder(
//           //   //   valueListenable: isDarkModeNotifier,
//           //   //   builder: (context, isDarkMode, child) {
//           //   //     return Icon(
//           //   //       isDarkMode ? Icons.dark_mode : Icons.light_mode,
//           //   //     );
//           //   //   },
//           //   // ),
//           // ),
//           // IconButton(
//           //   onPressed: () {
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(
//           //         builder: (context) {
//           //           return SearchScreen();
//           //         },
//           //       ),
//           //     );
//           //   },
//           //   icon: Icon(Icons.search),
//           // ),
//           IconButton(
//             onPressed: () {
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(
//               //     builder: (context){
//               //       return SettingPage(
//               //         title: "Setting page",
//               //       );
//               //   },
//               // ),
//               // );
//             },
//             icon: Icon(Icons.notifications),
//           ),
//         ],
//       ),
//       drawer: _menu,
//       body: _body,
//       bottomNavigationBar: _bottomNavigationBar,
//     );
//   }

//   Widget get _body {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [Text("Body")],
//       ),
//     );
//   }

//   Widget get _bottomNavigationBar {
//     return NavigationBar(
//       destinations: [
//         NavigationDestination(icon: Icon(Icons.home), label: "Home"),
//         NavigationDestination(
//           icon: Icon(Icons.favorite_border),
//           label: "Favorite",
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.shopping_cart_rounded),
//           label: "Cart",
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.account_circle_rounded),
//           label: "Account",
//         ),
//       ],
//     );
//   }

//   Widget get _menu {
//     return SafeArea(child: Container(child: Drawer()));
//   }
// }

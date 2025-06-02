import 'package:flutter/material.dart';
import 'package:samnang_hm/views/screens/custom_search_delegate.dart';
import 'package:samnang_hm/views/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Hi, Samnang", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),

        actions: [
          GestureDetector(
            onTap: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
            child: Icon(Icons.search),
          ),

          // IconButton(
          //   onPressed: () {
          //     // isDarkModeNotifier.value = !isDarkModeNotifier.value;
          //   },
          //   icon: Icons.ring,
          //   // icon: ValueListenableBuilder(
          //   //   valueListenable: isDarkModeNotifier,
          //   //   builder: (context, isDarkMode, child) {
          //   //     return Icon(
          //   //       isDarkMode ? Icons.dark_mode : Icons.light_mode,
          //   //     );
          //   //   },
          //   // ),
          // ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return SearchScreen();
          //         },
          //       ),
          //     );
          //   },
          //   icon: Icon(Icons.search),
          // ),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context){
              //       return SettingPage(
              //         title: "Setting page",
              //       );
              //   },
              // ),
              // );
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: _menu,
      body: _body,
      bottomNavigationBar: _bottomNavigationBar,
    );
  }

  Widget get _body {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Body")],
      ),
    );
  }

  Widget get _bottomNavigationBar {
    return NavigationBar(
      destinations: [
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
    );
  }

  Widget get _menu {
    return SafeArea(child: Container(child: Drawer()));
  }
}

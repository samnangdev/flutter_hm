import 'package:flutter/material.dart';
import 'package:samnang_hm/data/user_shared_preference.dart';
import 'package:samnang_hm/views/screens/account_screen.dart';
import 'package:samnang_hm/views/screens/custom_search_delegate.dart';
import 'package:samnang_hm/services/category_service.dart';
import 'package:samnang_hm/model/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fullName = "Guest";
  int _selectedIndex = 0;
  List<Category> _categories = [];
  final CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    _fetchFullname();
    _loadCategories();
  }

  Future<void> _fetchFullname() async {
    String? name = await UserSharePreference.getUserData("fullname");
    if (name != null) {
      setState(() {
        fullName = name;
      });
    }
  }

  Future<void> _loadCategories() async {
    List<Category> categories = await _categoryService.retrieveCategory();
    setState(() {
      _categories = categories;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomePage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category horizontal menu bar
        SizedBox(
          height: 60,
          child:
              _categories.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade100,
                          ),
                          onPressed: () {
                            // You can handle category filter here
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Selected: ${category.name}"),
                              ),
                            );
                          },
                          child: Text(category.name ?? "Unnamed"),
                        ),
                      );
                    },
                  ),
        ),

        const SizedBox(height: 10),

        // Placeholder for additional content
        Expanded(child: Center(child: Text("Select a category"))),
      ],
    );
  }

  late final List<Widget> _pages = [
    _buildHomePage(),
    Center(child: Text("Shop Page")),
    Center(child: Text("Favorite Page")),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi, $fullName",
          style: TextStyle(fontWeight: FontWeight.bold),
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
              // Notifications or cart action
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: _menu,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Me",
          ),
        ],
      ),
    );
  }

  Widget get _menu {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Menu")),
            ListTile(
              title: const Text("Account"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

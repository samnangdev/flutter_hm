import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:samnang_hm/data/db_manager.dart';
import 'package:samnang_hm/model/category.dart';
import 'package:samnang_hm/services/category_service.dart';
import 'package:samnang_hm/views/screens/getstart_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Insert Data
  List<String> categoryItems = [
    "Electronics",
    "Toys",
    "Clothes",
    "Shoes",
    "Books",
  ];
  final categoryService = CategoryService();
  for (var item in categoryItems) {
    final category = Category(name: item, nameKm: item);
    categoryService.insertCategory(category);
  }

  print("Here's data from table:");
  await DbManager.instance?.database;
  List<Category> categories = await categoryService.retrieveCategory();
  print("Categories: $categories");
  runApp(const App());
}

Future<void> readDataFromAsset() async {
  final file = await rootBundle.loadString('assets/data/data.txt');
  print("Data from assets: $file");
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const GetstartScreen(),
    );
  }
}

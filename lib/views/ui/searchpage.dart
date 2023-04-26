import 'package:flutter/material.dart';
import 'package:flutter_online_shop/views/shared/appstyle.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "SearchPage",
          style: appstyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}

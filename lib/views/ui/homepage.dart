import 'package:flutter/material.dart';
import 'package:flutter_online_shop/views/shared/appstyle.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late final TabController _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height*0.4,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/top_image.png"), fit: BoxFit.fill)
              ),
              child: Container(
                padding: EdgeInsets.only(left: 8, bottom: 15),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Athletics Shoes", style: appstyleWithHt(42, Colors.white, FontWeight.bold, 1.2),),
                    Text("Collection", style: appstyleWithHt(42, Colors.white, FontWeight.bold, 1.2),),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

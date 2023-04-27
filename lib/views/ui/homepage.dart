import 'package:flutter/material.dart';
import 'package:flutter_online_shop/views/shared/appstyle.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/top_image.png"),
                    fit: BoxFit.fill)),
            child: Container(
              padding: EdgeInsets.only(left: 8, bottom: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Athletics Shoes",
                    style:
                        appstyleWithHt(42, Colors.white, FontWeight.bold, 1.2),
                  ),
                  Text(
                    "Collection",
                    style:
                        appstyleWithHt(42, Colors.white, FontWeight.bold, 1.2),
                  ),
                  TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                      unselectedLabelColor: Colors.grey.withOpacity(0.3),
                      tabs: const [
                        Tab(
                          text: "Men Shoes",
                        ),
                        Tab(
                          text: "Women Shoes",
                        ),
                        Tab(
                          text: "Kids Shoes",
                        ),
                      ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.265),
            child: Container(
              padding: EdgeInsets.only(left: 12),
              child: TabBarView(controller: _tabController, children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.405,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Latest Shoes",
                              style:
                                  appstyle(24, Colors.black, FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Show All",
                                  style: appstyle(
                                      22, Colors.black, FontWeight.w500),
                                ),
                                Icon(
                                  AntDesign.caretright,
                                  size: 20,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      color: Colors.amber,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.405,
                      color: Colors.red,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.405,
                      color: Colors.blue,
                    )
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}

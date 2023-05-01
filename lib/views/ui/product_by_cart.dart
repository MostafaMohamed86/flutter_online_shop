import 'package:flutter/material.dart';
import 'package:flutter_online_shop/models/sneaker_model.dart';
import 'package:flutter_online_shop/services/helper.dart';
import 'package:flutter_online_shop/views/shared/appstyle.dart';
import 'package:flutter_online_shop/views/shared/category_btn.dart';
import 'package:flutter_online_shop/views/shared/custom_spacer.dart';
import 'package:flutter_online_shop/views/shared/latest_shoes.dart';
import 'package:flutter_online_shop/views/shared/stagger_tile.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductByCart extends StatefulWidget {
  const ProductByCart({super.key});

  @override
  State<ProductByCart> createState() => _ProductByCartState();
}

class _ProductByCartState extends State<ProductByCart>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  late Future<List<Sneakers>> _male;
  late Future<List<Sneakers>> _female;
  late Future<List<Sneakers>> _kids;

  void getMale() {
    _male = Helper().getMaleSneakers();
  }

  void getFemale() {
    _female = Helper().getFemaleSneakers();
  }

  void getKids() {
    _kids = Helper().getKidsSneakers();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMale();
    getFemale();
    getKids();
  }

  List<String> brand = [
    "assets/images/adidas.png",
    "assets/images/gucci.png",
    "assets/images/jordan.png",
    "assets/images/nike.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(6, 12, 16, 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          AntDesign.close,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          filter();
                        },
                        child: const Icon(
                          FontAwesome.sliders,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  TabBar(
                      padding: EdgeInsets.zero,
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
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.175,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  LatestShoes(male: _male),
                  LatestShoes(male: _female),
                  LatestShoes(male: _kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double _value = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.84,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.white),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 5,
              width: 40,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    "Filter",
                    style: appstyle(40, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Gender",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  Row(
                    children: const [
                      CategoryBtn(buttonClr: Colors.black, label: "Men"),
                      CategoryBtn(buttonClr: Colors.grey, label: "Women"),
                      CategoryBtn(buttonClr: Colors.grey, label: "Kids")
                    ],
                  ),
                  Text(
                    "Category",
                    style: appstyle(20, Colors.black, FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      CategoryBtn(buttonClr: Colors.black, label: "Shoes"),
                      CategoryBtn(buttonClr: Colors.grey, label: "Apparrels"),
                      CategoryBtn(buttonClr: Colors.grey, label: "Accessories")
                    ],
                  ),
                  const CustomSpacer(),
                  Text(
                    "Price",
                    style: appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Slider(
                    value: _value,
                    activeColor: Colors.black,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.black,
                    max: 500,
                    divisions: 50,
                    label: _value.toString(),
                    onChanged: (double value) {},
                  ),
                  const CustomSpacer(),
                  Text("Brand", style: appstyle(20, Colors.black, FontWeight.bold),),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    height: 80,
                    child: ListView.builder(
                      itemCount: brand.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.all(Radius.circular(12))
                            ),
                            child: Image.asset(brand[index],
                            height: 60,
                            width: 80,
                            color: Colors.black,
                            ),
                          ),
                          );
                      },),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

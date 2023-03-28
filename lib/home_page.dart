// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_brace_in_string_interps

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_galaxy/constants.dart';
import 'package:flutter_galaxy/detail_page.dart';
import 'package:flutter_galaxy/swiper_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: gradientEndColor,
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      gradientStartColor.withOpacity(0.8),
                      gradientEndColor
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.3, 0.7])),
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Padding(
                    // padding: const EdgeInsets.all(30.0)
                    padding: EdgeInsets.fromLTRB(32, 32, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                'Solar System',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 24,
                                  color: const Color(0x7cdbf1ff),
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                          onChanged: (value) {},
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Image.asset('assets/drop_down_icon.png'),
                          ),
                          underline: SizedBox(),
                        ),
                        // SizedBox(
                        //   height: 50,
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    padding: EdgeInsets.only(left: 32),
                    // color: Colors.black12,
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      pagination: DotSwiperPaginationBuilder(
                        activeSize: 10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) => DetailPage(
                                      planetInfo: planets[index],
                                    )
                                    ));
                          },
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 100,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 100,
                                    child: Card(
                                      elevation: 9,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32)),
                                      color: Colors.white,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 0, 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 150,
                                            ),
                                            Text(
                                              planets[index].name!,
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 44,
                                                color: const Color(0xff47455f),
                                                fontWeight: FontWeight.w900,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              'Solar System',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 23,
                                                color: primaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_right_alt,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: 120,
                                right: 10,
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 200,
                                    color: primaryTextColor.withOpacity(0.1),
                                    fontWeight: FontWeight.w900,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Hero(
                                tag: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 00),
                                  child: Container(
                                    child: Image.asset(
                                      planets[index].iconImage!,
                                      // scale: 2,
                                      height: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ]))),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32)),
            color: navigationColor,
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/menu_icon.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/profile_icon.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/search_icon.png'),
              )
            ],
          ),
        ));
  }
}

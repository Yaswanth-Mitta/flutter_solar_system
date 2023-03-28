// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables ,use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_galaxy/constants.dart';
import 'package:flutter_galaxy/swiper_data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Text(
                            planetInfo.name!,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 56,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Solar System',
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 31,
                                color: primaryTextColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.left,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            planetInfo.description ?? " ",
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 15,
                                color: contentTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.black38,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: Text(
                        'Gallery',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 25,
                            color: Color(0xff47455f)),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 15, 2, 15),
                      child: Container(
                        height: 250,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: planetInfo.images.length,
                            itemBuilder: (context, index) {
                              return Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      planetInfo.images[index]!,
                                      fit: BoxFit.cover,
                                    )),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              Hero(
                tag: 1,
                child: Padding(
          
                  padding: EdgeInsets.fromLTRB(110, 30, 0, 0),
                  
                  child: Image.asset(planetInfo.iconImage!),
                ),
              ),
              Positioned(
                left: 30,
                  child: Text(
                planetInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 250,
                  color: primaryTextColor.withOpacity(0.1),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              )),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios_new),
              )
            ],
          )),
    );
  }
}

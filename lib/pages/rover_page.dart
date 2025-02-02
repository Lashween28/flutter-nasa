import 'dart:ui';

import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_nasa/pages/detail.dart';
import 'package:flutter_nasa/widgets/blurred_image.dart';

class RoverPage extends StatelessWidget {
  const RoverPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> rovers = <String>[
      'Curiosity',
      'Spirit',
      'Opportunity',
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 125, 125),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 15,
            backgroundColor: Color.fromARGB(255, 19, 17, 17),
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 25.0, bottom: 30),
                title: Text(
                  "Mars Rovers",
                  style: TextStyle(
                      fontFamily: 'ChakraPetch',
                      fontSize: 30,
                      color: Colors.white),
                ),
                background: ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(200)),
                    child: Image.asset("images/mars-nasa.jpg",
                        fit: BoxFit.cover))),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(200), //200 ,200
            )),
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.250,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final String rover = rovers[index].toLowerCase();
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return DetailsPage(rover: rover);
                    }));
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 100),
                          spreadRadius: 0.11,
                          blurRadius: 3000,
                          blurStyle: BlurStyle.inner,
                          color: Colors.grey)
                    ]),
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20).copyWith(
                              bottomRight: Radius.zero,
                              bottomLeft: Radius.zero),
                          child: BlurredImage(
                            image: Image.asset(
                              'images/$rover.jpg',
                              height: 260,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                  ));
            },
            childCount: rovers.length,
          )),
        ],
      ),
      // appBar: AppBar(
      //   elevation: 15,
      //   backgroundColor: Colors.black,
      //   flexibleSpace: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //         //200 ,200
      //         bottomRight: Radius.circular(200)),
      //     child: Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //             image: AssetImage("images/mars-nasa.jpg"),
      //             fit: BoxFit.fill),
      //       ),
      //     ),
      //   ),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //     bottomRight: Radius.circular(200), //200 ,200
      //   )),
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(200),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.only(left: 46.0),
      //           child: Row(
      //             children: [
      //               Text(
      //                 "The Mars",
      //                 style: TextStyle(
      //                     fontFamily: 'ChakraPetch',
      //                     fontSize: 60,
      //                     color: Colors.white),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 48.0),
      //           child: Text(
      //             "Rovers",
      //             style: TextStyle(
      //                 fontFamily: 'ChakraPetch',
      //                 fontSize: 50,
      //                 color: Colors.white),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 60,
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      // body: Center(
      //     child: ListView.builder(
      //         itemCount: rovers.length,
      //         itemBuilder: ((context, index) {
      //           final String rover = rovers[index].toLowerCase();
      //           return GestureDetector(
      //               onTap: () {
      //                 Navigator.of(context)
      //                     .push(MaterialPageRoute(builder: (context) {
      //                   return DetailsPage(rover: rover);
      //                 }));
      //               },
      //               child: Container(
      //                 child: Image.asset(
      //                   'images/$rover.jpg',
      //                   height: 250,
      //                   fit: BoxFit.fill,
      //                 ),
      //               ));
      //         })))
    );
  }
}

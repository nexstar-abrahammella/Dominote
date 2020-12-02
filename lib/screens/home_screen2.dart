import 'package:apuntalo/utilities/styles.dart';
import 'package:flutter/material.dart';
import 'package:apuntalo/utilities/styles.dart';

class HomeScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: blue500,
//        elevation: 0,
//      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(gradient: headerGradient),
            height: 280,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Apúntalo',
                          style: TextStyle(
                              color: whiteColor,
                              fontFamily: 'Monserrat',
                              fontSize: 25),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

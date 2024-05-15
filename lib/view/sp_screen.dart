import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:fortniteui/view/home_page.dart';

class SpScreen extends StatefulWidget {
  const SpScreen({super.key});

  @override
  State<SpScreen> createState() => _SpScreenState();
}

class _SpScreenState extends State<SpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/iPhone 14 Pro Max - 1.png',
                ))),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/Rectangle 1.png',
                fit: BoxFit.fill,
              ),
            ),
            const Positioned(
              top: 74,
              left: 10,
              child: Text(
                'WELCOME TO \nWEPLAYED',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/WEPLAYED.png',
                height: MediaQuery.of(context).size.height * .75,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/spScreen.png',
                height: MediaQuery.of(context).size.height * .75,
              ),
            ),
            Positioned(
              bottom: 0,
              child: BlurryContainer(
                blur: 4,
                height: 250,
                width: MediaQuery.of(context).size.width,
                elevation: 0,
                color: Colors.transparent.withOpacity(.01),
                padding: const EdgeInsets.all(8),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>  HomePage(),
                        ),
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        gradient: LinearGradient(
                            begin: const Alignment(0.00, -1.00),
                            end: const Alignment(0, 1),
                            colors: [
                              const Color(0xffFFFFFF),
                              const Color(0xff00FFFF),
                              const Color(0xff00FFFF),
                              const Color(0xff00FFFF),
                              const Color(0xff00FFFF).withOpacity(.46),
                            ],
                            stops: const [
                              0,
                              0,
                              0.23,
                              0.46,
                              100
                            ]),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Get Started',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortniteui/const.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../utils.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageBackgound,
      bottomNavigationBar: PersistentTabView(
        context,
        controller: controller,
        screens: [HomePage(), HomePage()],
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.home),
            title: ("Home"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
          PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.home),
            title: ("Home"),
            activeColorPrimary: CupertinoColors.activeBlue,
            inactiveColorPrimary: CupertinoColors.systemGrey,
          ),
        ],
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 57,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skins List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.menu,
                  size: 32,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 35, horizontal: 28),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.02),
                spreadRadius: 7,
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ]),
            child: SizedBox(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'type something.........',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.white,
                      ),
                      suffixIcon: const SizedBox(
                        width: 65,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 40,
                              child: VerticalDivider(
                                endIndent: 2,
                                indent: 2,
                                color: Colors.white,
                                thickness: 2,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 25,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 18,
                            )
                          ],
                        ),
                      ),
                      disabledBorder: inputStyle,
                      focusedBorder: inputStyle,
                      enabledBorder: inputStyle,
                      filled: true,
                      fillColor: inputfilled,
                      contentPadding: const EdgeInsets.all(23),
                      border: inputStyle),
                )),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Text(
              'Most Popular Skins',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
              shrinkWrap: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 5.0, // spacing between rows
                crossAxisSpacing: 10.0, // spacing between columns
                mainAxisExtent: 200,
              ),
              itemCount: skinData.length, // total number of items
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 50,
                            color: convertHexToInt(skinData[index]['color']))
                      ], shape: BoxShape.circle),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: BlurryContainer(
                          height: 160,
                          blur: 100,
                          elevation: 0,
                          color: Colors.transparent.withOpacity(.01),
                          padding: const EdgeInsets.all(8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Container(),
                        ),
                      ),
                    ),
                    Positioned.fill(
                        child: Image.asset(
                      "assets/images/${skinData[index]['image']}.png",
                      fit: BoxFit.contain,
                      width: 128,
                      height: 200,
                    )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BlurryContainer(
                        blur: 26,
                        height: 59,
                        width: MediaQuery.of(context).size.width,
                        elevation: 0,
                        color: Colors.transparent.withOpacity(.01),
                        padding: const EdgeInsets.all(8),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                skinData[index]['name'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i < skinData[index]['stars'];
                                        i++)
                                      Image.asset(
                                        'assets/images/Star.png',
                                        fit: BoxFit.contain,
                                        width: 10,
                                        height: 8,
                                      )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

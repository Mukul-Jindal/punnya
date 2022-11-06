import 'package:delhihackathon/screens/home/Community.dart';
import 'package:delhihackathon/screens/home/Details_NGO.dart';
import 'package:delhihackathon/screens/home/home.dart';
import 'package:delhihackathon/screens/home/profile.dart';
import 'package:flutter/material.dart';


class Tabbar extends StatefulWidget {
  const Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xffB97EC1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedTab = 0;
                });
              },
              icon: _selectedTab == 0
                  ? const Icon(
                Icons.home_filled,
                color: Color(0xff83458A),
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Color(0xff83458A),
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedTab = 1;
                });
              },
              icon: _selectedTab == 1
                  ? const Icon(
                Icons.work_rounded,
                color: Color(0xff83458A),
                size: 35,
              )
                  : const Icon(
                Icons.work_outline_outlined,
                color: Color(0xff83458A),
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedTab = 2;
                });
              },
              icon: _selectedTab == 2
                  ? const Icon(
                Icons.widgets_rounded,
                color: Color(0xff83458A),
                size: 35,
              )
                  : const Icon(
                Icons.widgets_outlined,
                color: Color(0xff83458A),
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedTab = 3;
                });
              },
              icon: _selectedTab == 3
                  ? const Icon(
                Icons.person,
                color: Color(0xff83458A),
                size: 35,
              )
                  : const Icon(
                Icons.person_outline,
                color: Color(0xff83458A),
                size: 35,
              ),
            ),
          ],
        ),
      ),
      body: Stack(


        children: [
          renderView(0, Home()),
          renderView(1, Explore()),
          renderView(2, Community()),
          renderView(3, Profile()),

        ],
      ),
    );
  }
  Widget renderView(int tabIndex,Widget view)
  {
    return IgnorePointer(

      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab==tabIndex?1:0,
        child: view,
      ),
    );
  }
}

import 'package:delhihackathon/screens/home/Community.dart';
import 'package:delhihackathon/screens/home/Details_NGO.dart';
import 'package:delhihackathon/screens/home/home.dart';
import 'package:delhihackathon/screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class Bottom_Navigation extends StatefulWidget {
  const Bottom_Navigation({Key? key}) : super(key: key);

  @override
  Bottom_NavigationState createState() => Bottom_NavigationState();
}

class Bottom_NavigationState extends State<Bottom_Navigation> {
    int _selectedTab =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(


        children: [
        renderView(0, Home()),
    renderView(1, Explore()),
    renderView(2,Community()),
    renderView(3, Profile()),

    ],),
      extendBody: true,
      bottomNavigationBar: Stack(
        // padding: EdgeInsets.only(bottom: 10),
        children: [DotNavigationBar(

          // margin: EdgeInsets.only(left: 10, right: 10),
          currentIndex: _selectedTab,
          onTap: (index){
            setState((){
              this._selectedTab=index;
            });
          },
          dotIndicatorColor: Colors.transparent,
          unselectedItemColor: Colors.grey[300],
          // enableFloatingNavBar: false,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: Icon(Icons.home),
              selectedColor: Color(0xff73544C),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: Icon(Icons.favorite),
              selectedColor: Color(0xff73544C),
            ),

            /// Search
            DotNavigationBarItem(
              icon: Icon(Icons.search),
              selectedColor: Color(0xff73544C),
            ),


            /// Profile
            DotNavigationBarItem(
              icon: Icon(Icons.person),
              selectedColor: Color(0xff73544C),

            ),
          ],
        ),]
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


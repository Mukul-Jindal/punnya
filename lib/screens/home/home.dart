// ignore_for_file: prefer_const_constructors

import 'package:delhihackathon/screens/home/MakeNGOProfile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:requests/requests.dart';
import 'package:provider/provider.dart';
import 'package:delhihackathon/models/user.dart';

import 'package:delhihackathon/screens/home/profile.dart';

import '../../services/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getQuote() async {
    await Requests.get(
      "https://charity-quotes.basiclucifer.repl.co/quote",
    ).then(
      (value) => setState(() {
        quote = value.json()['quote'];
        author = value.json()['author'];
      }),
    );
  }

  String quote = '', author = '';

  bool isBuilt = false;

  @override
  Widget build(BuildContext context) {
    if (!isBuilt) {
      getQuote();
      setState(() {
        isBuilt = !isBuilt;
      });
    }
    final user = Provider.of<UserUid?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseServices(uid: user?.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.requireData;
            String namee = userData.name.toString();
            return Scaffold(
              backgroundColor:Color(0xFF83458A) ,
              extendBody: true,
              body: SafeArea(
                child: SingleChildScrollView(

                  child: Container(
                     color: Colors.white,


                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
                        color: Color(0xFF83458A),
                      child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                              Text(
                                "Hi $namee !",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF9DBEE),
                                ),
                              ),

                            Container(child: IconButton(
                              icon:Icon(Icons.article_outlined),
                              onPressed: ()
                              {
                                setState(() {
                                  Navigator.pushNamed(context,'/ngoprofile');
                                });
                              },
                                ),)
                          ],
                        ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, bottom: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xFF83458A),
                          ),
                          child: Text(
                            'Well done is better than well said',

                            style: TextStyle(
                              color: Color(0xFFF9DBEE),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 7,
                          decoration: BoxDecoration(
                            color: Color(0xFF83458A),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xFFB97EC1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    quote,
                                    style: TextStyle(color: Color(0xFFF9DBEE)),
                                  ),
                                ),
                                Text(
                                  quote != '' && author != '' ? '~$author' : '',
                                  style: TextStyle(color: Color(0xFFF9DBEE)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 2),
                          height: MediaQuery.of(context).size.height / 6,
                          padding: EdgeInsets.all(6),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(color: Color(0xFF83458A)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(13, 0, 20,0),
                                child: Text(
                                  "Focus",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xFFFFFAF8)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  RowItem(
                                    imageSource:
                                        'assests/home_page/health-insurance (2).png',
                                    feildName: 'HealthCare',
                                  ),
                                  RowItem(
                                    imageSource:
                                        'assests/home_page/environmental.png',
                                    feildName: 'Environmental',
                                  ),
                                  RowItem(
                                    imageSource: 'assests/home_page/shelters.png',
                                    feildName: 'Shelters',
                                  ),
                                  RowItem(
                                    imageSource:
                                        'assests/home_page/social-causes.png',
                                    feildName: 'Social Causes',
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Text(
                            "Ongoing Campaign",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF040004),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                          child: Text(
                            "NGOs Near You",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF040004),
                            ),
                          ),
                        ),
                        Container(

                          height: MediaQuery.of(context).size.height / 4.5,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                              OngoingCampaignItem(
                                imageSource: 'assests/home_page/stock-image-1.png',
                                title: "Help Poor",
                                info:
                                    "Make a donation to help the hungry get food.",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Profile();
          }
        });
  }
}

class OngoingCampaignItem extends StatelessWidget {
  const OngoingCampaignItem({
    Key? key,
    required this.imageSource,
    required this.title,
    required this.info,
  }) : super(key: key);

  final String imageSource, title, info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF83458A),
            offset: Offset(0, 1.5),
            blurRadius: 2,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(0, 0),
            blurRadius: 0,
            spreadRadius: 0,
          )
        ],
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageSource,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF83458A),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Text(
              info,
              style: TextStyle(
                color: Color(0xFFB97EC1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({
    Key? key,
    required this.imageSource,
    required this.feildName,
  }) : super(key: key);

  final String imageSource, feildName;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        width: MediaQuery.of(context).size.height / 12,
        height: MediaQuery.of(context).size.height / 13,
        decoration: BoxDecoration(
          color: Color(0xFFB97EC1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Image.asset(imageSource),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: Text(
          feildName,
          style: TextStyle(
            color: Color(0xFFFFFAF8),
            fontSize: 13,
          ),
        ),
      )
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';
import '../../services/database.dart';
import 'bnb.dart';

class NgoCard extends StatefulWidget {
  const NgoCard({Key? key}) : super(key: key);

  @override
  State<NgoCard> createState() => _NgoCardState();
}

class _NgoCardState extends State<NgoCard> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserUid?>(context);
    return
      StreamBuilder<NgoData>(
          stream: DatabaseServices(uid: user?.uid).ngoData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              NgoData ngoData = snapshot.requireData;
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(178, 112, 162, 0.17000000178813934),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/en/5/53/Chun-Li.png'),
                            radius: 35,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ngoData.organization_name.toString(),
                                  style: TextStyle(
                                    color: Color.fromRGBO(131, 69, 138, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ngoData.organization_info.toString(),
                                  style: TextStyle(
                                    color: Color.fromRGBO(131, 69, 138, 1),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assests/explore_page/Placeholder1.png"),
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      ngoData.organization_location.toString(),
                                      style: TextStyle(
                                        color: Color.fromRGBO(131, 69, 138, 1),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            178, 112, 162, 0.17000000178813934),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "Nature",
                                        style: TextStyle(
                                          color: Color.fromRGBO(131, 69, 138, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            178, 112, 162, 0.17000000178813934),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: Text(
                                        "Shelter",
                                        style: TextStyle(
                                          color: Color.fromRGBO(131, 69, 138, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            }
            else
            {
              return Tabbar();
            }
          });
  }
}


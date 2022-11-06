import 'package:delhihackathon/screens/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/info_model.dart';

class ProfilePageInfo extends StatefulWidget {
  const ProfilePageInfo({Key? key}) : super(key: key);

  @override
  State<ProfilePageInfo> createState() => _ProfilePageInfoState();
}

class _ProfilePageInfoState extends State<ProfilePageInfo> {
  @override
  Widget build(BuildContext context) {
    final information = Provider.of<List<Info>?>(context)??[];

    if (information != null) {
      information.forEach((element) {
        print(element.name);
        print(element.city);
        print(element.age);
      });
    }

      return ListView.builder(
          itemCount: information.length,
          itemBuilder: (context, index) {
            return Profile();
          }
      );
    }
  }

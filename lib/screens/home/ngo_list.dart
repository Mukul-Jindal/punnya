import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/info_model.dart';
import 'ngo_card.dart';


class NgoList extends StatefulWidget {
  const NgoList({Key? key}) : super(key: key);

  @override
  State<NgoList> createState() => _BrewListState();
}

class _BrewListState extends State<NgoList> {
  @override
  Widget build(BuildContext context) {
    final ngos = Provider.of<List<Ngo>?>(context)??[];

    if (ngos!=null) {
      ngos.forEach((element) {
        print(element.organization_name);
        print(element.organization_info);
        print(element.organization_location);
      });
    }


    return ListView.builder(
        itemCount: ngos.length,
        itemBuilder:(context,index)
        {
          return NgoCard();
        }
    );
  }
}

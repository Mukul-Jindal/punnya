import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delhihackathon/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/info_model.dart';

class DatabaseServices {
  final String? uid;
  DatabaseServices({this.uid});

  //info collection
  final CollectionReference inforcollection =
      FirebaseFirestore.instance.collection('info');

//ngocollection
  final CollectionReference ngoinforcollection =
      FirebaseFirestore.instance.collection('ngoinfo');

  Future updateUserData(
    String name,
    String phone,
    String city,
    String age,
    // String organization_name,
    // String organization_location,
    // String organization_info,String organization_connectivity,String organization_other_contact,
    // String organization_bank_details,String organization_focus,String organization_donation_featured,
    // String  organization_donation_socialmedia_link
  ) async {
    return await inforcollection.doc(uid).set({
      'name': name,
      'phone': phone,
      'city': city,
      'age': age,
      // 'organization_name':organization_name,
//       'organization_location':organization_location,
//       'organization_info':organization_info,
//     'organization_connectivity':organization_connectivity,
//     'organization_contact':organization_connectivity,
//     'organization_other_contact':organization_other_contact,
//     'organization_bank_details':organization_bank_details,
//     'organization_focus':organization_focus,
// 'organization_donation_featured':organization_donation_featured,
//  'organization_donation_socialmedia_link': organization_donation_socialmedia_link,
    });
  }

  // Stream<QuerySnapshot>get infos
  // {
  //   return inforcollection.snapshots();
  // }

  Stream<List<Info>> get info {
    return inforcollection.snapshots().map(_infolistfromSnapshort);
  }

  List<Info> _infolistfromSnapshort(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Info(
        name: doc.get('name') ?? "",
        phone: doc.get('phone') ?? 0,
        city: doc.get('city') ?? "",
        age: doc.get('age') ?? "",
        // organization_name: doc.get('organization_name')??"",
      );
      // organization_location:doc.get('organization_location')??"",
      // organization_info:doc.get('organization_info')??"",
      // organization_connectivity:doc.get('organization_connectivity')??"",
      // organization_contact:doc.get('organization_contact')??"",
      // organization_other_contact:doc.get('organization_other_contact')??"",
      //   organization_bank_details:doc.get('organization_bank_details')??"",
      //   organization_focus:doc.get('organization_focus')??"",
      // organization_donation_featured:doc.get('organization_donation_featured')??"",
      // organization_donation_socialmedia_link:doc.get('organization_donation_socialmedia_link')??"");
    }).toList();
  }

  Stream<UserData> get userData {
    return inforcollection.doc(uid).snapshots().map(_userDataFromsnapshot);
  }

  UserData _userDataFromsnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot['name'],
      city: snapshot['city'],
      phone: snapshot['phone'],
      age: snapshot['age'],
      // organization_name:snapshot['organization_name'],
      // organization_location:snapshot['organization_location'],
      // organization_info:snapshot['organization_info'],
      // organization_connectivity:snapshot['organization_connectivity'],
      // organization_contact:snapshot['organization_contact'],
      // organization_other_contact:snapshot['organization_other_contact'],
      // organization_bank_details:snapshot['organization_bank_details'],
      // organization_focus:snapshot['organization_focus'],
      // organization_donation_featured:snapshot['organization_donation_featured'],
      // organization_donation_socialmedia_link:snapshot['organization_donation_socialmedia_link']);
    );
  }

  Stream<NgoData> get ngoData {
    return ngoinforcollection.doc(uid).snapshots().map(_ngoDataFromSnapshot);
  }

  Stream<List<Ngo>> get ngos {
    return ngoinforcollection.snapshots().map(_ngolistfromSnapshort);
  }

  NgoData _ngoDataFromSnapshot(DocumentSnapshot snapshot) {
    return NgoData(
        organization_bank_details: snapshot['organization_bank_details'],
        organization_connectivity: snapshot['organization_connectivity'],
        organization_contact: snapshot['organization_contact'],
        organization_donation_featured: snapshot['organization_donation_featured'],
        organization_donation_socialmedia_link: snapshot['organization_donation_socialmedia_link'],
        organization_focus: snapshot['organization_focus'],
        organization_info: snapshot['organization_info'],
        organization_location: snapshot['organization_location'],
        organization_name: snapshot['organization_name'],
        organization_other_contact: snapshot['organization_other_contact']);
  }

  Future updateNgoData(
      String organization_name,
      String organization_location,
      String organization_info,
      String organization_connectivity,
      String organization_contact,
      String organization_other_contact,
      String organization_bank_details,
      String organization_focus,
      String organization_donation_featured,
      String organization_donation_socialmedia_link) async {
    return await ngoinforcollection.doc(uid).set({
      'organization_name': organization_name,
      'organization_location': organization_location,
      'organization_info': organization_info,
      'organization_connectivity': organization_connectivity,
      'organization_contact': organization_contact,
      'organization_other_contact': organization_other_contact,
      'organization_bank_details': organization_bank_details,
      'organization_focus': organization_focus,
      'organization_donation_featured': organization_donation_featured,
      'organization_donation_socialmedia_link':
          organization_donation_socialmedia_link,
    });
  }

  List<Ngo> _ngolistfromSnapshort(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Ngo(
        organization_name: doc.get('organization_name')??"",
      organization_location:doc.get('organization_location')??"",
      organization_info:doc.get('organization_info')??"",
      organization_connectivity:doc.get('organization_connectivity')??"",
      organization_contact:doc.get('organization_contact')??"",
      organization_other_contact:doc.get('organization_other_contact')??"",
        organization_bank_details:doc.get('organization_bank_details')??"",
        organization_focus:doc.get('organization_focus')??"",
      organization_donation_featured:doc.get('organization_donation_featured')??"",
      organization_donation_socialmedia_link:doc.get('organization_donation_socialmedia_link')??"");
    }).toList();
  }
}

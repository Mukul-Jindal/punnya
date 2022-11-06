class UserUid
{
final String? uid;
UserUid({this.uid});
}

class UserData
{
  final String? uid;
  final String? name;
  final String? city;
  final String? phone;
  final String? age;



  UserData({this.uid, this.name, this.city, this.age, this.phone,

  });

}
class NgoData
{
  final String? uid;
  final String? organization_name;
  final String? organization_location;
  final String? organization_info;
  final String? organization_connectivity;
  final String? organization_contact;
  final String? organization_other_contact;
  final String? organization_bank_details;
  final String? organization_focus;
  final String? organization_donation_featured;
  final String? organization_donation_socialmedia_link;

  NgoData({ this.uid,   this.organization_bank_details, this.organization_connectivity,
 this.organization_contact, this.organization_donation_featured,
 this.organization_donation_socialmedia_link, this.organization_focus,
 this.organization_info, this.organization_location,
 this.organization_name,
 this.organization_other_contact});
}

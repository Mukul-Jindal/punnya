class Info {
  final String name;
  final String phone;
  final String city;
  final String age;

  Info({
    required this.name,
    required this.phone,
    required this.city,
    required this.age,
  });
}

class Ngo {
  final String organization_name;
  final String organization_location;
  final String organization_info;
  final String organization_connectivity;
  final String organization_contact;
  final String organization_other_contact;
  final String organization_bank_details;
  final String organization_focus;
  final String organization_donation_featured;
  final String organization_donation_socialmedia_link;

  Ngo(
      {required this.organization_bank_details,
      required this.organization_connectivity,
      required this.organization_contact,
      required this.organization_donation_featured,
      required this.organization_donation_socialmedia_link,
      required this.organization_focus,
      required this.organization_info,
      required this.organization_location,
      required this.organization_name,
      required this.organization_other_contact});
}

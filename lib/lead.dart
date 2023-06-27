class Lead {
  String name;
  String mobile;
  String secondary;
  String email;
  String address;
  String leadpin;
  String company;
  String experience;
  String salary;
  String companyaddress;
  String companypin;
  String city;
  String dealamount;
  String servicetype;
  String sourcetype;
  String followdate;
  String followtime;
  String leadstatus;
  String remarks;

  Lead(
      {required this.name,
      required this.mobile,
      required this.secondary,
      required this.email,
      required this.address,
      required this.leadpin,
      required this.company,
      required this.experience,
      required this.salary,
      required this.companyaddress,
      required this.companypin,
      required this.city,
      required this.dealamount,
      required this.servicetype,
      required this.sourcetype,
      required this.followdate,
      required this.followtime,
      required this.leadstatus,
      required this.remarks});

  static Lead fromJson(Map<String, dynamic> json) => Lead(
      name: json['Lead Name'],
      address: json['Address'],
      companyaddress: json['Comapany Address'],
      company: json['Company Name'],
      city: json['Company City'],
      companypin: json['Company Pincode'],
      dealamount: json['Deal Amount'],
      email: json['Email'],
      experience: json['Experience'],
      followdate: json['Follow Up Date'],
      followtime: json['Follow Up Time'],
      leadstatus: json['Lead Status'],
      mobile: json['Mobile'],
      leadpin: json['Pincode'],
      remarks: json['Remarks'],
      salary: json['Salary'],
      secondary: json['Secondary Mobile'],
      servicetype: json['Service Type'],
      sourcetype: json['Source Type']);

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Mobile': mobile,
        'Secondary': secondary,
        'E mail': email,
        'Address': address,
        'Lead Pincode': leadpin,
        'Company': company,
        'Experience': experience,
        'Salary': salary,
        'Company Address': companyaddress,
        'Company Pincode': companypin,
        'City': city,
        'Deal Amount': dealamount,
        'Service type': servicetype,
        'Source Type': sourcetype,
        'Follow Up Date': followdate,
        'Follow Up Time': followtime,
        'Lead Status': leadstatus,
        'Remarks': remarks
      };
}

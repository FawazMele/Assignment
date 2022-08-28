class User {
  //creating the pojo as per the JSON requires
   late int id = 0;
   late String name;
   late String username ;
   late String email;
   late String phone;
   late String website;

  User.fromJson(Map<String, dynamic> json) {
    //using mapping from json
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];

  }

  Map<String, dynamic> toJson() {
    //using mapping to json
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['website'] = this.website;
    return data;
  }
}


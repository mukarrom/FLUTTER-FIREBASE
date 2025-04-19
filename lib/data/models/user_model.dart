class UserModel {
  String? name;
  String? email;
  String? photoUrl;
  String? uid;

  UserModel({this.name, this.email, this.photoUrl, this.uid});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
    uid = json['uid'];
  }
}

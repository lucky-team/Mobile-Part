class login {
  final String uid;
  final String pswd;

  login(this.uid, this.pswd);

  login.fromJson(Map<Object, dynamic> json)
      : uid = json['userId'],
        pswd = json['Password'];

  Map<String, dynamic> toJson() =>
      {
        'userId': uid,
        'Password': pswd,
      };
}
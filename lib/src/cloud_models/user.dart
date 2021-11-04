
import 'dart:math';

class User {
  String idUser;
  String? publicKey;
  String? access;
  DateTime? lastSeen;
  DateTime? expires;
  String? name;
  String? email;

  User({
    required this.idUser,
    this.publicKey,
    this.access,
    this.lastSeen,
    this.expires,
    this.name,
    this.email
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User (
      idUser: json['id_user'],
      publicKey: json['public_key'],
      access: json['access'],
      lastSeen: json['last_seen'],
      expires: json['expires'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_user'] = idUser;
    data['public_key'] = publicKey;
    data['access'] = access;
    data['last_seen'] = lastSeen;
    data['expires'] = expires;
    data['name'] = name;
    data['email'] = email;
    return data;
  }

  String get getIdUser => idUser;
  set setIdUser(String idUser) => this.idUser = idUser;

  String? get getPublicKey => publicKey;
  set setPublicKey(String publicKey) => this.publicKey = publicKey;

  String? get getAccess => access;
  set setAccess(String access) => this.access = access;

  DateTime? get getLastSeen => lastSeen;
  set setLastSeen(DateTime lastSeen) => this.lastSeen = lastSeen;

  DateTime? get getExpires => expires;
  set setExpires(DateTime expires) => this.expires = expires;

  String? get getName => name;
  set setName(String name) => this.name = name;

  String? get getEmail => email;
  set setEmail(String email) => this.email = email;

}
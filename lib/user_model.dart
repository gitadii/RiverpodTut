import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

@immutable
class UserModel {
  final String name;
  final int id;
  final String email;

  const UserModel({
    required this.name,
    required this.id,
    required this.email,
  });

  UserModel copyWith({
    String? name,
    int? id,
    String? email,
  }) {
    return UserModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      id: map['id'] as int,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, id: $id, email: $email)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.id == id && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ email.hashCode;
}

// // Creating a Notifier class which will contain all the methods to update the values of the usermodel
// class UserNotifier extends StateNotifier<UserModel> {
//   UserNotifier()
//       : super(
//           const UserModel(
//             name: '',
//             age: 0,
//             gender: '',
//           ),
//         );

//   void updateName(String newName) {
//     state = state.copyWith(name: newName);
//   }
// }

// class UserChangeNotifier extends ChangeNotifier {
//   UserChangeNotifier();

//   UserModel userModel = const UserModel(name: '', age: 0, gender: '');

//   void updateName(String newName) {
//     userModel = userModel.copyWith(name: newName);
//     notifyListeners(); // It uses this function to notify all the listeners and run the build function again.
//   }
// }

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<UserModel> fetchUserData() {
    // Retrieving the data from url
    const url = 'https://jsonplaceholder.typicode.com/users/1';
    return http
        .get(Uri.parse(url))
        .then((value) => UserModel.fromJson(value.body));
  }
}

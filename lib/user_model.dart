import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class UserModel {
  final String name;
  final int age;
  final String gender;

  const UserModel({
    required this.name,
    required this.age,
    required this.gender,
  });

  UserModel copyWith({
    String? name,
    int? age,
    String? gender,
  }) {
    return UserModel(
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}

// Creating a Notifier class which will contain all the methods to update the values of the usermodel
class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier()
      : super(
          const UserModel(
            name: '',
            age: 0,
            gender: '',
          ),
        );

  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }
}

class UserChangeNotifier extends ChangeNotifier {
  UserChangeNotifier();

  UserModel userModel = const UserModel(name: '', age: 0, gender: '');

  void updateName(String newName) {
    userModel = userModel.copyWith(name: newName);
    notifyListeners(); // It uses this function to notify all the listeners and run the build function again.
  }
}

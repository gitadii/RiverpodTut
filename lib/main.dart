import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/home_screen.dart';
import 'package:riverpod_tut/user_model.dart';

// // StateNotifier and StateNotifierProvider
// final userProvider = StateNotifierProvider<UserNotifier, UserModel>(
//   (ref) => UserNotifier(),
// );

// // ChangeNotifierProvider
// final userChangeNotifierProvidre = ChangeNotifierProvider(
//   (ref) => UserChangeNotifier(),
// );

final fetchUserProvider = FutureProvider((ref) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserData();
});

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

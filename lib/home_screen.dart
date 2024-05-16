import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tut/main.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

// On submit
  void onSubmit(WidgetRef ref, String name) {
    // ref.read(userProvider.notifier).updateName(name);
    ref.read(userChangeNotifierProvidre).updateName(name);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider);
    final user = ref.watch(userChangeNotifierProvidre).userModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(user.name),
            TextField(
              onSubmitted: (value) => onSubmit(ref, value),
            ),
          ],
        ),
      ),
    );
  }
}

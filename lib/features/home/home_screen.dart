import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
           Text("Home"),
          // ElevatedButton(
          //   onPressed: () {
          //     _secureStorage.deleteOne(key: "CURRENT_USER").then(
          //           (_) =>
          //               Navigator.popAndPushNamed(context, NamedRoute.initial),
          //         );
          //   },
          //   child: const Text("Logout"),
          // ),
        ],
      )),
    );
  }
}

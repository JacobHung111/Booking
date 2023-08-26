import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static const String path = "/changeProfile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: const Center(child: Text("Profile Page")));
  }
}

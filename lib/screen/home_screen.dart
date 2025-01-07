import 'package:flutter/material.dart';
import 'package:project_baru_tes/widget/my_gradient_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyGradientContainer(
        height: 300,
        width: 300,
        child: Center(
          child: Text("Welcome to my app"),
        ),
      ),
    );
  }
}

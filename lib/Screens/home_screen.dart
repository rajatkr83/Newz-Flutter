import 'package:flutter/material.dart';
import 'package:newz/components/homescreen_body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HomeScreenBody(),
      ),
    );
  }
}
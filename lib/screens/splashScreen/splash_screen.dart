import 'dart:async';

import 'package:buenos_transportation/providers/stateSettingProvider/state_setting_provider.dart';
import 'package:buenos_transportation/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void dispose() {
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 170.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    Provider.of<StateSettingProvider>(context, listen: false).homeSelected =
        true;
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Home())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
            height: animation.value,
            width: animation.value,
            child: Image.asset(
              'assets/buenos_logo.png',
              fit: BoxFit.contain,
            )),
      ),
    );
  }
}

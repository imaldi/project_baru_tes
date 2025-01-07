import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_baru_tes/screen/login_screen.dart';
import 'package:project_baru_tes/state_management/login_cubit.dart';
import 'package:project_baru_tes/widget/my_gradient_container.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Future.delayed(Duration(seconds: 2),(){
        context.read<LoginCubit>().checkIsLogin();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (ctx, state) {
      state.maybeWhen(
          loggedIn: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          orElse: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          });
    }, builder: (ctx, state) {
      return Scaffold(
        body: Center(
          child: MyGradientContainer(
            height: 300,
            width: 300,
            child: Center(child: Text("Splash Screen", style: TextStyle(fontSize: 32.0),)),
          ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_baru_tes/screen/login_screen.dart';
import 'package:project_baru_tes/state_management/login_cubit.dart';
import 'package:project_baru_tes/widget/my_gradient_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<LoginCubit>().checkIsLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (ctx, state) {
      state.maybeWhen(
          loggedIn: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          orElse: () {});
    }, builder: (ctx, state) {
      return MyGradientContainer(
        height: 300,
        width: 300,
        child: Text("Splash Screen"),
      );
    });
  }
}

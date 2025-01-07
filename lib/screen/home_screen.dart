import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_baru_tes/state_management/login_cubit.dart';
import 'package:project_baru_tes/widget/my_gradient_container.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
            loggedOut: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            orElse: (){});
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(
                    onTap: () {
                      context.read<LoginCubit>().logOut();
                    },
                    child: Icon(Icons.logout)),
              )
            ],
          ),
          body: Center(
            child: MyGradientContainer(
              height: 300,
              width: 300,
              child: Center(
                child: Text("Welcome to my app"),
              ),
            ),
          ),
        );
      },
    );
  }
}

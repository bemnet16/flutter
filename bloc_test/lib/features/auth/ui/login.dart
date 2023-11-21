import 'package:bloc_test/features/auth/ui/widgets/button.dart';
import 'package:bloc_test/features/giveaway/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_route_const.dart';
import '../bloc/auth_bloc.dart';
import 'constants/colors.dart';

class LoginPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if(state is AuthChecked){
            if(state.user.role=="student"){
              GoRouter.of(context).goNamed(MyAppRouteConstants.bottomBarRouteName);
            }
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/back.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: backcolor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 30.0),
                        const Icon(Icons.lock, size: 100),
                        const SizedBox(height: 30.0),
                        CustomTextField(
                            controller: userNameController,
                            hintText: 'Enter your username',
                            obscureText: false),
                        const SizedBox(height: 30.0),
                        CustomTextField(
                            controller: passwordController,
                            hintText: 'Enter your password',
                            obscureText: true),
                        const SizedBox(height: 50.0),
                        ElevatedButton(
                          onPressed: () {
                            handleLogin(context);
                          },
                          child: null,
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Already have an account?'))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void handleLogin(context) {
    BlocProvider.of<AuthBloc>(context).add(LoginEvent(
        email: userNameController.text, password: passwordController.text));
  }
}

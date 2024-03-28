import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentak/Resources/Managers/colors_manager.dart';
import 'package:rentak/Resources/Managers/routes_manager.dart';

import 'package:rentak/cubit/Login/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _login(state) {
    BlocProvider.of<LoginCubit>(context).login();
    // if (state is LoginLoading) {
    //   Navigator.pushReplacementNamed(context, Routes.mainRoute);
    // }
  }

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<LoginCubit>(context).stream.listen((state) {
    //   if (state is LoginLoading) {
    //     Navigator.pushReplacementNamed(context, Routes.mainRoute);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Form'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                Navigator.pushReplacementNamed(context, Routes.mainRoute);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: context.read<LoginCubit>().emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      errorText: state is LoginError ? state.emailError : null,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: context.read<LoginCubit>().passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      errorText: state is LoginError ? state.passError : null,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _login(state);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: ColorManager.White),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}



// //BlocConsumer<LoginCubit, LoginState>(
//         listener: (context, state) {
//           if (state is LoginLoading) {
//             Navigator.pushReplacementNamed(context, Routes.mainRoute);
//           }
//         },
//         builder: (context, state) {
//           return
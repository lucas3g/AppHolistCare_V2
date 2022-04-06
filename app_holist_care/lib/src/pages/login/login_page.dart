import 'dart:async';

import 'package:app_holist_care/src/blocs/login_bloc.dart';
import 'package:app_holist_care/src/events/login_events.dart';
import 'package:app_holist_care/src/states/login_states.dart';
import 'package:app_holist_care/theme/app_theme.dart';
import 'package:app_holist_care/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;
  late StreamSubscription sub;
  final controllerText = TextEditingController();

  @override
  void initState() {
    super.initState();

    bloc = GetIt.I.get<LoginBloc>();

    sub = bloc.stream.listen((state) async {
      if (state is LoginSuccesState) {
        await Future.delayed(const Duration(seconds: 1));
        await Navigator.pushReplacementNamed(context, '/scan');
      } else if (state is LoginErrorState) {
        print('Erro ao logar');
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.backgroundPrimary,
        elevation: 0,
        toolbarHeight: 100,
        title: Row(
          children: [
            Expanded(
              child: Image.asset('assets/images/logo.png'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Digite o código de acesso',
                style: TextStyle(
                  color: Color(0xFFDDB97C),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: controllerText,
                maxLength: 8,
                decoration: InputDecoration(
                  isDense: true,
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.qr_code,
                  ),
                  hintText: 'Código',
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Color(0xFFDDB97C),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              BlocBuilder<LoginBloc, LoginStates>(
                  bloc: bloc,
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        bloc.add(SignInEvent(code: controllerText.text));
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        height: 40,
                        width: state is LoginLoadingState ||
                                state is LoginSuccesState
                            ? 40
                            : context.screenWidth,
                        duration: const Duration(milliseconds: 500),
                        decoration: BoxDecoration(
                            color: AppTheme.colors.primary,
                            borderRadius: BorderRadius.circular(
                                state is LoginLoadingState ||
                                        state is LoginSuccesState
                                    ? 50
                                    : 10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 1,
                                color: AppTheme.colors.primary,
                                offset: const Offset(0, 2),
                              )
                            ]),
                        child: Stack(
                          children: [
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: state is LoginLoadingState ||
                                      state is LoginSuccesState
                                  ? 0
                                  : 1,
                              child: Center(
                                child: FittedBox(
                                  child: Row(
                                    children: [
                                      const Icon(Icons.login),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Entrar',
                                        style: AppTheme.textStyles.button
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: state is LoginLoadingState ||
                                      state is LoginSuccesState
                                  ? 1
                                  : 0,
                              child: Center(
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: state is LoginLoadingState
                                      ? CircularProgressIndicator(
                                          color: AppTheme.colors.button,
                                        )
                                      : Icon(
                                          Icons.check_rounded,
                                          color: AppTheme.colors.button,
                                          size: 25,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

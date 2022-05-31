import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/app/blocs/sign_in/sign_in_importer.dart';
import 'package:sample_auth/app/router/app_pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppPages.home.toTitle)),
      body: Center(
        child: ElevatedButton(
            // サインアウトイベントを呼び出す
            onPressed: () =>
                BlocProvider.of<SignInBloc>(context).add(SignOut()),
            child: const Text("サインアウト")),
      ),
    );
  }
}

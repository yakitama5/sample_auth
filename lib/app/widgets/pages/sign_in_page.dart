import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_auth/app/blocs/sign_in/sign_in_importer.dart';
import 'package:sample_auth/app/router/app_pages.dart';
import 'package:sample_auth/app/widgets/components/progress_dialog.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInStateProgress) {
          ProgressDialog.show(context);
        } else {
          ProgressDialog.hide(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text(AppPages.signin.toTitle)),
        body: Center(
          child: ElevatedButton(
              // 認証イベントを呼び出す
              onPressed: () => BlocProvider.of<SignInBloc>(context)
                  .add(SignInWithAnonymous()),
              child: const Text("匿名サインイン")),
        ),
      ),
    );
  }
}

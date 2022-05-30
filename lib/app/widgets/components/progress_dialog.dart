import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  static void show(BuildContext context, {key}) => showDialog(
        context: context,
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (_) => const ProgressDialog(),
      ).then((value) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pop();

  const ProgressDialog({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
      onWillPop: () async => false,
    );
  }
}

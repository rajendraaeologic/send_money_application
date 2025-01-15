import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final List<Widget>? actions;
  final bool showBackButton;

  const BaseScaffold({
    super.key,
    required this.body,
    this.appBarTitle = '',
    this.actions,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitle.isNotEmpty
            ? Text(appBarTitle)
            : null,
        leading: showBackButton
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ) : const SizedBox(),
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
    );
  }
}

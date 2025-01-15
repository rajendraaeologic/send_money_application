import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final List<Widget>? actions;

  // Constructor to accept the parameters
  const BaseScaffold({
    super.key,
    required this.body,
    this.appBarTitle = '', // Default to an empty string if no title is passed
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: appBarTitle.isNotEmpty
            ? Text(appBarTitle) // Show title only if it is not empty
            : null,
        actions: actions, // Allows customization of the app bar actions
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body, // Dynamic body passed from the child widget
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RiverpodDefalutLayout extends StatelessWidget {

  final String title;
  final Widget body;
  final List<Widget>? actions;


  const RiverpodDefalutLayout({
    required this. title,
    required this. body,
    this.actions,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),actions: actions,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: body,
      ),
    );
  }
}

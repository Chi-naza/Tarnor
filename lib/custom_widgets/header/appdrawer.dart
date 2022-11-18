import 'package:flutter/material.dart';
class mydrawer extends StatefulWidget {
  const mydrawer({ Key? key }) : super(key: key);

  @override
  State<mydrawer> createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Text("Tanor Menu"),
      
    );
  }
}
import 'package:evento/pages/homepage.dart';
import 'package:evento/sidebar/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HomePage(),
          SideBar()
        ],
      ),
    );
  }
}

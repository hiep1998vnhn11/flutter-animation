import 'package:snest_animation/app_theme.dart';
import 'package:snest_animation/custom_drawer/drawer_user_controller.dart';
import 'package:snest_animation/custom_drawer/home_drawer.dart';
import 'package:snest_animation/feedback_screen.dart';
import 'package:snest_animation/help_screen.dart';
import 'package:snest_animation/home_screen.dart';
import 'package:snest_animation/invite_friend_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.home;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: changeIndex,
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.home) {
        setState(() {
          screenView = const MyHomePage();
        });
      } else if (drawerIndex == DrawerIndex.help) {
        setState(() {
          screenView = const HelpScreen();
        });
      } else if (drawerIndex == DrawerIndex.feedback) {
        setState(() {
          screenView = const FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.invite) {
        setState(() {
          screenView = const InviteFriend();
        });
      } else {
        //do in your way......
      }
    }
  }
}

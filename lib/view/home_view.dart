import 'package:chat_2gether/utils/color_constants.dart';
import 'package:chat_2gether/view/call_view.dart';
import 'package:chat_2gether/view/chat_view.dart';
import 'package:chat_2gether/view/create_chat_view.dart';
import 'package:chat_2gether/view/gallery_view.dart';
import 'package:chat_2gether/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const ChatView(),
      const CallView(),
      const CreateChatView(),
      const GalleryView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat),
        title: "Chat",
        activeColorPrimary: ColorConstants.blueRuin,
        inactiveColorPrimary: ColorConstants.freinachtBlack,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.call),
        title: "Call",
        activeColorPrimary: ColorConstants.blueRuin,
        inactiveColorPrimary: ColorConstants.freinachtBlack,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        activeColorPrimary: ColorConstants.white,
        inactiveColorPrimary: ColorConstants.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.browse_gallery),
        title: "Gallery",
        activeColorPrimary: ColorConstants.blueRuin,
        inactiveColorPrimary: ColorConstants.freinachtBlack,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.face_outlined),
        title: "Profile",
        activeColorPrimary: ColorConstants.blueRuin,
        inactiveColorPrimary: ColorConstants.freinachtBlack,
      ),
    ];
  }

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      backgroundColor: ColorConstants.blackIsBack,
      items: _navBarItems(),
    );
  }
}

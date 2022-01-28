import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_template/app/modules/grocery/presentation/pages/grocery_list_page.dart';
import 'package:grocery_template/app/modules/settings/presentation/pages/settings_page.dart';
import 'package:grocery_template/app/ui/color_helper.dart';
import 'package:grocery_template/app/ui/controllers/theme_controller.dart';
import 'package:grocery_template/generated/l10n.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Get.find<ThemeController>().setThemeData(context);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: ColorHelper.lightColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: ColorHelper.lightColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const GroceryListPage(),
      const SettingsPage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.list_bullet),
        title: (S.of(context).groceries),
        activeColorPrimary: ColorHelper.primaryColor,
        inactiveColorPrimary: ColorHelper.greyColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: (S.of(context).settings),
        activeColorPrimary: ColorHelper.primaryColor,
        inactiveColorPrimary: ColorHelper.greyColor,
      ),
    ];
  }
}

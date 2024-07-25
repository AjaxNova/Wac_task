import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wac_machine_test/constatns/constants.dart';
import 'package:wac_machine_test/view/pages/categories_page.dart';
import 'package:wac_machine_test/view/pages/home_screeen.dart';
import 'package:wac_machine_test/view/widgets/app_bar_notification_widget.dart';
import 'package:wac_machine_test/view/widgets/appbar_textfield_widget.dart';
import 'package:wac_machine_test/viewModel/provider/home_screen_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<HomeScreenProvider>(context, listen: false)
        .fetchFromApi(context: context);
  }

  final List<Widget> pages = [
    const HomeScreenBottomTab(),
    const StaticPage(staticText: "categories"),
    const StaticPage(staticText: 'cart'),
    const StaticPage(staticText: "offers"),
    const StaticPage(staticText: "Account")
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 35,
            toolbarHeight: 56,
            backgroundColor: appbarColor,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                "assets/icons/shoping_cart_icon.png",
                height: 35,
                width: 36,
                fit: BoxFit.cover,
              ),
            ),
            title: const AppBarSearchField(),
            actions: const [AppBarNotificationWidget()],
          ),
          bottomNavigationBar: MoltenBottomNavigationBar(
            borderRaduis: const BorderRadius.all(Radius.zero),
            barColor: const Color(0xFFDCDCDC),
            domeCircleColor: Colors.green,
            domeCircleSize: 40,
            tabs: [
              MoltenTab(
                title: const Text("Home"),
                icon: const Icon(Icons.home),
              ),
              MoltenTab(
                title: const Text("category"),
                icon: const Icon(Icons.menu),
              ),
              MoltenTab(
                title: const Text("Cart"),
                icon: const Icon(Icons.shopping_cart),
              ),
              MoltenTab(
                title: const Text("Offers"),
                icon: const Icon(Icons.percent),
              ),
              MoltenTab(
                title: const Text("Account"),
                icon: const Icon(Icons.person),
              ),
            ],
            selectedIndex: value.currentBottomIndex,
            onTabChange: (index) {
              value.changeBottomIndex(index);
            },
          ),
          body: pages[value.currentBottomIndex],
        );
      },
    );
  }
}

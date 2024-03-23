import 'package:animate_do/animate_do.dart';
import 'package:binbear/ui/base_components/animated_list_builder.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/bookings_tile.dart';
import 'package:binbear/ui/base_components/smart_refresher_base_header.dart';
import 'package:binbear/ui/bookings_tab/components/bookings_tabbar.dart';
import 'package:binbear/ui/bookings_tab/components/my_bookings_shimmer.dart';
import 'package:binbear/ui/bookings_tab/components/my_bookings_tab_view.dart';
import 'package:binbear/ui/bookings_tab/controller/bookings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingsTab extends StatefulWidget {
  const BookingsTab({super.key});

  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  BookingsController controller = Get.put(BookingsController());
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: BaseAppBar(
            title: "My Bookings",
            showNotification: true,
            showDrawerIcon: true,
            bottomWidgetHeight: 70,
            bottomChild: FadeInDown(
              duration: const Duration(milliseconds: 400),
              child: BookingsTabBar(),
            ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: const [
            MyBookingsTabView(),
            MyBookingsTabView(),
          ],
        )
      ),
    );
  }
}

import 'package:binbear/ui/base_components/animated_list_builder.dart';
import 'package:binbear/ui/base_components/base_app_bar.dart';
import 'package:binbear/ui/base_components/base_scaffold_background.dart';
import 'package:binbear/ui/base_components/bookings_tile.dart';
import 'package:binbear/ui/bookings_tab/components/bookings_tabbar.dart';
import 'package:binbear/ui/bookings_tab/controller/bookings_controller.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
      child: BaseScaffoldBackground(
        child: Scaffold(
            appBar: BaseAppBar(
              title: "My Bookings",
              showNotification: true,
              showDrawerIcon: true,
              bottomWidgetHeight: 70,
              bottomChild: BookingsTabBar(),
          ),
          body: TabBarView(
            controller: controller.tabController,
            children: [
              AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, bottom: 80),
                  itemBuilder: (context, index){
                    return AnimatedListBuilder(
                      index: index,
                      child: const BookingListTile(
                        bottomMargin: 18,
                        isPastBooking: false,
                        location: "123, bellaforte, USA",
                        date: "01-16-2024",
                        time: "Between 6 PM prior evening to 6 AM Service Day",
                        distance: "3",
                      ),
                    );
                  },
                ),
              ),
              AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  padding: const EdgeInsets.only(right: horizontalScreenPadding, left: horizontalScreenPadding, bottom: 80),
                  itemBuilder: (context, index){
                    return AnimatedListBuilder(
                      index: index,
                      child: const BookingListTile(
                        bottomMargin: 18,
                        isPastBooking: true,
                        location: "123, bellaforte, USA",
                        date: "01-16-2024",
                        time: "Between 6 PM prior evening to 6 AM Service Day",
                        distance: "3",
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
